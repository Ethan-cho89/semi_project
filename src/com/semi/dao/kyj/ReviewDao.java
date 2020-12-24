package com.semi.dao.kyj;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.util.db.DBCPBean;
import com.semi.domain.kyj.ReviewVo;

public class ReviewDao {
	
	public int getCount(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con=DBCPBean.getConn();
			String sql = "select NVL(count(rnum),0) cnt from tbl_review where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			return cnt;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con,pstmt,rs);
		}
	}
	
	public ArrayList<ReviewVo> reviewlist(String id ,int startRow ,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
			
		try {
			con=DBCPBean.getConn();
			String sql = "select * from(\r\n" + 
					"    select a.*,rownum rnum from(\r\n" + 
					"        select i.name iname,o.mid omid,r.rate rrate,r.regdate rrd,r.content rct,r.onum onum,i.num inum\r\n" + 
					"        from tbl_stock s,tbl_item i , tbl_review r , tbl_order o\r\n" + 
					"        where o.snum=s.snum and s.inum=i.num and o.num=r.onum and o.mid=?\r\n" + 
					"        order by r.regdate desc\r\n" + 
					"    )a\r\n" + 
					")where rnum>=? and rnum<=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			rs = pstmt.executeQuery();
			ArrayList<ReviewVo> reviewlist=new ArrayList<ReviewVo>();
			while(rs.next()) {
				String iname = rs.getString("iname");
				String omid=rs.getString("omid");
				String rct = rs.getString("rct");
				int rrate = rs.getInt("rrate");
				Date rrd = rs.getDate("rrd");
				int onum = rs.getInt("onum");
				int inum = rs.getInt("inum");
				
				ReviewVo vo = new ReviewVo(iname,omid,rct,rrate,rrd,onum,inum);
				reviewlist.add(vo);
			}
			return reviewlist;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public int write(String id,int onum,int rate,String content,int inum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		String sql="insert into tbl_review values(seq_rev.nextval,?,?,?,?,sysdate)";
		String sql2="update tbl_order set revcheck=1 where num=?";
		String sql3="update tbl_item\r\n" + 
				"set review =review+1 , avgrate = ((avgrate*review)+?)/(review+1)\r\n" + 
				"where num=?";
		try {
			con=DBCPBean.getConn();
			
			pstmt=con.prepareStatement(sql);
			pstmt2=con.prepareStatement(sql2);
			pstmt3=con.prepareStatement(sql3);
			pstmt.setString(1,id);
			pstmt.setInt(2,onum);
			pstmt.setInt(3,rate);
			pstmt.setString(4,content);
			pstmt2.setInt(1, onum);
			pstmt3.setInt(1, rate);
			pstmt3.setInt(2, inum);
			int n=pstmt.executeUpdate()+pstmt2.executeUpdate()+pstmt3.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con,pstmt,pstmt2,pstmt3);
		}
	}
	
	public int delete(int onum,String id,int inum,int rate) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		String sql="delete from tbl_review where onum=? and id=?";
		String sql2 ="update tbl_order set revcheck=0 where num=? and mid=?";
		String sql3="update tbl_item\r\n" + 
				"set review = review-1, avgrate = ((avgrate*review)-?)/(review-1)\r\n" + 
				"where num=?;";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt2=con.prepareStatement(sql2);
			pstmt3=con.prepareStatement(sql3);
			pstmt.setInt(1,onum);
			pstmt.setString(2,id);
			pstmt2.setInt(1,onum);
			pstmt2.setString(2,id);
			pstmt3.setInt(1,rate);
			pstmt3.setInt(2,inum);
			int n=pstmt.executeUpdate()+pstmt2.executeUpdate()+pstmt3.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,pstmt2,pstmt3);
		}
	}
}

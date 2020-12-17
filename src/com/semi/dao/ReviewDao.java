package com.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.domain.ReviewVo;
import com.semi.util.db.DBCPBean;

public class ReviewDao {
	private static ReviewDao instance = new ReviewDao();
	
	private ReviewDao() {}
	
	public static ReviewDao getDao() {
		return instance;
	}
	
	public int aveRate(int inum) { // 상품에 달린 평점
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try{
			con= DBCPBean.getConn();
			String sql ="select avgrate from tbl_item where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, inum);			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}else {
				return 0;
			}
		}catch(SQLException s){
			s.printStackTrace();
			return -1;
		}finally{
			DBCPBean.close(con, pstmt, rs);
		}
	
	}
	
	public ArrayList<ReviewVo> reviews(int n){ //작성자 + 리뷰내용 + 리뷰당 먹힌 점수
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try{
			con= DBCPBean.getConn();
			String sql ="select aa.inum, aa.name, r.id, r.rate, r.content, r.regdate from tbl_review r join " + 
					"( " + 
					"    select o.num, a.num inum, a.name from tbl_order o join " + 
					"    ( " + 
					"        select s.snum, i.num, i.name from tbl_stock s join tbl_item i on i.num = s.inum  where i.num=? " + 
					"    )a on o.snum=a.snum " + 
					")aa on aa.num= r.onum";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, n);
			rs = pstmt.executeQuery();
			ArrayList<ReviewVo> list = new ArrayList<ReviewVo>();
			while(rs.next()) {
				int inum= rs.getInt("inum");
				String iname= rs.getString("name");
				String id = rs.getString("id");
				int rate = rs.getInt("rate");
				String content = rs.getString("content");
				Date regdate = rs.getDate("regdate");
				ReviewVo vo = new ReviewVo(inum, iname, id, rate, content, regdate);
				list.add(vo);
			}
			return list;
		}catch(SQLException s){
			s.printStackTrace();
			return null;
		}finally{
			DBCPBean.close(con, pstmt, rs);
		}
	
	}
}

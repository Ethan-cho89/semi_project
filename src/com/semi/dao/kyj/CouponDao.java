package com.semi.dao.kyj;

import java.sql.Connection;



import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.util.db.DBCPBean;
import com.semi.domain.kyj.CouponVo;

public class CouponDao {
	
	public int getCount(String hid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con=DBCPBean.getConn();
			String sql = "select NVL(count(num),0) cnt from tbl_coupholder where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, hid);
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
	
	public ArrayList<CouponVo> couponlist(String hid ,int startRow ,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
			
		try {
			con=DBCPBean.getConn();
			String sql = "select * from(\r\n" + 
					"    select a.*,rownum rnum from(\r\n" + 
					"        select c.name cname,c.dcrate cd,c.stdate csd,c.exdate ced,h.used hu,h.id hid\r\n" + 
					"        from tbl_coupon c, tbl_coupholder h\r\n" + 
					"        where h.id=? and c.num=h.num\r\n" + 
					"        order by c.exdate asc\r\n" + 
					"    )a\r\n" + 
					")where rnum>=? and rnum<=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hid);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			rs = pstmt.executeQuery();
			ArrayList<CouponVo> couponlist=new ArrayList<CouponVo>();
			while(rs.next()) {
				String cname = rs.getString("cname");
				int cd=rs.getInt("cd");
				int hu=rs.getInt("hu");
				Date csd = rs.getDate("csd");
				Date ced = rs.getDate("ced");
				hid = rs.getString("hid");
				
				CouponVo vo = new CouponVo(cname,cd,hu,csd,ced,hid);
				couponlist.add(vo);
			}
			return couponlist;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
}

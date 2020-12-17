package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.util.db.DBCPBean;

public class OrderDao {
	private static OrderDao instance = new OrderDao();
	
	private OrderDao() {}
	
	public static OrderDao getDao() {
		return instance;
	}
	
	
	public int change(int num, int status) {
		Connection con =null;
		PreparedStatement pstmt= null;
		try {
			con=DBCPBean.getConn();
			String sql = "update tbl_order set ship=? where num =?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, num);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	public int getStatus(int num) { //나중에 붙일때 필요할거 같아서 일단 만들어 놨습니다~
		Connection con =null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select ship from tbl_order where num =?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}else {
				return 0;
			}
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	
}

package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import com.semi.util.db.DBCPBean;


public class LoginDao {
	
	public boolean isMember(HashMap<String, String> map) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=DBCPBean.getConn();
		String sql="select * from tbl_member where id=? and pwd=?";
		pstmt=con.prepareStatement(sql);
		String id=map.get("id");
		pstmt.setString(1, id);
		pstmt.setString(2, map.get("pwd"));
		rs=pstmt.executeQuery();
		if(rs.next()) {
			if(!(rs.getInt("status")==0)) {
				return true;
			}
			return false;
		}else {
			return false;
		}
		
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
				
	}
}

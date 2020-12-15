package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.domain.Member;
import com.semi.util.db.DBCPBean;

public class MemberDao {
	public int insert(Member mem) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into tbl_member values(?,?,?,?,sysdate,?,1)";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mem.getId());
			pstmt.setString(2,mem.getPwd());
			pstmt.setString(3,mem.getPhone());
			pstmt.setString(4,mem.getNick());
			pstmt.setInt(5,mem.getEokay());
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,null);
		}
	}
}

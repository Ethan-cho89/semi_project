package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	public static String randomPassword(int length){
		int index = 0;
		char[] charset = new char[] {
		'0','1','2','3','4','5','6','7','8','9'
		,'A','B','C','D','E','F','G','H','I','J','K','L','M'
		,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
		,'a','b','c','d','e','f','g','h','i','j','k','l','m'
		,'n','o','p','q','r','s','t','u','v','w','x','y','z'
		};
		StringBuffer sb = new StringBuffer();
		for(int i = 0 ; i<length ; i++){
		index = (int) (charset.length * Math.random());
		sb.append(charset[index]);
		}
		return sb.toString();
		}
	
	public boolean getinfo(String id,String phone,String nick) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from tbl_member where id=? and phone=? and nick=?";
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,phone);
			pstmt.setString(3,nick);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
			return false;
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	public String updatepwd(Member mem) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update tbl_member set pwd=? where id=? and phone=? and nick=?";
		String pwd=randomPassword(10);
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,pwd);
			pstmt.setString(2,mem.getId());
			pstmt.setString(3,mem.getPhone());
			pstmt.setString(4,mem.getNick());
			pstmt.executeUpdate();
			return pwd;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt,null);
		}
	}

	public Member mygetinfo(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from tbl_member where id=?";
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				 Member mem1=new Member(
						 rs.getString("id"),
						 rs.getString("pwd"), 
						 rs.getString("phone"),
						 rs.getString("nick"), 
						 rs.getDate("regdate"), 
						 rs.getInt("eokay"),
						 rs.getInt("status"));
				return mem1;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	public int update(Member mem) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update tbl_member set pwd=?,phone=? ,nick=? ,eokay=? where id=?";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mem.getPwd()); 
			pstmt.setString(2,mem.getPhone());
			pstmt.setString(3,mem.getNick()); 
			pstmt.setInt(4,mem.getEokay());
			pstmt.setString(5,mem.getId()); 
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,null);
		}
	}
	public int delete(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update tbl_member set status=0 where id=?";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,null);
		}
	}
	public ArrayList<Member> list(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from tbl_member";
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<Member> memberlist=new ArrayList<Member>();
			while(rs.next()) {
				Member mem=new Member(
						rs.getString("id"),
						 rs.getString("pwd"), 
						 rs.getString("phone"),
						 rs.getString("nick"), 
						 rs.getDate("regdate"), 
						 rs.getInt("eokay"),
						 rs.getInt("status"));
				memberlist.add(mem);
			}
			return memberlist;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	public int block(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update tbl_member set status=3 where id=?";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,null);
		}
	}
	public int unblock(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update tbl_member set status=1 where id=?";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
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

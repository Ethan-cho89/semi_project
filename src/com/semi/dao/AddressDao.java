package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.domain.AddressVo;
import com.semi.util.db.DBCPBean;

public class AddressDao {
	private static AddressDao instance= new AddressDao();
	private AddressDao() {}
	
	public static AddressDao getDao() {
		return instance;
	}
	public int insert(AddressVo vo) {
		Connection con = null;
		PreparedStatement pstmt=null;
		String id = vo.getId();
		String name = vo.getName();
		String address = vo.getAddress();
		int isDefault= vo.getIsDefault();
		try {
			con=DBCPBean.getConn();
			String sql = "insert into tbl_address values(SEQ_ADD.nextval,?,?,?,null,null,null,null,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, address);
			pstmt.setInt(4, isDefault);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	public ArrayList<AddressVo> list(String id){
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select num,name,address,isdefault from tbl_address where id=? order by isdefault desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			ArrayList<AddressVo> list = new ArrayList<AddressVo>();
			while(rs.next()) {
				int num = rs.getInt("num");
				int isDefault=rs.getInt("isdefault");
				String name= rs.getString("name");
				String address= rs.getString("address");
				AddressVo vo = new AddressVo(num, null, name, address, null, null, null, null, isDefault);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public AddressVo load(int num){
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select name,id,address,isdefault from tbl_address where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String id= rs.getString("id");
				String name= rs.getString("name");
				String address= rs.getString("address");
				int isDefault=rs.getInt("isdefault");
				AddressVo vo = new AddressVo(num, id, name, address, null, null, null, null, isDefault);
				return vo;
			}else {
				return null;
			}
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public int edit(AddressVo vo) {
		Connection con = null;
		PreparedStatement pstmt=null;
		String name = vo.getName();
		String address = vo.getAddress();
		int num = vo.getNum();
		int isDefault= vo.getIsDefault();
		try {
			con=DBCPBean.getConn();
			String sql = "update tbl_address set name=?, address=?, isdefault=? where num =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, address);
			pstmt.setInt(3, isDefault);
			pstmt.setInt(4, num);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	public int clean(String id) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con=DBCPBean.getConn();
			String sql = "update tbl_address set isdefault=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	public int delete(int num) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con=DBCPBean.getConn();
			String sql = "delete tbl_address where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
}

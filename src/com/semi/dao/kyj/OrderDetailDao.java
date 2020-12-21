package com.semi.dao.kyj;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.util.db.DBCPBean;

import com.semi.domain.kyj.OrderDetailVo;

public class OrderDetailDao {
	public OrderDetailVo orderdetail(String omid,int onum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBCPBean.getConn();
			String sql="select o.num onum,o.count oc,o.price opc,o.price*(c.dcrate/100)cd,o.pay opay,o.mid omid,a.orderphone aop,a.recipient arc,\r\n" + 
					"        a.rephone arp,a.address aad , i.name iname , o.paydate opd , o.ship os,o.how oh\r\n" + 
					"from tbl_order o,tbl_coupon c,tbl_address a,tbl_stock s,tbl_item i\r\n" + 
					"where o.mid = ? and o.num =? and o.anum = a.num and o.snum=s.snum and s.inum=i.num  and o.cnum=c.num";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, omid);
			pstmt.setInt(2, onum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				onum = rs.getInt("onum");
				int oc = rs.getInt("oc");
				int opc = rs.getInt("opc");
				int cd = rs.getInt("cd");
				int opay = rs.getInt("opay");
				omid =rs.getString("omid");
				String aop =rs.getString("aop");
				String arc=rs.getString("arc");
				String arp=rs.getString("arp");
				String aad=rs.getString("aad");
				String iname=rs.getString("iname");
				Date opd =rs.getDate("opd");
				int os = rs.getInt("os");
				String oh = rs.getString("oh");
				
				OrderDetailVo vo=new OrderDetailVo(onum,oc,opc,cd,opay,omid,aop,arc,arp,aad,iname,opd,os,oh);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public int ordercancel(String mid,int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update tbl_order set ship=5 where mid=? and num=?";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setInt(2,num);
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,null);
		}
	}
	
	public int orderback(String mid,int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update tbl_order set ship=6 where mid=? and num=?";
		try {
			con=DBCPBean.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setInt(2,num);
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

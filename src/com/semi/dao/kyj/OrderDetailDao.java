package com.semi.dao.kyj;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.util.db.DBCPBean;

import com.semi.domain.kyj.OrderDetailVo;

public class OrderDetailDao {
	public OrderDetailVo orderdetail(String omid,int onum,int cnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=DBCPBean.getConn();
			if(cnum==0) {
				sql="select o.num onum,o.count oc,o.price opc,o.price*0 cd,o.pay opay,o.mid omid,a.orderphone aop,a.recipient arc,\r\n" + 
					"        a.rephone arp,a.address aad , i.name iname , o.paydate opd , o.ship os,o.how oh,s.ssize ssize,o.price*(0) ccnum\r\n" + 
					"from tbl_order o,tbl_address a,tbl_stock s,tbl_item i\r\n" + 
					"where o.mid = ? and o.num =? and o.anum = a.num and o.snum=s.snum and s.inum=i.num";
			}else {
				sql="select o.num onum,o.count oc,o.price opc,o.price*(c.dcrate/100)*o.count cd,o.pay opay,o.mid omid,a.orderphone aop,a.recipient arc,\r\n" + 
						"        a.rephone arp,a.address aad , i.name iname , o.paydate opd , o.ship os,o.how oh,s.ssize ssize,c.num ccnum\r\n" + 
						"from tbl_order o,tbl_coupon c,tbl_address a,tbl_stock s,tbl_item i\r\n" + 
						"where o.mid = ? and o.num =? and o.anum = a.num and o.snum=s.snum and s.inum=i.num  and o.cnum=c.num";
			}
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
				String ssize = rs.getNString("ssize");
				int ccnum = rs.getInt("ccnum");
				
				OrderDetailVo vo=new OrderDetailVo(onum,oc,opc,cd,opay,omid,aop,arc,arp,aad,iname,opd,os,oh,ssize,ccnum);
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
	
	public int ordercancel(String mid,int num,int cnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		String sql="";
		String sql2="";
		if(cnum==0) {
			sql="update tbl_order set ship=5 where mid=? and num=?";
			
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
				DBCPBean.close(con, pstmt);
			}
		}
			
		else {
			sql="update tbl_order set ship=5 where mid=? and num=?";
			sql2="update tbl_coupholder set used = 0 where id=? and num=?";
					
				try {
					con=DBCPBean.getConn();
					pstmt=con.prepareStatement(sql);
					pstmt2=con.prepareStatement(sql2);
					pstmt.setString(1,mid);
					pstmt.setInt(2,num);
					pstmt2.setString(1,mid);
					pstmt2.setInt(2, cnum);
					int n=pstmt.executeUpdate()+pstmt2.executeUpdate();
					return n;
				}catch(SQLException se) {
					se.printStackTrace();
					return -1;
				}finally {
					DBCPBean.close(con, pstmt,pstmt2);
				}
			}
		}
		
		
	
	public int orderback(String mid,int num,int cnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		String sql="";
		String sql2="";
		if(cnum==0) {
			sql="update tbl_order set ship=6 where mid=? and num=?";
			
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
				DBCPBean.close(con, pstmt);
			}
		}
			
		else {
			sql = "update tbl_order set ship=6 where mid=? and num=?";
			sql2 = "update tbl_coupholder set used = 0 where id=? and num=?";

			try {
				con = DBCPBean.getConn();
				pstmt = con.prepareStatement(sql);
				pstmt2 = con.prepareStatement(sql2);
				pstmt.setString(1, mid);
				pstmt.setInt(2, num);
				pstmt2.setString(1, mid);
				pstmt2.setInt(2, cnum);
				int n = pstmt.executeUpdate() + pstmt2.executeUpdate();
				return n;
			} catch (SQLException se) {
				se.printStackTrace();
				return -1;
			} finally {
				DBCPBean.close(con, pstmt, pstmt2);
			}
		}
	}
	
	public int orderconfirm(String mid, int num, int opay) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		String sql = "update tbl_order\r\n" + 
				"set ship=4\r\n" + 
				"where mid=? and num=?";
		
		String sql2 = "insert\r\n" + 
				"into tbl_sales\r\n" + 
				"values(seq_sal.nextval,?,sysdate,?)";
		
		try {
			con = DBCPBean.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt2 = con.prepareStatement(sql2);
			pstmt.setString(1, mid);
			pstmt.setInt(2, num);
			pstmt2.setInt(1, num);
			pstmt2.setInt(2, opay);
			int n = pstmt.executeUpdate() + pstmt2.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,pstmt2);
		}
	}
}

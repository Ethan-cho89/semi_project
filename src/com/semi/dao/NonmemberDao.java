package com.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.domain.NonmemberVo;
import com.semi.util.db.DBCPBean;

public class NonmemberDao {
	private static NonmemberDao instance = new NonmemberDao();
	
	private NonmemberDao() {}
	
	public static NonmemberDao getDao() {
		return instance;
	}
	public ArrayList<NonmemberVo> getInfo(String email, String phone) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select num from tbl_address where orderemail=? and orderphone=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, phone);
			rs=pstmt.executeQuery();
			int num = 0;
			if(rs.next()) {
				num = rs.getInt(1);
				DBCPBean.close(null, pstmt, rs);
			}else {
				return null;
			}
			sql ="select * from ( " + 
					"select aa.*, o.num, o.price, o.count, o.pay, o.how, o.ship, o.paydate,o.anum from ( " + 
					"select s.snum,i.name,i.type,s.ssize from tbl_stock s join tbl_item i on s.inum=i.num " + 
					")aa join tbl_order o on o.snum=aa.snum) where anum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			ArrayList<NonmemberVo> list = new ArrayList<NonmemberVo>();
			while(rs.next()) {
				String iname= rs.getString("name");
				String type = rs.getString("type");
				String size = rs.getString("ssize");
				int onum = rs.getInt("num");
				int price = rs.getInt("price");
				int count = rs.getInt("count");
				int pay = rs.getInt("pay");
				String how = rs.getString("how");
				int ship = rs.getInt("ship");
				Date paydate = rs.getDate("paydate");
				
				NonmemberVo vo = new NonmemberVo(iname, type, size, onum, price, count, pay, how, ship, paydate);
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
	public int edit(int num, int status) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con=DBCPBean.getConn();
			String sql = "update tbl_order set ship=? where num=?";
			pstmt=con.prepareStatement(sql);
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
}

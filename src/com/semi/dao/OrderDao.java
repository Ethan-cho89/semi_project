package com.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.domain.OrderVo;
import com.semi.util.db.DBCPBean;
 
public class OrderDao {  // semi_my
	private static OrderDao instance = new OrderDao();
	
	private OrderDao() {}
	
	public static OrderDao getDao() {
		return instance;
	}
	public ArrayList<OrderVo> list(String field, String keyword, int startRow, int endRow) { //나중에 붙일때 필요할거 같아서 일단 만들어 놨습니다~
		Connection con =null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql="";
			if(keyword!=null && !keyword.equals("")) {
				if(field.equals("num")) {
				sql = "select * from " + 
						"(" + 
						"select rownum rnum, aa.* from " + 
						"(" + 
						"select num, mid, ship, paydate from tbl_order where "+field+"= "+keyword+" order by num desc " + 
						")aa " + 
						")where rnum>=? and rnum<=?";
				}else {
					sql = "select * from " + 
							"(" + 
							"select rownum rnum, aa.* from " + 
							"(" + 
							"select num, mid, ship, paydate from tbl_order where "+field+"= '%"+keyword+"%' order by num desc " + 
							")aa " + 
							")where rnum>=? and rnum<=?";
				}
			}else {
				sql = "select * from " + 
						"(" + 
						"select rownum rnum, aa.* from " + 
						"(" + 
						"select num, mid, ship, paydate from tbl_order order by num desc " + 
						")aa " + 
						")where rnum>=? and rnum<=?";
			}
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs= pstmt.executeQuery();
			ArrayList<OrderVo> list = new ArrayList<OrderVo>();
			while(rs.next()) {
				int num = rs.getInt("num");
				String mid = rs.getString("mid");
				int ship = rs.getInt("ship");
				Date paydate= rs.getDate("payDate");
				OrderVo vo = new OrderVo(num, mid, ship, paydate);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	public int getCount(String field, String keyword ) {
		Connection con =null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "";
			if(keyword!=null && !keyword.equals("")) {
				if(field.equals("num")) {
					int key = Integer.parseInt(keyword);
					sql = "select nvl(count(num),0) from tbl_order where "+field+" = "+key;
				}else {
					sql = "select nvl(count(num),0) from tbl_order where "+field+" like '%"+keyword+"%'";
				}
			}else {
				sql = "select nvl(count(num),0) from tbl_order";
			}
			pstmt= con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt,null);
		}
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
}

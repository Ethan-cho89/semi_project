package com.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.domain.CouponVo;
import com.semi.util.db.DBCPBean;

public class CouponDao {
	private static CouponDao instance = new CouponDao();
	
	private CouponDao() {}
	
	public static CouponDao getDao() {
		return instance;
	}
	
	public ArrayList<CouponVo> list(String field, String keyword, int startRow, int endRow){
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql ="";
			if(keyword!=null && !keyword.equals("")) {
				sql = "select * from " + 
						"(" + 
							"select rownum rnum, aa.* from " + 
								"(" + 
								"    select * from tbl_coupon where "+field+" like '%"+keyword+"%' order by stdate " + 
							")aa " + 
						") where rnum>=? and rnum<=?";
			}else {
			
				sql = "select * from " + 
						"(" + 
							"select rownum rnum, aa.* from " + 
								"(" + 
								"    select * from tbl_coupon order by stdate " + 
							")aa " + 
						") where rnum>=? and rnum<=?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			
			ArrayList<CouponVo> list = new ArrayList<CouponVo>();
			while(rs.next()) {
				int num = rs.getInt("num");
				int dcrate = rs.getInt("dcrate");
				Date stdate = rs.getDate("stdate");
				Date exdate = rs.getDate("exdate");
				String name=rs.getString("name");
				CouponVo vo = new CouponVo(num, dcrate, stdate, exdate, name, null, 0); //name,used
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
	
	public int insert(CouponVo vo){ // 등록과 동시에 전체 회원에게 뿌려줘야함.
		Connection con = null;
		PreparedStatement pstmt=null;
		String name = vo.getName();
		int dcrate = vo.getDcrate();
		Date stdate = vo.getStdate();
		Date exdate = vo.getExdate();
		try {
			con=DBCPBean.getConn();
			String sql = "insert into tbl_coupon values(seq_cou.nextval,?,?,?,?)";//번호,할인률,끝날,이름,시작날
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dcrate);
			pstmt.setDate(2, exdate);
			pstmt.setString(3, name);
			pstmt.setDate(4, stdate);
			int n =pstmt.executeUpdate();
			return n;
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	public int addCoupon(int couponNum){ // 등록과 동시에 전체 회원에게 뿌려줘야함.
		Connection con = null;
		PreparedStatement pstmt=null;
		ArrayList<String> list = getIds();
		try {
			con=DBCPBean.getConn();
			String sql = "insert into tbl_coupholder values(?,"+couponNum+",?)";//번호,할인률,끝날,이름,시작날
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(2, 0);
			int n = 0;
			for(String id : list) {
				pstmt.setString(1, id);
				n += pstmt.executeUpdate();
			}
			if(n==list.size()) {
				return 1;
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
	
	public int getNum(String name) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select * from tbl_coupon where name=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("num");
			}else {
				return -1;
			}
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<String> getIds(){
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select * from tbl_member";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<String> list = new ArrayList<String>();
			while(rs.next()) {
				String id=rs.getString("id");
				list.add(id);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public int delete(int num) {
		Connection con = null;
		PreparedStatement pstmt=null;
		try {
			con=DBCPBean.getConn();
			String sql = "delete tbl_coupon where num=?";//번호,할인률,끝날,이름,시작날
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			int n =pstmt.executeUpdate();
			return n;
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	public int getCount(String field, String keyword){
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql ="";
			if(keyword!=null && !keyword.equals("")) {
				sql = "select nvl(count(num),0) from tbl_coupon where "+field+" like '%"+keyword+"%'";
			}else {
				sql = "select nvl(count(num),0) from tbl_coupon";
			}
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
}

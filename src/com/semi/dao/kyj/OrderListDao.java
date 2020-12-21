package com.semi.dao.kyj;

import java.sql.Connection;



import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.util.db.DBCPBean;
import com.semi.domain.kyj.OrderListVo;

public class OrderListDao {
	
	public int getCount(String mid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con=DBCPBean.getConn();
			String sql = "select NVL(count(num),0) cnt from tbl_order where mid=? and ship !=5 and ship !=7";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mid);
			rs=pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			return cnt;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBCPBean.close(con,pstmt,rs);
		}
	}
	
	public ArrayList<OrderListVo> orderlist(String mid, int startRow ,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
			
		try {
			con=DBCPBean.getConn();
			String sql = "select * from\r\n" + 
					"(\r\n" + 
					"    select aa.*,rownum rnum from\r\n" + 
					"    (\r\n" + 
					"        select o.num , o.snum,o.cnum,o.anum,o.price,o.count,o.pay,o.ship,o.mid,o.paydate,i.name,o.revcheck rc\r\n" + 
					"        from tbl_order o , tbl_stock s, tbl_item i\r\n" + 
					"        where o.mid=? and o.snum=s.snum and s.inum=i.num and o.ship != 5 and o.ship != 7\r\n" + 
					"        order by o.paydate desc\r\n" + 
					"    )aa\r\n" + 
					")where rnum>=? and rnum<=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			rs = pstmt.executeQuery();
			ArrayList<OrderListVo> orderlist=new ArrayList<OrderListVo>();
			while(rs.next()) {
				int num=rs.getInt("num");
				int snum = rs.getInt("snum");
				int cnum = rs.getInt("cnum");
				int anum = rs.getInt("anum");
				int price = rs.getInt("price");
				int count = rs.getInt("count");
				int pay = rs.getInt("pay");
				int ship = rs.getInt("ship");
				mid = rs.getString("mid");
				Date paydate = rs.getDate("paydate");
				String name = rs.getString("name");
				int rc = rs.getInt("rc");
				
				OrderListVo vo = new OrderListVo(num, snum, cnum, anum, price,count, pay, ship, mid,
						paydate,name,rc);
				orderlist.add(vo);
			}
			return orderlist;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBCPBean.close(con, pstmt, rs);
		}
	}
}

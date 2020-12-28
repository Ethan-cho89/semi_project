package com.semi.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.dao.Couponholder.CouponholderDao;
import com.semi.domain.CartVo;
import com.semi.util.db.DBCPBean;

public class PayDao {
	private static PayDao instance;

	private JdbcTemplate jdbcTemplate;

	public static PayDao getInstance() {
		if (instance == null) {
			instance = new PayDao();
			instance.jdbcTemplate = new JdbcTemplate(DBCPBean.getDataSource());
		}
		return instance;
	}

	/*
	 * public int getAndAddAddressKey() {
	 * 
	 * }
	 * 
	 * public int modifyAddress() {
	 * 
	 * }
	 */
		public int addOrder(CartVo vo,String id,int adnum,int cnum,int dc ) {
			return jdbcTemplate.update("insert into tbl_order values(seq_ord.nextVal,?,?,?,?,?,?,?,?,1,sysdate,0)",
					new Object[] {
							vo.getSnum(),
							id,
							cnum,
							adnum,
							vo.getPrice(),
							vo.getCount(),
							vo.getPrice() * (1.0-dc/100.0),
							"카드"
					});
		}
}

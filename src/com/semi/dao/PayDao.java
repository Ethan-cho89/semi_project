package com.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.dao.Couponholder.CouponholderDao;
import com.semi.domain.AddressVo;
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

	public int getKeyAndAddAddress(AddressVo vo) {
		int key = jdbcTemplate.queryForObject("select SEQ_ADD.nextval\r\n" + "from dual",
				new RowMapper<Integer>() {
				@Override
				public Integer mapRow(ResultSet rs, int arg1) throws SQLException {
					return rs.getInt(1);
				}
			});
		
		jdbcTemplate.update("insert into tbl_address values("+key+",?,?,?,?,?,?,?,0)", 
				new Object[] {
						 vo.getId(),
						 vo.getName(),
						 vo.getAddress(),
						 vo.getRecipient(),
						 vo.getRephone(),
						 vo.getReemail(),
						 vo.getOrderphone(),
				});
		
		return key;
	}

	public int modifyAddress(AddressVo vo) {
		return jdbcTemplate.update("update tbl_address set RECIPIENT = ?, REPHONE=? where num =? ",
				new Object[] {
						vo.getRecipient(),
						vo.getRephone(),
						vo.getNum()
				});
	}

	public int modifyCoupon(int cnum,String id) {
		return jdbcTemplate.update("update tbl_coupholder set used = 1 where num = ? and id = ? ",
				new Object[] {
						cnum,
						id
				});
	}
	
	public int addOrder(CartVo vo, String id, int adnum, int cnum, int dc) {
		return jdbcTemplate.update("insert into tbl_order values(seq_ord.nextVal,?,?,"+ (cnum==-1?null:cnum) +",?,?,?,?,?,1,sysdate,0)",
				new Object[] { vo.getSnum(), id, adnum, vo.getPrice(), vo.getCount(),
						vo.getPrice() * (1.0 - dc / 100.0), "카드" });
	}
}

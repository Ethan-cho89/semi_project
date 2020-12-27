package com.semi.dao.Couponholder;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.dao.ItemDao;
import com.semi.domain.CouponHolderVo;
import com.semi.util.db.DBCPBean;

public class CouponholderDao {

	private static CouponholderDao instance;

	private JdbcTemplate jdbcTemplate;

	public static CouponholderDao getInstance() {
		if (instance == null) {
			instance = new CouponholderDao();
			instance.jdbcTemplate = new JdbcTemplate(DBCPBean.getDataSource());
		}
		return instance;
	}

	public List<CouponHolderVo> getList(String id) {
		return jdbcTemplate.query("select *\r\n" + "from tbl_coupholder\r\n" + "where id = '?'", new Object[] { id },
				new RowMapper<CouponHolderVo>() {
					@Override
					public CouponHolderVo mapRow(ResultSet rs, int rn) throws SQLException {
						return new CouponHolderVo(rs.getString(1), rs.getInt(2), rs.getInt(3));
					}
				});
	}
}

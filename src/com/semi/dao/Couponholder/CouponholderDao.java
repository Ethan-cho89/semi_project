package com.semi.dao.Couponholder;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.dao.ItemDao;
import com.semi.domain.CouponHolderVo;
import com.semi.domain.CouponVo;
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
		return jdbcTemplate.query("select *\r\n" + "from tbl_coupholder\r\n" + "where id = ?", new Object[] { id },
				new RowMapper<CouponHolderVo>() {
					@Override
					public CouponHolderVo mapRow(ResultSet rs, int rn) throws SQLException {
						CouponHolderVo vo = new CouponHolderVo(rs.getString(1), rs.getInt(2), rs.getInt(3));

						CouponVo cv = jdbcTemplate.queryForObject("select *\r\n" + "from tbl_coupon\r\n" + "where num = ?",
								new Object[] { vo.getNum() }, new RowMapper<CouponVo>() {
									@Override
									public CouponVo mapRow(ResultSet rs, int arg1) throws SQLException {
										int num = rs.getInt("num");
										int dcrate = rs.getInt("dcrate");
										Date stdate = rs.getDate("stdate");
										Date exdate = rs.getDate("exdate");
										String name=rs.getString("name");
										CouponVo vo = new CouponVo(num, dcrate, stdate, exdate, name, null, 0); //name,used
										return vo;
									}
								});
						vo.setCoupon(cv);
						
						return vo;
					}
				});
	}
}

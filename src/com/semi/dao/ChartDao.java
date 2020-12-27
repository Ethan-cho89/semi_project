package com.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.domain.ChartVo;
import com.semi.domain.StockVo;
import com.semi.util.db.DBCPBean;

public class ChartDao {

	private static ChartDao instance;

	private JdbcTemplate jdbcTemplate;

	public static ChartDao getInstance() {
		if (instance == null) {
			instance = new ChartDao();
			instance.jdbcTemplate = new JdbcTemplate(DBCPBean.getDataSource());
		}
		return instance;
	}
	
	
	public List<ChartVo> getList(String sql){
		return jdbcTemplate.query(sql,
				new RowMapper<ChartVo>() {
			@Override
			public ChartVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new ChartVo(rs.getString(1),
						rs.getInt(2));
			}
		});
	}
	
} 

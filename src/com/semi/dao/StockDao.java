package com.semi.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.semi.domain.StockVo;
import com.semi.util.db.DBCPBean;

public class StockDao {

	private static StockDao instance;

	private JdbcTemplate jdbcTemplate;

	public static StockDao getInstance() {
		if (instance == null) {
			instance = new StockDao();
			instance.jdbcTemplate = new JdbcTemplate(DBCPBean.getDataSource());
		}
		return instance;
	}

	public int add(StockVo vo) {
		return jdbcTemplate.update("insert into tbl_stock values(seq_stock.nextVal,?,?,?)",
				new Object[] {
						vo.getInum(),
						vo.getSsize(),
						vo.getCount()
						}
				);
	}
} 

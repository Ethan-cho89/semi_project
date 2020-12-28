package com.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

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
	
	public List<StockVo> getList(int num){
		return jdbcTemplate.query("select * from tbl_stock where inum=?",
				new Object[] {
						num
				},new RowMapper<StockVo>() {
				@Override
				public StockVo mapRow(ResultSet rs, int rn) throws SQLException {
					StockVo vo = new StockVo();
					vo.setSnum(rs.getInt(1));
					vo.setInum(rs.getInt(2));
					vo.setSsize(rs.getString(3));
					vo.setCount(rs.getInt(4));
					return vo;
				}
			});
	}
	
	public int update(int num, String size, int count) {
		return jdbcTemplate.update("update tbl_stock set count=? where inum=? and ssize=?",
				new Object[] {
						count,
						num,
						size
				});
	}
	
} 

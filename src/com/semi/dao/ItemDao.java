package com.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.domain.ItemVo;
import com.semi.domain.PhotoVo;
import com.semi.util.db.DBCPBean;

public class ItemDao {

	private static ItemDao instance;

	private JdbcTemplate jdbcTemplate;

	public static ItemDao getInstance() {
		if (instance == null) {
			instance = new ItemDao();
			instance.jdbcTemplate = new JdbcTemplate(DBCPBean.getDataSource());
		}
		return instance;
	}

	public int add(ItemVo vo) {
		return jdbcTemplate.update("insert into tbl_item values(?,?,?,?,?,0,0,?)",
				new Object[] {
						vo.getNum(),
						vo.getName(),
						vo.getType(),
						vo.getPrice(),
						vo.getDetail(),
						vo.getGender()}
		);
	}
	
	public int getNextKey() {
		return jdbcTemplate.queryForObject("select SEQ_ITE.nextval from dual",
				new RowMapper<Integer>() {
				@Override
				public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					return rs.getInt(1);
				}
			});
	}
	
	public List<ItemVo> getList(int gender) {
		List<ItemVo> list = jdbcTemplate.query("select * from tbl_item where gender=?", 
				new Object[] {gender},
				new RowMapper<ItemVo>() {
					@Override
					public ItemVo mapRow(ResultSet rs, int rowNum) throws SQLException {
						ItemVo vo = new ItemVo(
								rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getInt(4),
								rs.getString(5),
								rs.getInt(6),
								rs.getInt(7),
								rs.getInt(8));
						return vo;
					}
				});

		return list;
	}
	
	public ItemVo get(int num) {
		ItemVo vo = jdbcTemplate.queryForObject("select * from tbl_item where num = ?",
				new Object[] {num},
				new RowMapper<ItemVo>() {
				@Override
				public ItemVo mapRow(ResultSet rs, int rownum) throws SQLException {
					ItemVo vo = new ItemVo(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getInt(4),
							rs.getString(5),
							rs.getInt(6),
							rs.getInt(7),
							rs.getInt(8));
					return vo;
				}
			});
		
		return vo;
	}
} 

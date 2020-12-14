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

	private ItemDao() {

	}

	public List<ItemVo> getList() {
		List<ItemVo> list = jdbcTemplate.query("select * from tbl_item", 
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
		
		vo.setPhotoList(jdbcTemplate.query("select * from tbl_photo where inum = ?",
				new Object[] {num} ,
				new RowMapper<PhotoVo>() {
				@Override
				public PhotoVo mapRow(ResultSet rs, int rownum) throws SQLException {
					PhotoVo vo = new PhotoVo(rs.getInt(1),
											rs.getInt(2),
											rs.getString(3),
											rs.getString(4));
					return vo;
				}
			}));
		
		return vo;
	}
}

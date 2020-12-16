package com.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.domain.PhotoVo;
import com.semi.util.db.DBCPBean;

public class PhotoDao {
	
	private static PhotoDao instance;

	private JdbcTemplate jdbcTemplate;

	public static PhotoDao getInstance() {
		if (instance == null) {
			instance = new PhotoDao();
			instance.jdbcTemplate = new JdbcTemplate(DBCPBean.getDataSource());
		}
		return instance;
	}

	private PhotoDao() {

	}
	
	public List<PhotoVo> getList(int num){
		return jdbcTemplate.query("select * from tbl_photo where inum = ?",
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
			});
	}
}

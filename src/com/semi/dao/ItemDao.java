package com.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.semi.domain.Criteria;
import com.semi.domain.ItemVo;
import com.semi.domain.PhotoVo;
import com.semi.service.PhotoService;
import com.semi.service.PhotoServiceImpl;
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

	public int getTotal(Criteria cri) {
		String sql = "select count(*) from tbl_item ";
		
		String condition = cri.getSQL();
		
		if(condition.length()>0) {
			sql += "where ";
			condition =condition.substring(0, condition.lastIndexOf("and")-1);
			sql += condition;
		}
		
		return jdbcTemplate.queryForObject(sql,
				new RowMapper<Integer>() {
					@Override
					public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
						return rs.getInt(1);
					}
				});
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
		PhotoService photoService = PhotoServiceImpl.getInstance();
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
	
	public List<ItemVo> getList(int gender,Criteria cri) {
		PhotoService photoService = PhotoServiceImpl.getInstance();
		//Index_desc
		String sql = "select num,name,type,price,detail,review,avgrate,gender\r\n" + 
				"from\r\n" + 
				"(\r\n" + 
				"    select /*+Index(tbl_item pk_item)*/\r\n" + 
				"            rownum rn,num,name,type,price,detail,review,avgrate,gender\r\n" + 
				"    from tbl_item\r\n" + 
				"    where gender = ? and\r\n" + 
				"         rownum <= ?\r\n" + 
				")\r\n" + 
				"where rn > ?";
		
		List<ItemVo> list = jdbcTemplate.query(sql, 
				new Object[] {gender,cri.getAmount()*cri.getPageNum(),cri.getAmount()*(cri.getPageNum()-1)},
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
	
	public List<ItemVo> getListWithKeyWord(Criteria cri) {
		//Index_desc
		String sql = "select num,name,type,price,detail,review,avgrate,gender\r\n" + 
				"from\r\n" + 
				"(\r\n" + 
				"    select /*+Index(tbl_item pk_item)*/\r\n" + 
				"            rownum rn,num,name,type,price,detail,review,avgrate,gender\r\n" + 
				"    from tbl_item\r\n" + 
				"    where "+ cri.getSQL() +"\r\n" + 
				"         rownum <= ?\r\n" + 
				")\r\n" + 
				"where rn > ?";
		
		List<ItemVo> list = jdbcTemplate.query(sql, 
				new Object[] {cri.getAmount()*cri.getPageNum(),cri.getAmount()*(cri.getPageNum()-1)},
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
	
	public int delete(int num) {
		return jdbcTemplate.update("delete from tbl_item where num = ?",
				new Object[] {
						num
				});
	}
	
	public int update(ItemVo vo) {
		return jdbcTemplate.update("update tbl_item set name = ?,type=?, price=?,detail=?,gender=? where num = ?",
				new Object[] {
					vo.getName(),
					vo.getType(),
					vo.getPrice(),
					vo.getDetail(),
					vo.getGender(),
					vo.getNum()
				});
				
	}
} 

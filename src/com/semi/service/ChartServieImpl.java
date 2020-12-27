package com.semi.service;

import java.util.HashMap;
import java.util.List;

import com.semi.dao.ChartDao;
import com.semi.domain.ChartVo;

public class ChartServieImpl implements ChartServie {
	
	private static ChartServie instance;
	
	private ChartDao dao;
	
	private HashMap<String , String> sqlMap;
	
	public static ChartServie getInstance() {
		if(instance==null) {
			instance = new ChartServieImpl();
		}
		return instance;
	}
	
	public ChartServieImpl() {
		dao = ChartDao.getInstance();
		sqlMap = new HashMap<String, String>();
		sqlMap.put("d", "select to_char(sdate,'DD') col,sum(sales)\r\n" + 
				"from view_sales\r\n" + 
				"where to_char(sdate,'YY/MM') >=to_char(sysdate,'YY/MM')\r\n" + 
				"group by to_char(sdate,'DD')\r\n" + 
				"order by col");
		
		sqlMap.put("m", "select to_char(sdate,'MM') col,sum(sales)\r\n" + 
				"from view_sales\r\n" + 
				"where to_char(sdate,'YY') = to_char(sysdate,'YY')\r\n" + 
				"group by to_char(sdate,'MM')"
				+ "order by col");
		
		sqlMap.put("y","select  to_char(sdate,'YYYY') col,sum(sales)\r\n" + 
				"from view_sales\r\n" + 
				"where to_char(sdate,'YYYY') >to_char(sdate,'YYYY')-5\r\n" + 
				"group by to_char(sdate,'YYYY')"
				+ "order by col");
	}
	
	@Override
	public List<ChartVo> getList(String col) {
		return dao.getList(sqlMap.get(col));
	}

}

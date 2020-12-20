package com.semi.service;

import java.util.HashMap;
import java.util.Map;

import com.semi.dao.StockDao;
import com.semi.domain.StockVo;


public class StockServiceImpl implements StockService {
	
	private static StockService instance;
	private final static String[] SIZE_ARR = {"S","M","L","XL"};

	private StockDao dao;
	
	public static StockService getInstance() {
		if(instance==null) {
			instance = new StockServiceImpl();
		}
		return instance;
	}

	public StockServiceImpl() {
		dao = StockDao.getInstance();
	}

	/*
	 * s,m,l,xl 순으로 입력
	 * */
	@Override
	public boolean add(int inum,int...sizes) {
		int cnt = 0;
		
		for(int i = 0 ; i < sizes.length; i++) {
			cnt += dao.add(new StockVo(0, inum,SIZE_ARR[i], sizes[i]));
		}
		
		return cnt>=sizes.length;
	}

	@Override
	public Map<String, StockVo> getItemStock(int num) {
		Map<String, StockVo> map = new HashMap<>();
		
		for(StockVo vo : dao.getList(num)) {
			map.put(vo.getSsize(), vo);
		}
		
		return map;
	}

	@Override
	public boolean modify(int inum,int...sizes) {
		int cnt = 0;
		for(int i = 0 ; i < sizes.length; i++) {
			cnt += dao.update(inum, SIZE_ARR[i], sizes[i]);
		}
		return cnt>=sizes.length;
	}

}

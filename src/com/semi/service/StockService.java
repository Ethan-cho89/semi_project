package com.semi.service;

import java.util.Map;

import com.semi.domain.StockVo;

public interface StockService {
	
	public boolean add(int inum,int...sizes);
	
	public Map<String, Integer> getItemStock(int num);
	
	public boolean modify(int inum,int...sizes);
}

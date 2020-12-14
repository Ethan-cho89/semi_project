package com.semi.service;

import java.util.List;

import com.semi.dao.ItemDao;
import com.semi.domain.ItemVo;

public class ItemBoardServiceImpl implements ItemBoardService {

	private static ItemBoardService instance;
	private  ItemDao dao;
	
	public static ItemBoardService getInstance() {
		if(instance==null) {
			instance = new ItemBoardServiceImpl();
		}
		return instance;
	}
	
	public ItemBoardServiceImpl() {
		dao = ItemDao.getInstance();
	}
	
	@Override
	public List<ItemVo> getList() {
		return dao.getList();
	}

	@Override
	public ItemVo get(int num) {
		return dao.get(num);
	}
	
}

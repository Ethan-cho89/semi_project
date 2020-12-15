package com.semi.service;

import java.util.List;

import com.semi.domain.ItemVo;

public interface ItemBoardService {
	public List<ItemVo> getList();
	
	public ItemVo get(int num);
}

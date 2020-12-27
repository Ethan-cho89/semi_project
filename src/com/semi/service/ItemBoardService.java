package com.semi.service;

import java.util.List;

import com.semi.domain.Criteria;
import com.semi.domain.ItemVo;

public interface ItemBoardService {

	public List<ItemVo> getList(int gender);

	public List<ItemVo> getList(Criteria cri);

	public List<ItemVo> getListWithKeyWord(Criteria cri);

	public ItemVo get(int num);

	public boolean add(ItemVo vo);

	public int addAndGetKey(ItemVo vo);

	public int delete(int num);

	public boolean modify(ItemVo vo);

	public int getTotal(Criteria cri);
}

package com.semi.service;

import java.util.List;

import com.semi.dao.ItemDao;
import com.semi.domain.Criteria;
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
	public ItemVo get(int num) {
		return dao.get(num);
	}

	@Override
	public boolean add(ItemVo vo) {
		return dao.add(vo)>=1;
	}

	@Override
	public List<ItemVo> getList(int gender) {
		// TODO Auto-generated method stub
		return dao.getList(gender);
	}

	@Override
	public int addAndGetKey(ItemVo vo) {
		
		int keyNum = dao.getNextKey();
		vo.setNum(keyNum);
		vo.setDetail(vo.getDetail().replaceAll("/upload/temp", "/upload/"+keyNum));
		dao.add(vo);
		
		return keyNum;
	}

	@Override
	public int delete(int num) {
		return dao.delete(num);
	}

	@Override
	public boolean modify(ItemVo vo) {
		vo.setDetail(vo.getDetail().replaceAll("/upload/temp", "/upload/"+vo.getNum()));
		return dao.update(vo)>=1;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotal(cri);
	}

	@Override
	public List<ItemVo> getList(Criteria cri) {
		return dao.getList(cri.getGender(), cri);
	}

	@Override
	public List<ItemVo> getListWithKeyWord(Criteria cri) {
		
		return dao.getListWithKeyWord(cri);
	}
	
}

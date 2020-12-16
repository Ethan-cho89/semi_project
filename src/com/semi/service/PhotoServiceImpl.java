package com.semi.service;

import java.util.List;

import com.semi.dao.ItemDao;
import com.semi.dao.PhotoDao;
import com.semi.domain.PhotoVo;

public class PhotoServiceImpl implements PhotoService {

	private static PhotoService instance;
	private  PhotoDao dao;
	
	public static PhotoService getInstance() {
		if(instance==null) {
			instance = new PhotoServiceImpl();
		}
		return instance;
	}
	
	public PhotoServiceImpl() {
		dao = PhotoDao.getInstance();
	}
	
	@Override
	public List<PhotoVo> getList(int num) {
		return dao.getList(num);
	}

	@Override
	public boolean add(int key, String... urls) {
		int cnt = 0;
		
		for(int i = 0 ; i < urls.length; i++) {
			int index = urls[i].lastIndexOf('/');
			cnt += dao.add(key, urls[i].substring(0,index+1),urls[i].substring(index+1));
		}
		
		return cnt >= urls.length;
	}
	
}
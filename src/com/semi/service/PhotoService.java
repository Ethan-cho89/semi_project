package com.semi.service;

import java.util.List;

import com.semi.domain.PhotoVo;

public interface PhotoService {
	
	public List<PhotoVo> getList(int num);
	
	public boolean add(int key,String...urls);
}

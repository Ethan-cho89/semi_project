package com.semi.service;

import java.util.List;

import javax.servlet.ServletContext;

import com.semi.domain.PhotoVo;

public interface PhotoService {
	
	public List<PhotoVo> getList(int num);
	
	public boolean add(int key,String...urls);
	
	public boolean delete(ServletContext sc,int num);
}

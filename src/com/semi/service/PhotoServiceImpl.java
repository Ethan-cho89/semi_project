package com.semi.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

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
	public List<PhotoVo> getAllList() {
		return dao.getAllList();
	}
	
	@Override
	public boolean add(ServletContext sc,int key, String... paths) {
		if(paths==null) return false;
		
		int cnt = 0;
		String saveDir = "/upload/"+key+"/";
		File folder = new File(sc.getRealPath(saveDir));
		
		if(!folder.exists()) {
			folder.mkdir();
		}
			
		for(int i = 0 ; i < paths.length; i++) {
			File f = new File(sc.getRealPath(paths[i]));
			
			f.renameTo(new File(folder.getPath(),f.getName()));
			
			cnt += dao.add(key,saveDir,f.getName());
		}
		
		return cnt >= paths.length;
	}

	@Override
	public boolean delete(ServletContext sc,int num) {
		List<PhotoVo> list = getList(num);
		fileDelete(sc,list);
		return dao.delete(num) >=1;
	}
	
	public void fileDelete(ServletContext sc,List<PhotoVo> list) {
		
		for(PhotoVo vo : list) {
			File f = new File(sc.getRealPath(vo.getFilePath()));
			if(f.exists()) {
				f.delete();
			}
		}
		
		File f= new File(sc.getRealPath("/upload/"+list.get(0).getInum()));
		f.delete();
	}

	@Override
	public boolean deleteWithOutFile(int num) {
		return dao.delete(num)>=1;
	}
	
}

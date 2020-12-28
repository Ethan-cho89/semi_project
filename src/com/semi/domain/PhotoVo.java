package com.semi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PhotoVo {
	private int pnum;
	private int inum;
	private String path;
	private String name;
	
	public PhotoVo() {
	}
	
	public String getFilePath() {
		return path+name;
	}
	
}

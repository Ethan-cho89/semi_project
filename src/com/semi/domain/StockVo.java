package com.semi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StockVo {
	private int snum;
	private int inum;
	private String ssize;
	private int count;
	
	public StockVo() {
		
	}
}

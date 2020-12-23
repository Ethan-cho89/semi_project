package com.semi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartVo {
	private int inum;
	private String iname;
	private int snum;
	private int count;
	private int price;
	
	public CartVo() {}
}

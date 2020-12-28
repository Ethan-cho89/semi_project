package com.semi.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class ItemVo {
	private int num;
	private String name;
	private String type;
	private int price;
	private String detail;
	private int review;
	private int avgrate;
	private int gender;
	private List<PhotoVo> photoList;
	
	public ItemVo(){
		
	}

	public ItemVo(int num, String name, String type, int price, String detail, int review, int avgrate, int gender) {
		super();
		this.num = num;
		this.name = name;
		this.type = type;
		this.price = price;
		this.detail = detail;
		this.review = review;
		this.avgrate = avgrate;
		this.gender = gender;
	}
}

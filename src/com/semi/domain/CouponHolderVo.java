package com.semi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class CouponHolderVo {
	private String id;
	private int num;
	private int used;
	private CouponVo coupon;
	
	public CouponHolderVo(String id, int num, int used) {
		super();
		this.id = id;
		this.num = num;
		this.used = used;
	}



	public CouponHolderVo() {
		super();
	}
	
	
	
}

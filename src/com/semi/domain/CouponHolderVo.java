package com.semi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CouponHolderVo {
	private String id;
	private int num;
	private int used;
}

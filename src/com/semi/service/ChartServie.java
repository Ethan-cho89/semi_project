package com.semi.service;

import java.util.List;

import com.semi.domain.ChartVo;

public interface ChartServie {
	public List<ChartVo> getList(String col);
}

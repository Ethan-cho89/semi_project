package com.semi.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.semi.domain.CartVo;

public class CartUtil {
	public static List<CartVo> getSelectedSizes(HttpServletRequest req){
		List<CartVo> list = new ArrayList<CartVo>();
		String iname = req.getParameter("name");
		int inum = Integer.parseInt(req.getParameter("num"));
		int price = Integer.parseInt(req.getParameter("price"));
		
		Iterator<String> iter =req.getParameterNames().asIterator();
		
		while(iter.hasNext()) {
			String name = iter.next();
			if(name.equals("S")||name.equals("M")||name.equals("L")||name.equals("XL")) {
				int cnt = Integer.parseInt(req.getParameterValues(name)[0]);
				int snum = Integer.parseInt(req.getParameterValues(name)[1]);
				list.add(new CartVo(inum,iname ,snum,name,cnt, price));
			}
		}
		
		return list;
	}
	
}

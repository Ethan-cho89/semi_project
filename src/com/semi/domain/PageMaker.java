package com.semi.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString	
public class PageMaker {
	private int start;
	private int end;
	private boolean prev,next;
	
	private int total;
	private Criteria cri;
	
	
	public PageMaker(Criteria cri,int total) {
		this.cri = cri;
		this.total = total;
		
		end = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		start =end -9;
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		if(realEnd<end)
		{
			end = realEnd;
		}
		
		prev= this.start > 1;
		next = end < realEnd;
	}
}
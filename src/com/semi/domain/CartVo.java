package com.semi.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVo {
	private int inum;
	private String iname;
	private int snum;
	private String size;
	private int count;
	private int price;

	private List<PhotoVo> photoList;

	public CartVo() {
	}

	public CartVo(int inum, String iname, int snum, String size, int count, int price) {
		super();
		this.inum = inum;
		this.iname = iname;
		this.snum = snum;
		this.size = size;
		this.count = count;
		this.price = price;
	}

	@Override
	public boolean equals(Object obj) {
		CartVo other = (CartVo) obj;
		if (inum == other.inum && snum == other.snum && count == other.count) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public int hashCode() {
		return inum+iname.hashCode()+snum+size.hashCode();
	}
}

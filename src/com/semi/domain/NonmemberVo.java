package com.semi.domain;

import java.sql.Date;

public class NonmemberVo {
	private String iname; //아이템 테이블
	private String type;
	
	private String size; // 스톡 테이블 
	
	private int onum;
	private int price; //order 테이블 
	private int count;
	private int pay;
	private String how;
	private int ship;
	private Date paydate;
	public NonmemberVo() {}
	public NonmemberVo(String iname, String type, String size, int onum, int price, int count, int pay, String how,
			int ship, Date paydate) {
		super();
		this.iname = iname;
		this.type = type;
		this.size = size;
		this.onum = onum;
		this.price = price;
		this.count = count;
		this.pay = pay;
		this.how = how;
		this.ship = ship;
		this.paydate = paydate;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getHow() {
		return how;
	}
	public void setHow(String how) {
		this.how = how;
	}
	public int getShip() {
		return ship;
	}
	public void setShip(int ship) {
		this.ship = ship;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	
}

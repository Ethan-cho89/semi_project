package com.semi.domain.kyj;

import java.sql.Date;

public class OrderListVo {
	int num, snum, cnum, anum, price, count, pay, ship,rc;
	String mid,name;
	Date paydate;
	public OrderListVo() {}
	public OrderListVo(int num, int snum, int cnum, int anum, int price, int count, int pay, int ship, String mid,
			Date paydate,String name,int rc) {
		super();
		this.num = num;
		this.snum = snum;
		this.cnum = cnum;
		this.anum = anum;
		this.price = price;
		this.count = count;
		this.pay = pay;
		this.ship = ship;
		this.mid = mid;
		this.paydate = paydate;
		this.name=name;
		this.rc = rc;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
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
	public int getShip() {
		return ship;
	}
	public void setShip(int ship) {
		this.ship = ship;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRc() {
		return rc;
	}
	public void setRc(int rc) {
		this.rc = rc;
	}
	
}

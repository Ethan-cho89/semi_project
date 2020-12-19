package com.semi.domain;

import java.sql.Date;

public class OrderVo {
	private int num;
	private String id;
	private int ship;
	private Date paydate;
	public OrderVo() {}
	public OrderVo(int num, String id, int ship, Date paydate) {
		super();
		this.num = num;
		this.id = id;
		this.ship = ship;
		this.paydate = paydate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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

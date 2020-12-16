package com.semi.domain;

import java.sql.Date;

public class CouponVo {
	private int num;
	private int dcrate;
	private Date stdate;
	private Date exdate;
	private String name;
	private String id;
	private int used;

	public CouponVo() {}

	public CouponVo(int num, int dcrate, Date stdate, Date exdate, String name, String id, int used) {
		super();
		this.num = num;
		this.dcrate = dcrate;
		this.stdate = stdate;
		this.exdate = exdate;
		this.name = name;
		this.id = id;
		this.used = used;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getDcrate() {
		return dcrate;
	}

	public void setDcrate(int dcrate) {
		this.dcrate = dcrate;
	}

	public Date getStdate() {
		return stdate;
	}

	public void setStdate(Date stdate) {
		this.stdate = stdate;
	}

	public Date getExdate() {
		return exdate;
	}

	public void setExdate(Date exdate) {
		this.exdate = exdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}
	
	
	
	
}

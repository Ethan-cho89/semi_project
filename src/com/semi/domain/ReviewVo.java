package com.semi.domain;

import java.sql.Date;

public class ReviewVo {
	private int rnum;
	private int inum;
	private String iname;
	private String id;
	private int rate;
	private String content;
	private Date regdate;
	
	public ReviewVo() {}

	public ReviewVo(int rnum, int inum, String iname, String id, int rate, String content, Date regdate) {
		super();
		this.rnum = rnum;
		this.inum = inum;
		this.iname = iname;
		this.id = id;
		this.rate = rate;
		this.content = content;
		this.regdate = regdate;
	}

	
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getInum() {
		return inum;
	}

	public void setInum(int inum) {
		this.inum = inum;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
	
}

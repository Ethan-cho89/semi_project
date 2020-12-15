package com.semi.domain;

import java.sql.Date;

public class Member {
	private String id;
	private String pwd;
	private String phone;
	private String nick;
	private Date regdate;
	private int eokay;
	private int status;
	public Member() {}
	
	public Member(String id, String pwd, String phone, String nick, Date regdate, int eokay, int status) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.nick = nick;
		this.regdate = regdate;
		this.eokay = eokay;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public String getPwd() {
		return pwd;
	}

	public String getPhone() {
		return phone;
	}

	public String getNick() {
		return nick;
	}

	public Date getRegdate() {
		return regdate;
	}

	public int getEokay() {
		return eokay;
	}

	public int getStatus() {
		return status;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public void setEokay(int eokay) {
		this.eokay = eokay;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}

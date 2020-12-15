package com.semi.domain;

import java.sql.Date;

public class QnaVo { 
	private int num;
	private String writer;
	private String pwd;
	private String type;
	private String contents;
	private Date regdate;
	private String answer;
	private String title;
	private String nick;
	
	public QnaVo() {}

	public QnaVo(int num, String writer, String pwd, String type, String contents, Date regdate, String answer,
			String title, String nick) {
		super();
		this.num = num;
		this.writer = writer;
		this.pwd = pwd;
		this.type = type;
		this.contents = contents;
		this.regdate = regdate;
		this.answer = answer;
		this.title = title;
		this.nick = nick;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	
}

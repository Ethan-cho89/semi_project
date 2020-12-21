package com.semi.domain.kyj;

import java.sql.Date;

//상품명 iname
//아이디 omid
//별점 rrate
//작성일 rrd
//리뷰내용 rct

public class ReviewVo {

	String iname,omid,rct;
	int rrate,onum;
	Date rrd;
	
	public ReviewVo(String iname, String omid, String rct, int rrate, Date rrd, int onum) {
		super();
		this.iname = iname;
		this.omid = omid;
		this.rct = rct;
		this.rrate = rrate;
		this.rrd = rrd;
		this.onum = onum;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getOmid() {
		return omid;
	}

	public void setOmid(String omid) {
		this.omid = omid;
	}

	public String getRct() {
		return rct;
	}

	public void setRct(String rct) {
		this.rct = rct;
	}

	public int getRrate() {
		return rrate;
	}

	public void setRrate(int rrate) {
		this.rrate = rrate;
	}

	public Date getRrd() {
		return rrd;
	}

	public void setRrd(Date rrd) {
		this.rrd = rrd;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}
}

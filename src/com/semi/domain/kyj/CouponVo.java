package com.semi.domain.kyj;

import java.sql.Date;

//쿠폰명 c.name = cname
//할인율 c.dcrate = cd
//발급받은 날짜 c.stdate = csd
//만료 날짜 c.exdate = ced
//사용가능?(리스트 표시) h.used = hu
//쿠폰보유자 아이디 h.id= hid

public class CouponVo {

	String  cname,hid;
	int cd,hu;
	Date csd,ced;
	
	public CouponVo() {}
	public CouponVo(String cname, int cd, int hu, Date csd, Date ced,String hid) {
		super();
		this.cname = cname;
		this.cd = cd;
		this.hu = hu;
		this.csd = csd;
		this.ced = ced;
		this.hid = hid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCd() {
		return cd;
	}
	public void setCd(int cd) {
		this.cd = cd;
	}
	public int getHu() {
		return hu;
	}
	public void setHu(int hu) {
		this.hu = hu;
	}
	public Date getCsd() {
		return csd;
	}
	public void setCsd(Date csd) {
		this.csd = csd;
	}
	public Date getCed() {
		return ced;
	}
	public void setCed(Date ced) {
		this.ced = ced;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	
}

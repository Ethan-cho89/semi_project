package com.semi.domain.kyj;

import java.sql.Date;

//주문번호 o.num= onum
//수량 o.count= oc
//상품가격 o.price= opc
//쿠폰할인가 o.price*(c.dcrate/100=) cd
//결제 금액 o.pay= opay
//주문자 아이디 o.mid= omid
//주문자 전화번호 a.orderphone= aop
//수령인 a.recipient= arc
//수령인 전화번호 a.rephone= arp
//배달 주소 a.address = aad
//상품명 i.name=iname
//결제일 o.paydate= opd
//배송현황 o.ship =os
//결제방법 o.how = oh
//사이즈 s.ssize = ssize
//쿠폰번호 c.num = ccnum

public class OrderDetailVo {

	int onum,oc,opc,cd,opay,os,ccnum;
	String omid,aop,arc,arp,aad,iname,oh,ssize;
	Date opd;
	
	public OrderDetailVo() {}
	public OrderDetailVo(int onum, int oc, int opc, int cd, int opay, String omid, String aop, String arc, String arp,
			String aad, String iname, Date opd,int os,String oh,String ssize,int ccnum) {
		super();
		this.onum = onum;
		this.oc = oc;
		this.opc = opc;
		this.cd = cd;
		this.opay = opay;
		this.omid = omid;
		this.aop = aop;
		this.arc = arc;
		this.arp = arp;
		this.aad = aad;
		this.iname = iname;
		this.opd = opd;
		this.os = os;
		this.oh = oh;
		this.ssize = ssize;
		this.ccnum=ccnum;
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public int getOc() {
		return oc;
	}
	public void setOc(int oc) {
		this.oc = oc;
	}
	public int getOpc() {
		return opc;
	}
	public void setOpc(int opc) {
		this.opc = opc;
	}
	public int getCd() {
		return cd;
	}
	public void setCd(int cd) {
		this.cd = cd;
	}
	public int getOpay() {
		return opay;
	}
	public void setOpay(int opay) {
		this.opay = opay;
	}
	public String getOmid() {
		return omid;
	}
	public void setOmid(String omid) {
		this.omid = omid;
	}
	public String getAop() {
		return aop;
	}
	public void setAop(String aop) {
		this.aop = aop;
	}
	public String getArc() {
		return arc;
	}
	public void setArc(String arc) {
		this.arc = arc;
	}
	public String getArp() {
		return arp;
	}
	public void setArp(String arp) {
		this.arp = arp;
	}
	public String getAad() {
		return aad;
	}
	public void setAad(String aad) {
		this.aad = aad;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public Date getOpd() {
		return opd;
	}
	public void setOpd(Date opd) {
		this.opd = opd;
	}
	public int getOs() {
		return os;
	}
	public void setOs(int os) {
		this.os = os;
	}
	public String getOh() {
		return oh;
	}
	public void setOh(String oh) {
		this.oh = oh;
	}
	public String getSsize() {
		return ssize;
	}
	public void setSsize(String ssize) {
		this.ssize = ssize;
	}
	public int getCcnum() {
		return ccnum;
	}
	public void setCcnum(int ccnum) {
		this.ccnum = ccnum;
	}
	
}

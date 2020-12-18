package com.semi.domain;

public class AddressVo {
	private int num;
	private String id; 
	private String name; // 주소 별명  
	private String address;
	private String recipient;
	private String rephone;
	private String reemail;
	private String orderphone;
	private int isDefault;
	
	
	public AddressVo() {}

	public AddressVo(int num, String id, String name, String address, String recipient, String rephone, String reemail,
			String orderphone, int isDefault) {
		this.num = num;
		this.id = id;
		this.name = name;
		this.address = address;
		this.recipient = recipient;
		this.rephone = rephone;
		this.reemail = reemail;
		this.orderphone = orderphone;
		this.isDefault = isDefault;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRephone() {
		return rephone;
	}

	public void setRephone(String rephone) {
		this.rephone = rephone;
	}

	public String getReemail() {
		return reemail;
	}

	public void setReemail(String reemail) {
		this.reemail = reemail;
	}

	public String getOrderphone() {
		return orderphone;
	}

	public void setOrderphone(String orderphone) {
		this.orderphone = orderphone;
	}

	public int getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
	
	
}

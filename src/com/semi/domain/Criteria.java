package com.semi.domain;


import lombok.Getter;
import lombok.ToString;

@ToString
public class Criteria {
	@Getter
	private int pageNum;
	@Getter
	private int amount;
	@Getter
	private int gender;
	@Getter
	private String type;
	@Getter
	private String keyword;
	private String size;

	public Criteria() {
		this(1, 12);
	}

	public Criteria(int pageNum) {
		this(pageNum,12);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public void setPageNum(String pageNum) {
		if(pageNum==null) {
			return;
		}
		this.pageNum = Integer.parseInt(pageNum);
	}

	public void setAmount(String amount) {
		if(amount==null) {
			return;
		}
		this.amount = Integer.parseInt(amount);
	}

	public void setType(String type) {
		if(type==null||type.equals("")) {
			return;
		}
		this.type = type;
	}

	public void setGender(String gender) {
		if(gender==null||gender.equals("")) {
			this.gender=-9;
			return;
		}
		
		this.gender = Integer.parseInt(gender);
	}

	public void setKeyword(String keyword) {
		if(keyword==null || keyword.equals("")) {
			return;
		}
		this.keyword = keyword;
	}
	
	public void setSize(String[] size) {
		if(size==null||size.length<1) {
			return;
		}
		StringBuilder builder = new StringBuilder();
		
		for(String str : size) {
			builder.append(str+" ");
		}
		
		this.size = builder.toString();
	}
	
	public String getSize() {
		if(size==null) return null;
		
		return size.replace("XL", "X");
	}
	
	public String getSQL() {
		StringBuilder builder = new StringBuilder();
		if(gender!=-9) {
			builder.append(" gender = "+gender+" and ");
		}
		
		if(type != null) {
			builder.append("type like '%"+type+"%' and ");
		}
		
		if(keyword!=null) {
			builder.append("(name like '%"+keyword+"%' or type like '%"+keyword+"%' or detail like '%"+keyword+"%') and ");
		}
		
		if(size !=null&&size.length()>0) {
			builder.append("num in (select inum from tbl_stock where ");
					//ssize='S' or ssize='M');
			
			builder.append(" ( ");
			
			for(String str:size.split(" ")) {
				builder.append(" ssize='"+str+"' or ");
			}
			builder.append(" ) ");
			
			builder.append(" and count>0 ");
			
			builder.replace(builder.lastIndexOf("or"), builder.lastIndexOf("or")+2, "");
			
			builder.append(" ) and ");
		}
		
		return builder.toString();
	}
}

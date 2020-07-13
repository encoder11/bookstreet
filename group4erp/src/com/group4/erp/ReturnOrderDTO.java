package com.group4.erp;

public class ReturnOrderDTO {
	private String RNUM;
	private String return_sales_no;
	private String order_no;
	private String isbn13;
	private String return_cd;
	private String return_cause;
	private String return_comment;
	private String sort;	
	private String return_dt;
	private String return_cnt;
	

	public String getRNUM() {
		return RNUM;
	}

	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getReturn_cnt() {
		return return_cnt;
	}

	public void setReturn_cnt(String return_cnt) {
		this.return_cnt = return_cnt;
	}
	
	public String getReturn_dt() {
		return return_dt;
	}
	
	public void setReturn_dt(String return_dt) {
		this.return_dt = return_dt;
	}
	
	public String getReturn_cd() {
		return return_cd;
	}
	
	public void setReturn_cd(String return_cd) {
		this.return_cd = return_cd;
	}

	public String getSort() {
		return sort;
	}
	
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public String getReturn_sales_no() {
		return return_sales_no;
	}
	
	public void setReturn_sales_no(String return_sales_no) {
		this.return_sales_no = return_sales_no;
	}
	
	public String getOrder_no() {
		return order_no;
	}
	
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	
	public String getIsbn13() {
		return isbn13;
	}
	
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	
	public String getReturn_cause() {
		return return_cause;
	}
	
	public void setReturn_cause(String return_cause) {
		this.return_cause = return_cause;
	}
	
	public String getReturn_comment() {
		return return_comment;
	}
	
	public void setReturn_comment(String return_comment) {
		this.return_comment = return_comment;
	}
	
}

package com.group4.erp;

public class Cus_releaseInfoDTO {
	
	private String isbn13;
	private String cus_id;
	private String book_name;
	private String order_delivery_addr;
	private String order_dt;
	private int book_qty;
	private String publisher;
	private String book_price;
	private String all_book_price;
	private String emp_name;
	private String corp_name;
	private String corp_area;
	private String ceo_name;
	private String all_order_num;
	private String branch_name;
	private String check_order_num = "any";
	
	
	public String getCheck_order_num() {
		return check_order_num;
	}
	public void setCheck_order_num(String check_order_num) {
		this.check_order_num = check_order_num;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getAll_order_num() {
		return all_order_num;
	}
	public void setAll_order_num(String all_order_num) {
		this.all_order_num = all_order_num;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getCorp_area() {
		return corp_area;
	}
	public void setCorp_area(String corp_area) {
		this.corp_area = corp_area;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getIsbn13() {
		return isbn13;
	}
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getOrder_delivery_addr() {
		return order_delivery_addr;
	}
	public void setOrder_delivery_addr(String order_delivery_addr) {
		this.order_delivery_addr = order_delivery_addr;
	}
	public String getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	public int getBook_qty() {
		return book_qty;
	}
	public void setBook_qty(int book_qty) {
		this.book_qty = book_qty;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getBook_price() {
		return book_price;
	}
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	public String getAll_book_price() {
		return all_book_price;
	}
	public void setAll_book_price(String all_book_price) {
		this.all_book_price = all_book_price;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	
}

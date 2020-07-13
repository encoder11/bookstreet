package com.group4.erp;

public class SalesInfoDTO {

	private String order_no;
	private String order_id;
	private String order_pwd;
	private String order_delivery_addr;
	private String isbn13;
	private String book_qty;
	private String cus_requirement;
	private String is_member;
	private String order_dt;
	private String book_price;
	private String tot_cost;
	private String tot_revenue;
	private String category;
	private String return_qty;
	private String buy_dt;
	private String online_cnt;
	private String offline_cnt;
	private String tot_cnt;

	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=20;
	private String sort;
	
	
	
	public String getTot_cnt() {
		return tot_cnt;
	}

	public void setTot_cnt(String tot_cnt) {
		this.tot_cnt = tot_cnt;
	}

	public String getOnline_cnt() {
		return online_cnt;
	}

	public void setOnline_cnt(String online_cnt) {
		this.online_cnt = online_cnt;
	}

	public String getOffline_cnt() {
		return offline_cnt;
	}

	public void setOffline_cnt(String offline_cnt) {
		this.offline_cnt = offline_cnt;
	}


	public String getBuy_dt() {
		return buy_dt;
	}

	public void setBuy_dt(String buy_dt) {
		this.buy_dt = buy_dt;
	}


	public String getReturn_qty() {
		return return_qty;
	}
	
	public void setReturn_qty(String return_qty) {
		this.return_qty = return_qty;
	}	

	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getSelectPageNo() {
		return selectPageNo;
	}
	
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	
	public String getSort() {
		return sort;
	}
	
	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder_no() {
		return order_no;
	}
	
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	
	public String getOrder_id() {
		return order_id;
	}
	
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	public String getOrder_pwd() {
		return order_pwd;
	}
	
	public void setOrder_pwd(String order_pwd) {
		this.order_pwd = order_pwd;
	}
	
	public String getOrder_delivery_addr() {
		return order_delivery_addr;
	}
	
	public void setOrder_delivery_addr(String order_delivery_addr) {
		this.order_delivery_addr = order_delivery_addr;
	}
	
	public String getIsbn13() {
		return isbn13;
	}
	
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	
	public String getBook_qty() {
		return book_qty;
	}
	
	public void setBook_qty(String book_qty) {
		this.book_qty = book_qty;
	}
	
	public String getCus_requirement() {
		return cus_requirement;
	}
	
	public void setCus_requirement(String cus_requirement) {
		this.cus_requirement = cus_requirement;
	}
	
	public String getIs_member() {
		return is_member;
	}
	
	public void setIs_member(String is_member) {
		this.is_member = is_member;
	}
	
	public String getOrder_dt() {
		return order_dt;
	}
	
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	
	public String getBook_price() {
		return book_price;
	}
	
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	
	public String getTot_cost() {
		return tot_cost;
	}
	
	public void setTot_cost(String tot_cost) {
		this.tot_cost = tot_cost;
	}
	
	public String getTot_revenue() {
		return tot_revenue;
	}
	
	public void setTot_revenue(String tot_revenue) {
		this.tot_revenue = tot_revenue;
	}
	
}

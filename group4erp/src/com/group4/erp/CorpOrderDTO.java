package com.group4.erp;

public class CorpOrderDTO {

	private String order_books_no;
	private String isbn13;
	private String corp_no;
	private String corp_name;
	private String ceo_name;
	private String books_qty;
	private String book_price;
	private String order_dt;
	private String tot_cost;
	private String issueYn;
	private String category;
	private String RNUM;

	public String getRNUM() {
		return RNUM;
	}

	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getIssueYn() {
		return issueYn;
	}

	public void setIssue(String issueYn) {
		this.issueYn = issueYn;
	}

	public String getOrder_books_no() {
		return order_books_no;
	}

	public void setOrder_books_no(String order_books_no) {
		this.order_books_no = order_books_no;
	}

	public String getCorp_name() {
		return corp_name;
	}

	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	
	
	public String getTot_cost() {
		return tot_cost;
	}

	public void setTot_cost(String tot_cost) {
		this.tot_cost = tot_cost;
	}
	
	public String getIsbn13() {
		return isbn13;
	}
	
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	
	public String getCorp_no() {
		return corp_no;
	}
	
	public void setCorp_no(String corp_no) {
		this.corp_no = corp_no;
	}
	
	public String getCeo_name() {
		return ceo_name;
	}
	
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	
	public String getBooks_qty() {
		return books_qty;
	}
	
	public void setBooks_qty(String books_qty) {
		this.books_qty = books_qty;
	}
	
	public String getBook_price() {
		return book_price;
	}
	
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	
	public String getOrder_dt() {
		return order_dt;
	}
	
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}

}

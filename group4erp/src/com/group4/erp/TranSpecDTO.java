package com.group4.erp;

public class TranSpecDTO {



	private int order_books_no;
	private String order_no;
	private String corp_no;
	private String corp_name;
	private String ceo_name;
	private String corp_tel;
	private String corp_fax;
	private String corp_addr;
	private String isbn13;
	private String book_name;
	private String book_price;
	private String books_qty;
	private String tot_cost;
	private String order_dt;
	private String tax;
	private String issue_no;
	private String issue_dt;
	private int tradeTot;

	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=20;
	

	public int getTradeTot() {
		return tradeTot;
	}

	public void setTradeTot(int tradeTot) {
		this.tradeTot = tradeTot;
	}


	public String getRNUM() {
		return RNUM;
	}

	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}

	private String RNUM;
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

	
	public String getIssue_no() {
		return issue_no;
	}

	public void setIssue_no(String issue_no) {
		this.issue_no = issue_no;
	}

	public String getIssue_dt() {
		return issue_dt;
	}

	public void setIssue_dt(String issue_dt) {
		this.issue_dt = issue_dt;
	}
	
	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}
	
	public String getCorp_fax() {
		return corp_fax;
	}

	public void setCorp_fax(String corp_fax) {
		this.corp_fax = corp_fax;
	}


	public String getCorp_name() {
		return corp_name;
	}

	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}


	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	
	public String getCeo_name() {
		return ceo_name;
	}

	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}

	
	public int getOrder_books_no() {
		return order_books_no;
	}
	
	public void setOrder_books_no(int order_books_no) {
		this.order_books_no = order_books_no;
	}
	
	public String getCorp_no() {
		return corp_no;
	}
	
	public void setCorp_no(String corp_no) {
		this.corp_no = corp_no;
	}
	
	public String getCorp_tel() {
		return corp_tel;
	}
	
	public void setCorp_tel(String corp_tel) {
		this.corp_tel = corp_tel;
	}
	
	public String getCorp_addr() {
		return corp_addr;
	}
	
	public void setCorp_addr(String corp_addr) {
		this.corp_addr = corp_addr;
	}
	
	public String getIsbn13() {
		return isbn13;
	}
	
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	
	public String getBook_name() {
		return book_name;
	}
	
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	
	public String getBook_price() {
		return book_price;
	}
	
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	
	public String getBooks_qty() {
		return books_qty;
	}
	
	public void setBooks_qty(String books_qty) {
		this.books_qty = books_qty;
	}
	
	public String getTot_cost() {
		return tot_cost;
	}
	
	public void setTot_cost(String tot_cost) {
		this.tot_cost = tot_cost;
	}
	
	public String getOrder_dt() {
		return order_dt;
	}
	
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	
}

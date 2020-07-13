package com.group4.erp;

public class BookInfoDTO {
	private String isbn13;
	private String book_name;
	private String cat_name;
	private String book_price;
	private int book_pages;
	private String writer;
	private String publisher;
	private String size_name;
	private String is_print;
	private String emp_name;
	private String published_dt;
	private String editor;
	private int  isbn_cnt;
	private String branch_name;
	
	
	public String getSize_name() {
		return size_name;
	}
	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
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
	public int getBook_pages() {
		return book_pages;
	}
	public void setBook_pages(int book_pages) {
		this.book_pages = book_pages;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getIs_print() {
		return is_print;
	}
	public void setIs_print(String is_print) {
		this.is_print = is_print;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPublished_dt() {
		return published_dt;
	}
	public void setPublished_dt(String published_dt) {
		this.published_dt = published_dt;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public int getIsbn_cnt() {
		return isbn_cnt;
	}
	public void setIsbn_cnt(int isbn_cnt) {
		this.isbn_cnt = isbn_cnt;
	}
	
	
	
}

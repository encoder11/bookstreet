package com.group4.erp;

public class EventSearchDTO {

	private String searchKeyword;
	private String emp_no;
	private int selectPageNo=1;
	private int rowCntPerPage=20;
	private String evnt_category[];
	private String evnt_stat[];
	private String sort;
	private String tableName;
	private String allOrMine;
	

	public String getAllOrMine() {
		return allOrMine;
	}

	public void setAllOrMine(String allOrMine) {
		this.allOrMine = allOrMine;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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
	
	public String[] getEvnt_category() {
		return evnt_category;
	}
	
	public void setEvnt_category(String[] evnt_category) {
		this.evnt_category = evnt_category;
	}
	
	public String[] getEvnt_stat() {
		return evnt_stat;
	}
	
	public void setEvnt_stat(String[] evnt_stat) {
		this.evnt_stat = evnt_stat;
	}
}

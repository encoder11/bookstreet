package com.group4.erp;

public class SalListSearchDTO {

	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=20;
	private String emp_no;
	private String sort;
	private int my_emp_no;
	
	public int getMy_emp_no() {
		return my_emp_no;
	}
	public void setMy_emp_no(int my_emp_no) {
		this.my_emp_no = my_emp_no;
	}

	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
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



}

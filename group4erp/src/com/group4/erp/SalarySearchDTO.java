package com.group4.erp;

public class SalarySearchDTO {
	
	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=20;
	private int emp_no;
	
	
	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
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

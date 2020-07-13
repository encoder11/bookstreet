package com.group4.erp;

public class ApprovalSearchDTO {

	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=20;
	//private String emp_no;
	private String mgr_emp_no;
	private String sort;
	private int isCEO;
	private int emp_no;

	
	public int getIsCEO() {
		return isCEO;
	}

	public void setIsCEO(int isCEO) {
		this.isCEO = isCEO;
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
	
	public int getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getMgr_emp_no() {
		return mgr_emp_no;
	}
	
	public void setMgr_emp_no(String mgr_emp_no) {
		this.mgr_emp_no = mgr_emp_no;
	}
	
	public String getSort() {
		return sort;
	}
	
	public void setSort(String sort) {
		this.sort = sort;
	}
}

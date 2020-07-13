package com.group4.erp;

public class HrListSearchDTO {
	
	private String searchKeyword;
	private int selectPageNo=1;
	private int rowCntPerPage=20;
	private String datepicker;
	private String[] inout_name;
	private String keyword1;
	private String sort;
	private String dy_keyword;
	private String[] dayoff_state;
	
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
	public String getDatepicker() {
		return datepicker;
	}
	public void setDatepicker(String datepicker) {
		this.datepicker = datepicker;
	}
	public String[] getInout_name() {
		return inout_name;
	}
	public void setInout_name(String[] inout_name) {
		this.inout_name = inout_name;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getDy_keyword() {
		return dy_keyword;
	}
	public void setDy_keyword(String dy_keyword) {
		this.dy_keyword = dy_keyword;
	}
	public String[] getDayoff_state() {
		return dayoff_state;
	}
	public void setDayoff_state(String[] dayoff_state) {
		this.dayoff_state = dayoff_state;
	}
	
	
	

}

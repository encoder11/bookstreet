package com.group4.erp;

public class DayOffApplyDTO {

	private int dayoff_apply_no;
	private int emp_no;
	private String dayoff_apply_dt;
	private int dayoff_cd;
	private int using_dayoff;
	private String start_dayoff;
	private String end_dayoff;
	private String confirm;
	private String dayoff_category;
	private String jikup;
	private String emp_name;
	private String mgr_name;
	
	
	public String getMgr_name() {
		return mgr_name;
	}

	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}

	public String getJikup() {
		return jikup;
	}

	public void setJikup(String jikup) {
		this.jikup = jikup;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}	
	
	public String getDayoff_category() {
		return dayoff_category;
	}

	public void setDayoff_category(String dayoff_category) {
		this.dayoff_category = dayoff_category;
	}

	public int getDayoff_apply_no() {
		return dayoff_apply_no;
	}
	
	public void setDayoff_apply_no(int dayoff_apply_no) {
		this.dayoff_apply_no = dayoff_apply_no;
	}
	
	public int getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getDayoff_apply_dt() {
		return dayoff_apply_dt;
	}
	
	public void setDayoff_apply_dt(String dayoff_apply_dt) {
		this.dayoff_apply_dt = dayoff_apply_dt;
	}
	
	public int getDayoff_cd() {
		return dayoff_cd;
	}
	
	public void setDayoff_cd(int dayoff_cd) {
		this.dayoff_cd = dayoff_cd;
	}
	
	public int getUsing_dayoff() {
		return using_dayoff;
	}
	
	public void setUsing_dayoff(int using_dayoff) {
		this.using_dayoff = using_dayoff;
	}
	
	public String getStart_dayoff() {
		return start_dayoff;
	}
	
	public void setStart_dayoff(String start_dayoff) {
		this.start_dayoff = start_dayoff;
	}
	
	public String getEnd_dayoff() {
		return end_dayoff;
	}
	
	public void setEnd_dayoff(String end_dayoff) {
		this.end_dayoff = end_dayoff;
	}
	
	public String getConfirm() {
		return confirm;
	}
	
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	

}

package com.group4.erp;

public class HrDayoffJoinDTO {
	private int emp_no;
	private int dayoff_cd;
	private String start_dayoff;
	private String end_dayoff;
	private int using_dayoff;
	private double harf_dayoff;
	
	
	public double getHarf_dayoff() {
		return harf_dayoff;
	}
	public void setHarf_dayoff(double harf_dayoff) {
		this.harf_dayoff = harf_dayoff;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getDayoff_cd() {
		return dayoff_cd;
	}
	public void setDayoff_cd(int dayoff_cd) {
		this.dayoff_cd = dayoff_cd;
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
	public int getUsing_dayoff() {
		return using_dayoff;
	}
	public void setUsing_dayoff(int using_dayoff) {
		this.using_dayoff = using_dayoff;
	}
	
	
}

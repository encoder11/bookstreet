package com.group4.erp;

public class BusinessTripDTO {

	private int work_outside_seq;
	private int RNUM;
	private int emp_no;
	private int dep_no;
	private int mgr_no;
	private String emp_name;
	private String dep_name;
	private String mgr_name;
	private String jikup;
	private String login_emp_id;
	private String login_dep_no;
	private String login_mgr_no;
	private String login_jikup;
	private String login_mgr; 
	private String destination;
	private String work_outside_reason;
	private String outside_start_time;
	private String outside_end_time;
	private String travel_payment;
	private String deleteYn;
	
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public int getWork_outside_seq() {
		return work_outside_seq;
	}
	public void setWork_outside_seq(int work_outside_seq) {
		this.work_outside_seq = work_outside_seq;
	}
	public int getRNUM() {
		return RNUM;
	}
	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getDep_no() {
		return dep_no;
	}
	public void setDep_no(int dep_no) {
		this.dep_no = dep_no;
	}
	public int getMgr_no() {
		return mgr_no;
	}
	public void setMgr_no(int mgr_no) {
		this.mgr_no = mgr_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
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
	public String getLogin_emp_id() {
		return login_emp_id;
	}
	public void setLogin_emp_id(String login_emp_id) {
		this.login_emp_id = login_emp_id;
	}
	public String getLogin_dep_no() {
		return login_dep_no;
	}
	public void setLogin_dep_no(String login_dep_no) {
		this.login_dep_no = login_dep_no;
	}
	public String getLogin_mgr_no() {
		return login_mgr_no;
	}
	public void setLogin_mgr_no(String login_mgr_no) {
		this.login_mgr_no = login_mgr_no;
	}
	public String getLogin_jikup() {
		return login_jikup;
	}
	public void setLogin_jikup(String login_jikup) {
		this.login_jikup = login_jikup;
	}
	public String getLogin_mgr() {
		return login_mgr;
	}
	public void setLogin_mgr(String login_mgr) {
		this.login_mgr = login_mgr;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getWork_outside_reason() {
		return work_outside_reason;
	}
	public void setWork_outside_reason(String work_outside_reason) {
		this.work_outside_reason = work_outside_reason;
	}
	public String getOutside_start_time() {
		return outside_start_time;
	}
	public void setOutside_start_time(String outside_start_time) {
		this.outside_start_time = outside_start_time;
	}
	public String getOutside_end_time() {
		return outside_end_time;
	}
	public void setOutside_end_time(String outside_end_time) {
		this.outside_end_time = outside_end_time;
	}
	public String getTravel_payment() {
		return travel_payment;
	}
	public void setTravel_payment(String travel_payment) {
		this.travel_payment = travel_payment;
	}
}

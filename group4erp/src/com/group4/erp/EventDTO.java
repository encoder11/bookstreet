package com.group4.erp;

public class EventDTO {

	private String RNUM;
	private String evnt_no;
	private String emp_name;
	private String jikup;
	private int emp_no;
	private int evnt_cd;
	private String evnt_category;
	private String evnt_title;
	private String tot_est_cost;
	private String tot_cost;
	private String evnt_start_dt;
	private String evnt_end_dt;
	private String evnt_stat;
	private String evnt_comment="";
	private String atchd_data;
	private String reg_dt;
	private String evnt_state_cd;
	private String document_no;
	private String mgr_name;
	


	public String getRNUM() {
		return RNUM;
	}

	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getMgr_name() {
		return mgr_name;
	}

	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}
	public String getDocument_no() {
		return document_no;
	}

	public void setDocument_no(String document_no) {
		this.document_no = document_no;
	}

	public String getEvnt_state_cd() {
		return evnt_state_cd;
	}

	public void setEvnt_state_cd(String evnt_state_cd) {
		this.evnt_state_cd = evnt_state_cd;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getJikup() {
		return jikup;
	}

	public void setJikup(String jikup) {
		this.jikup = jikup;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getEvnt_cd() {
		return evnt_cd;
	}

	public void setEvnt_cd(int evnt_cd) {
		this.evnt_cd = evnt_cd;
	}
	
	public String getEvnt_no() {
		return evnt_no;
	}

	public void setEvnt_no(String evnt_no) {
		this.evnt_no = evnt_no;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	public String getEvnt_category() {
		return evnt_category;
	}
	
	public void setEvnt_category(String evnt_category) {
		this.evnt_category = evnt_category;
	}
	
	public String getEvnt_title() {
		return evnt_title;
	}
	
	public void setEvnt_title(String evnt_title) {
		this.evnt_title = evnt_title;
	}
	
	public String getTot_est_cost() {
		return tot_est_cost;
	}
	
	public void setTot_est_cost(String tot_est_cost) {
		this.tot_est_cost = tot_est_cost;
	}
	
	public String getTot_cost() {
		return tot_cost;
	}
	
	public void setTot_cost(String tot_cost) {
		this.tot_cost = tot_cost;
	}
	
	public String getEvnt_start_dt() {
		return evnt_start_dt;
	}
	
	public void setEvnt_start_dt(String evnt_start_dt) {
		this.evnt_start_dt = evnt_start_dt;
	}
	
	public String getEvnt_end_dt() {
		return evnt_end_dt;
	}
	
	public void setEvnt_end_dt(String evnt_end_dt) {
		this.evnt_end_dt = evnt_end_dt;
	}
	
	public String getEvnt_stat() {
		return evnt_stat;
	}
	
	public void setEvnt_stat(String evnt_stat) {
		this.evnt_stat = evnt_stat;
	}
	
	public String getEvnt_comment() {
		return evnt_comment;
	}
	
	public void setEvnt_comment(String evnt_comment) {
		this.evnt_comment = evnt_comment;
	}
	
	public String getAtchd_data() {
		return atchd_data;
	}
	
	public void setAtchd_data(String atchd_data) {
		this.atchd_data = atchd_data;
	}

}

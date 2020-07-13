package com.group4.erp;

public class AdApplyDTO {
	

	//private String ad_apply_no;
	private int ad_apply_no;
	private String corp_no;
	private String applicant_name;
	private String emp_no;
	private String ad_title;
	private String img_doc;
	private String reg_dt;
	private String open_req_dt;
	private String open_req_area;
	private int open_req_area_cd;
	private String ad_term;
	private String ad_pay_method;
	private String ad_stat;
	private String ad_state_cd;

	public int getOpen_req_area_cd() {
		return open_req_area_cd;
	}
	public void setOpen_req_area_cd(int open_req_area_cd) {
		this.open_req_area_cd = open_req_area_cd;
	}
	
	public String getAd_state_cd() {
		return ad_state_cd;
	}
	public void setAd_state_cd(String ad_state_cd) {
		this.ad_state_cd = ad_state_cd;
	}
	
	public String getAd_stat() {
		return ad_stat;
	}
	public void setAd_stat(String ad_stat) {
		this.ad_stat = ad_stat;
	}
	
	public int getAd_apply_no() {
		return ad_apply_no;
	}
	public void setAd_apply_no(int ad_apply_no) {
		this.ad_apply_no = ad_apply_no;
	}
	public String getCorp_no() {
		return corp_no;
	}
	public void setCorp_no(String corp_no) {
		this.corp_no = corp_no;
	}
	public String getApplicant_name() {
		return applicant_name;
	}
	public void setApplicant_name(String applicant_name) {
		this.applicant_name = applicant_name;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getAd_title() {
		return ad_title;
	}
	public void setAd_title(String ad_title) {
		this.ad_title = ad_title;
	}
	public String getImg_doc() {
		return img_doc;
	}
	public void setImg_doc(String img_doc) {
		this.img_doc = img_doc;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getOpen_req_dt() {
		return open_req_dt;
	}
	public void setOpen_req_dt(String open_req_dt) {
		this.open_req_dt = open_req_dt;
	}
	public String getOpen_req_area() {
		return open_req_area;
	}
	public void setOpen_req_area(String open_req_area) {
		this.open_req_area = open_req_area;
	}
	public String getAd_term() {
		return ad_term;
	}
	public void setAd_term(String ad_term) {
		this.ad_term = ad_term;
	}
	public String getAd_pay_method() {
		return ad_pay_method;
	}
	public void setAd_pay_method(String ad_pay_method) {
		this.ad_pay_method = ad_pay_method;
	}


}

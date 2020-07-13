package com.group4.erp;

public class ApprovalDTO {

	private String e_works_no;
	private String document_no;
	private int doc_no;
	private int emp_no;
	private String emp_name;
	private int mgr_emp_no;
	private String mgr_name;
	private String e_works_req_dt;
	private String e_works_res_dt;
	private String e_works_state_cd;
	private String e_work_comment="";
	private String approval_state;
	private String jikup;
	private String approval_num;
	private String confirm;
	private int mgr_emp;
	

	public int getMgr_emp() {
		return mgr_emp;
	}

	public void setMgr_emp(int mgr_emp) {
		this.mgr_emp = mgr_emp;
	}

	public int getDoc_no() {
		return doc_no;
	}

	public void setDoc_no(int doc_no) {
		this.doc_no = doc_no;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	
	public String getApproval_num() {
		return approval_num;
	}

	public void setApproval_num(String approval_num) {
		this.approval_num = approval_num;
	}

	public String getJikup() {
		return jikup;
	}

	public void setJikup(String jikup) {
		this.jikup = jikup;
	}

	
	public String getE_works_no() {
		return e_works_no;
	}
	
	public void setE_works_no(String e_works_no) {
		this.e_works_no = e_works_no;
	}
	
	public String getDocument_no() {
		return document_no;
	}
	
	public void setDocument_no(String document_no) {
		this.document_no = document_no;
	}
	
	public int getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	public int getMgr_emp_no() {
		return mgr_emp_no;
	}
	
	public void setMgr_emp_no(int mgr_emp_no) {
		this.mgr_emp_no = mgr_emp_no;
	}
	
	public String getMgr_name() {
		return mgr_name;
	}
	
	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}
	
	public String getE_works_req_dt() {
		return e_works_req_dt;
	}
	
	public void setE_works_req_dt(String e_works_req_dt) {
		this.e_works_req_dt = e_works_req_dt;
	}
	
	public String getE_works_res_dt() {
		return e_works_res_dt;
	}
	
	public void setE_works_res_dt(String e_works_res_dt) {
		this.e_works_res_dt = e_works_res_dt;
	}
	
	public String getE_works_state_cd() {
		return e_works_state_cd;
	}
	
	public void setE_works_state_cd(String e_works_state_cd) {
		this.e_works_state_cd = e_works_state_cd;
	}
	
	public String getE_work_comment() {
		return e_work_comment;
	}
	
	public void setE_work_comment(String e_work_comment) {
		this.e_work_comment = e_work_comment;
	}
	
	public String getApproval_state() {
		return approval_state;
	}
	
	public void setApproval_state(String approval_state) {
		this.approval_state = approval_state;
	}
	
	
}

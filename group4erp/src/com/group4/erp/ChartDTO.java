package com.group4.erp;

public class ChartDTO {

	private String cnt;
	private String dt;
	private String cat_cd;
	private String cat_name;
	private String jikup;
	private String tot_cnt;
	private String hire_cnt;
	private String resign_cnt;
	
	public String getTot_cnt() {
		return tot_cnt;
	}

	public void setTot_cnt(String tot_cnt) {
		this.tot_cnt = tot_cnt;
	}

	public String getHire_cnt() {
		return hire_cnt;
	}

	public void setHire_cnt(String hire_cnt) {
		this.hire_cnt = hire_cnt;
	}

	public String getResign_cnt() {
		return resign_cnt;
	}

	public void setResign_cnt(String resign_cnt) {
		this.resign_cnt = resign_cnt;
	}


	public String getJikup() {
		return jikup;
	}

	public void setJikup(String jikup) {
		this.jikup = jikup;
	}


	public String getCnt() {
		return cnt;
	}
	
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	
	public String getDt() {
		return dt;
	}
	
	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getCat_cd() {
		return cat_cd;
	}

	public void setCat_cd(String cat_cd) {
		this.cat_cd = cat_cd;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

}

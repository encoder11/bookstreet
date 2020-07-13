package com.group4.erp;

public class BestKwdDTO {

	private String srch_kwd;
	private String srch_dt;
	private String kwd_cnt;
	private String date;
	private String rank;
	private String RNUM;
	

	public String getRNUM() {
		return RNUM;
	}

	public void setRNUM(String rNUM) {
		RNUM = rNUM;
	}
	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getKwd_cnt() {
		return kwd_cnt;
	}

	public void setKwd_cnt(String kwd_cnt) {
		this.kwd_cnt = kwd_cnt;
	}
	
	public String getSrch_kwd() {
		return srch_kwd;
	}
	
	public void setSrch_kwd(String srch_kwd) {
		this.srch_kwd = srch_kwd;
	}
	
	public String getSrch_dt() {
		return srch_dt;
	}
	
	public void setSrch_dt(String srch_dt) {
		this.srch_dt = srch_dt;
	}

}

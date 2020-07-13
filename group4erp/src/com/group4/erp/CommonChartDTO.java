package com.group4.erp;

public class CommonChartDTO {
	private String title;
	private int cnt;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "CommonChartDTO [title=" + title + ", cnt=" + cnt + "]";
	}

}

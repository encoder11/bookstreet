package com.group4.erp;

import java.util.List;

public class MainChartsDTO {
	private List<CommonChartDTO> sellingStat;
	private List<CommonChartDTO> ageStat;
	private List<CommonChartDTO> genderStat;
	private List<CommonChartDTO> eventStat;
	private List<CommonChartDTO> orderStat;
	private List<CommonChartDTO> returnStat;
	private int reg_cnt = 0;
	private int return_cnt = 0;
	private int order_cnt = 0;
	private int corp_order_cnt = 0;

	public List<CommonChartDTO> getSellingStat() {
		return sellingStat;
	}

	public void setSellingStat(List<CommonChartDTO> sellingStat) {
		this.sellingStat = sellingStat;
	}

	public List<CommonChartDTO> getAgeStat() {
		return ageStat;
	}

	public void setAgeStat(List<CommonChartDTO> ageStat) {
		this.ageStat = ageStat;
	}

	public List<CommonChartDTO> getGenderStat() {
		return genderStat;
	}

	public void setGenderStat(List<CommonChartDTO> genderStat) {
		this.genderStat = genderStat;
	}

	public List<CommonChartDTO> getEventStat() {
		return eventStat;
	}

	public void setEventStat(List<CommonChartDTO> eventStat) {
		this.eventStat = eventStat;
	}
	

	public int getReg_cnt() {
		return reg_cnt;
	}

	public void setReg_cnt(int reg_cnt) {
		this.reg_cnt = reg_cnt;
	}

	public int getReturn_cnt() {
		return return_cnt;
	}

	public void setReturn_cnt(int return_cnt) {
		this.return_cnt = return_cnt;
	}

	public int getOrder_cnt() {
		return order_cnt;
	}

	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}

	public int getCorp_order_cnt() {
		return corp_order_cnt;
	}

	public void setCorp_order_cnt(int corp_order_cnt) {
		this.corp_order_cnt = corp_order_cnt;
	}
	
	
	public List<CommonChartDTO> getOrderStat() {
		return orderStat;
	}

	public void setOrderStat(List<CommonChartDTO> orderStat) {
		this.orderStat = orderStat;
	}

	public List<CommonChartDTO> getReturnStat() {
		return returnStat;
	}

	public void setReturnStat(List<CommonChartDTO> returnStat) {
		this.returnStat = returnStat;
	}

	@Override
	public String toString() {
		return "MainChartsDTO [sellingStat=" + sellingStat + ", ageStat=" + ageStat + ", genderStat=" + genderStat
				+ ", eventStat=" + eventStat + "]";
	}

}

package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.CommonChartDTO;

public interface MainDAO {

	List<CommonChartDTO> getSellingStat();
	List<CommonChartDTO> getAgeStat();
	List<CommonChartDTO> getEventStat();
	List<CommonChartDTO> getGenderStat();
	List<Map<String, String>> getMonthEvnt();
	CommonChartDTO getOrderStat();
	CommonChartDTO getReturnStat();
	List<Map<String, String>> getBestSellers();

}

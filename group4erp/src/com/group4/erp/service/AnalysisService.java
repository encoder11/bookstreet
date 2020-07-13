package com.group4.erp.service;

import java.util.List;

import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;
import com.group4.erp.ChartDTO;

public interface AnalysisService {
	
	List<BestKwdDTO> getBestKwdList(BestKwdSearchDTO bestKwdSearchDTO);
	
	List<BestKwdDTO> getKeywdSrchCntChart();
	
	List<BestKwdDTO> getBestKwdListChart(BestKwdSearchDTO bestKwdSearchDTO);
	
	List<ChartDTO> getMonthlyBookRegChart();
	
	List<ChartDTO> getBookCategoryList();
	
	List<ChartDTO> getCategoryRegChart(String cat_cd);
	
	List<ChartDTO> getEmployeeCntChart();
	
	List<ChartDTO> getEmpHireOrResignChart();
	
	List<ChartDTO> getCatInventoryChart();

}

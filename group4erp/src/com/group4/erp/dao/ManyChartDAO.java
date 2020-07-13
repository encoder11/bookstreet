package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.ManyChartDTO;
import com.group4.erp.ManyChartOnlineDTO;



public interface ManyChartDAO {

	List<ManyChartDTO> getPerBookCat();

	List<ManyChartDTO> getPerCorpArea();
	
	ManyChartDTO getPerLine();
	
	ManyChartDTO getPerMember();
	
	ManyChartDTO getPerLeave();

	List<ManyChartDTO> getPerOnlineOrder();
	
	List<ManyChartDTO> getPerOffOrder();

	List<ManyChartDTO> getDeptEmpCnt();
	
	List<ManyChartDTO> getmonthTotMoney();

	List<ManyChartDTO> getOffMonthTotMoney();

	List<ManyChartOnlineDTO> getPerOnlineOrderAjax(String month_choice);
	List<ManyChartOnlineDTO> getPerOfflineOrderAjax(String month_choice);
	
	List<Map<String, String>> getBestSellers();
	
	List<ManyChartDTO> getPerReturn();
	
	List<ManyChartDTO> getCreditTot();
	List<ManyChartDTO> getDebitTot();
}

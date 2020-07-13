package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;
import com.group4.erp.ChartDTO;
import com.group4.erp.dao.AnalysisDAO;

@Service
public class AnalysisServiceImpl implements AnalysisService {
	
	@Autowired
	AnalysisDAO analysisDAO;

	@Override
	public List<BestKwdDTO> getBestKwdList(BestKwdSearchDTO bestKwdSearchDTO) {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKwdList = this.analysisDAO.getBestKwdList(bestKwdSearchDTO);
		
		return bestKwdList;
	}

	@Override
	public List<BestKwdDTO> getKeywdSrchCntChart() {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKeywdInfo = this.analysisDAO.getKeywdSrchCntChart();
		
		return bestKeywdInfo;
	}

	@Override
	public List<BestKwdDTO> getBestKwdListChart(BestKwdSearchDTO bestKwdSearchDTO) {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKwdListChart = this.analysisDAO.getBestKwdListChart(bestKwdSearchDTO);
		
		return bestKwdListChart;
	}

	@Override
	public List<ChartDTO> getMonthlyBookRegChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> monthlyBookRegChart = this.analysisDAO.getMonthlyBookRegChart();
		
		return monthlyBookRegChart;
	}

	@Override
	public List<ChartDTO> getBookCategoryList() {
		// TODO Auto-generated method stub
		List<ChartDTO> bookCategoryList = this.analysisDAO.getBookCategoryList();
		
		return bookCategoryList;
	}

	@Override
	public List<ChartDTO> getCategoryRegChart(String cat_cd) {
		// TODO Auto-generated method stub
		List<ChartDTO> categoryRegChart = this.analysisDAO.getCategoryRegChart(cat_cd);
		
		return categoryRegChart;
	}

	@Override
	public List<ChartDTO> getEmployeeCntChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> employeeCntChart = this.analysisDAO.getEmployeeCntChart();
		
		return employeeCntChart;
	}

	@Override
	public List<ChartDTO> getEmpHireOrResignChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> empHireOrResignCnt = this.analysisDAO.getEmpHireOrResignChart();
		
		return empHireOrResignCnt;
	}

	@Override
	public List<ChartDTO> getCatInventoryChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> catInventoryChart = this.analysisDAO.getCatInventoryChart();
		
		return catInventoryChart;
	}

}

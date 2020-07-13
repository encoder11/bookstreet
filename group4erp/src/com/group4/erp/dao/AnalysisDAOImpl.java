package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;
import com.group4.erp.ChartDTO;

@Repository
public class AnalysisDAOImpl implements AnalysisDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.AnalysisDAO.";

	@Override
	public List<BestKwdDTO> getBestKwdList(BestKwdSearchDTO bestKwdSearchDTO) {
		// TODO Auto-generated method stub
		
		List<BestKwdDTO> bestKwdList = this.sqlSession.selectList(mapper_namespace+"getBestKwdList", bestKwdSearchDTO);
		
		return bestKwdList;
	}

	@Override
	public List<BestKwdDTO> getKeywdSrchCntChart() {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKeywdInfo = this.sqlSession.selectList(mapper_namespace+"getKeywdSrchCntChart");
		
		return bestKeywdInfo;
	}

	@Override
	public List<BestKwdDTO> getBestKwdListChart(BestKwdSearchDTO bestKwdSearchDTO) {
		// TODO Auto-generated method stub
		List<BestKwdDTO> bestKwdListChart = this.sqlSession.selectList(mapper_namespace+"getBestKwdListChart", bestKwdSearchDTO);
		
		return bestKwdListChart;
	}

	@Override
	public List<ChartDTO> getMonthlyBookRegChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> monthlyBookRegChart = this.sqlSession.selectList(mapper_namespace+"getMonthlyBookRegChart");
		
		return monthlyBookRegChart;
	}

	@Override
	public List<ChartDTO> getBookCategoryList() {
		// TODO Auto-generated method stub
		List<ChartDTO> bookCategoryList = this.sqlSession.selectList(mapper_namespace+"getBookCategoryList");
		
		return bookCategoryList;
	}

	@Override
	public List<ChartDTO> getCategoryRegChart(String cat_cd) {
		// TODO Auto-generated method stub
		List<ChartDTO> categoryRegChart = this.sqlSession.selectList(mapper_namespace+"getCategoryRegChart", cat_cd);
		
		return categoryRegChart;
	}

	@Override
	public List<ChartDTO> getEmployeeCntChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> employeeCntChart = this.sqlSession.selectList(mapper_namespace+"getEmployeeCntChart");
		
		return employeeCntChart;
	}

	@Override
	public List<ChartDTO> getEmpHireOrResignChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> empHireOrResignCnt = this.sqlSession.selectList(mapper_namespace+"getEmpHireOrResignChart");
		
		return empHireOrResignCnt;
	}

	@Override
	public List<ChartDTO> getCatInventoryChart() {
		// TODO Auto-generated method stub
		List<ChartDTO> catInventoryChart = this.sqlSession.selectList(mapper_namespace+"getCatInventoryChart");

		return catInventoryChart;
	}

}

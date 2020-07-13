package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.ManyChartDTO;
import com.group4.erp.ManyChartOnlineDTO;


//[DAO 클래스]인 [LoginDAOImpl 클래스]선언
	//@Repository를 붙임으로써 DAO클래스 임을 지정하게되고, bean 태그로 자동 등록된다
@Repository
public class ManyChartDAOImpl implements ManyChartDAO {
	
	//SqlSessionTemplate객체를 생성해 속성변수 sqlSession에 저장
	//속성변수 sqlSession 선언하고, @Autowired에 의해 SqlSessionTemplate클래스를 객체화하여 저장한다
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public List<ManyChartDTO> getPerBookCat() {
		
		List<ManyChartDTO> perBookCat = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerBookCat"
				);
		
		return perBookCat;
	}
	
	public List<ManyChartDTO> getPerCorpArea(){
		
		List<ManyChartDTO> perCorpArea = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerCorpArea"
				);
		
		return perCorpArea;
	}
	
	public ManyChartDTO getPerLine() {
		
		ManyChartDTO perLine = this.sqlSession.selectOne(
				"com.group4.erp.dao.manyChartDAO.getPerLine"
				);
		
		return perLine;
	}
	
	public ManyChartDTO getPerMember() {
		
		ManyChartDTO perMember = this.sqlSession.selectOne(
				"com.group4.erp.dao.manyChartDAO.getPerMember"
				);
		
		return perMember;
	}

	public ManyChartDTO getPerLeave() {
		
		ManyChartDTO perLeave = this.sqlSession.selectOne(
				"com.group4.erp.dao.manyChartDAO.getPerLeave"
				);
		
		return perLeave;
	}
	
	public List<ManyChartDTO> getPerOnlineOrder(){
		
		List<ManyChartDTO> perOnlineOrder = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerOnlineOrder"
				);
		
		return perOnlineOrder;
	}
	
	public List<ManyChartDTO> getPerOffOrder(){
		
		List<ManyChartDTO> perOffOrder = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerOffOrder"
				);
		
		return perOffOrder;
	}
	
	public List<ManyChartDTO> getDeptEmpCnt(){
		
		List<ManyChartDTO> deptEmpCnt = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getDeptEmpCnt"
				);
		
		return deptEmpCnt;
	}
	
	public List<ManyChartDTO> getmonthTotMoney(){
		
		List<ManyChartDTO> monthTotMoney = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getMonthTotMoney"
				);
		
		return monthTotMoney;
	}
	
	public List<ManyChartDTO> getOffMonthTotMoney(){
		
		List<ManyChartDTO> offMonthTotMoney = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getOffMonthTotMoney"
				);
		
		return offMonthTotMoney;
	}
	
	public List<ManyChartOnlineDTO> getPerOnlineOrderAjax(String month_choice){
		
		List<ManyChartOnlineDTO> perOnlineOrder = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerOnlineOrderAjax"
				,month_choice
				);
		
		return perOnlineOrder;
	}
public List<ManyChartOnlineDTO> getPerOfflineOrderAjax(String month_choice){
		
		List<ManyChartOnlineDTO> perOfflineOrder = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerOfflineOrderAjax"
				,month_choice
				);
		
		return perOfflineOrder;
	}
	
	public List<Map<String, String>> getBestSellers(){
		
		List<Map<String, String>> bestSellers = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getBestSellers"
				);
		
		return bestSellers;
	}
	
	public List<ManyChartDTO> getPerReturn(){
		
		List<ManyChartDTO> perReturnCnt = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerReturnCnt"
				);
		
		return perReturnCnt;
	}
	
	public List<ManyChartDTO> getCreditTot(){
		
		List<ManyChartDTO> creditTot = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getCreditTot"
				);
		
		return creditTot;
	}
	public List<ManyChartDTO> getDebitTot(){
		
		List<ManyChartDTO> debitTot = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getDebitTot"
				);
		
		return debitTot;
	}
}

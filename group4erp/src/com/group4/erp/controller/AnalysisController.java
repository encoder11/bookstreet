/*
 * 회계업무 관련 기능들을 처리
 * 
 */

package com.group4.erp.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.CorpSearchDTO;
import com.group4.erp.ManyChartDTO;
import com.group4.erp.OrderDTO;
import com.group4.erp.SalesInfoDTO;
import com.group4.erp.WarehousingSearchDTO;
import com.group4.erp.dao.ManyChartDAO;
import com.group4.erp.BestKwdDTO;
import com.group4.erp.BestKwdSearchDTO;
import com.group4.erp.ChartDTO;
import com.group4.erp.service.AnalysisService;


@Controller
public class AnalysisController {
	
	@Autowired
	AnalysisService analysisService;
	
	@Autowired
	private ManyChartDAO manyDAO;
	
	@RequestMapping(value="/viewBestKeywdAnalysis.do")
	public ModelAndView viewBestKeywdAnalysis(HttpSession session, BestKwdSearchDTO bestKwdSearchDTO, String rank) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewkeywdAnalysis");
		mav.addObject("navigator", "[전략분석] → [인기 키워드 현황]");
		
		try {
			
			//System.out.println("bestKwdDTO.getRank==="+bestKwdDTO.getRank());
			System.out.println("rank=="+rank);
			
			bestKwdSearchDTO.setRank(rank);
			
			List<BestKwdDTO> bestKwdDTOList = this.analysisService.getBestKwdList(bestKwdSearchDTO);
			
			String bestKwd_chart_data = "[";
			bestKwd_chart_data += "['날짜', '횟수']";
			
			List<BestKwdDTO> bestKeywdInfo = this.analysisService.getKeywdSrchCntChart();
			
			for(int i=0; i<bestKeywdInfo.size(); i++) {
				bestKwd_chart_data += ", ['";
				bestKwd_chart_data += bestKeywdInfo.get(i).getDate();
				bestKwd_chart_data += "', ";
				bestKwd_chart_data += bestKeywdInfo.get(i).getKwd_cnt();
				bestKwd_chart_data += "] ";
			}
			bestKwd_chart_data += "]";
			
			
			
			//보류
			//List<BestKwdDTO> bestKeywdChart = this.analysisService.getBestKwdListChart(bestKwdSearchDTO);
			
			//String bestKwdDailyChart_data = "[";
			//bestKwdDailyChart_data += "['날짜', '검색횟수']";
			
			
			mav.addObject("bestKwdDTOList", bestKwdDTOList);
			//mav.addObject("bestKwdDTO", bestKwdDTO);
			mav.addObject("bestKwd_chart_data", bestKwd_chart_data);
			
		} catch(Exception e) {
			System.out.println("viewBestKeywdAnalysis() 메소드에서 예외 발생 "+e);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value = "/searchBestKwd.do", 
				method = RequestMethod.POST, 
				produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public List<BestKwdDTO> searchBestKwdProc(@RequestParam(value = "rank") String rank, BestKwdSearchDTO bestKwdSearchDTO, HttpSession session) {

		System.out.println("컨트롤러 시작"+rank);
		if(rank==null || rank.equals("")) {
			bestKwdSearchDTO.setRank(null);
		}
		
		bestKwdSearchDTO.setRank(rank);
		List<BestKwdDTO> bestKwdDTOList = null;
		
		try {
			bestKwdDTOList = this.analysisService.getBestKwdList(bestKwdSearchDTO);
			System.out.println("bestKwdDTOList.size==="+bestKwdDTOList.size());
			
		} catch (Exception e) {
			System.out.println("<베스트 키워드 페이지 불러오기 실패>");
			System.out.println("예외발생" + e.getMessage());
		}
		
		//System.out.println( warehContent.getBook_name() );
		return bestKwdDTOList;
	}
	
	
	@RequestMapping(value="/viewOurCompanyReport.do")
	public ModelAndView viewOurCompanyReport(HttpSession session, ChartDTO chartDTO, String cat_cd) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewOurCompanyReport");
		mav.addObject("navigator", "[전략분석] → [회사 현황]");
		
		if(cat_cd==null || cat_cd.equals(null)) {
			cat_cd = "1";
		}
		
		System.out.println("cat_cd==="+cat_cd);
		
		List<ChartDTO> bookCategoryList = this.analysisService.getBookCategoryList();
		
		List<ChartDTO> monthlyBookRegChart = this.analysisService.getMonthlyBookRegChart();
		
		List<ChartDTO> categoryRegChart = this.analysisService.getCategoryRegChart(cat_cd);
		
		List<ChartDTO> employeeChart = this.analysisService.getEmployeeCntChart();
		
		String employee_chart_data = "[";
		employee_chart_data += "['직급', '인원수']";
		
		for(int i=0; i<employeeChart.size(); i++) {
			
			if(employeeChart.get(i).getJikup()==null) {
				employeeChart.get(i).setJikup("미승인");
			}
			employee_chart_data += ", ['";
			employee_chart_data += employeeChart.get(i).getJikup();
			employee_chart_data += "', ";
			employee_chart_data += employeeChart.get(i).getCnt();
			employee_chart_data += "] ";
		}
		
		employee_chart_data += "]";

		String bookCategory_reg_chart_data = "[";
		bookCategory_reg_chart_data += "['기간', '건수']";
		for(int i=0; i<categoryRegChart.size(); i++) {
			bookCategory_reg_chart_data += ", ['";
			bookCategory_reg_chart_data += categoryRegChart.get(i).getDt();
			bookCategory_reg_chart_data += "', ";
			bookCategory_reg_chart_data += categoryRegChart.get(i).getCnt();
			bookCategory_reg_chart_data += "] ";
		}
		
		bookCategory_reg_chart_data += "]";
		
		String monthlyBook_reg_chart_data = "[";
		monthlyBook_reg_chart_data += "['기간', '건수']";
		
		for(int i=0; i<monthlyBookRegChart.size(); i++) {
			monthlyBook_reg_chart_data += ", ['";
			monthlyBook_reg_chart_data += monthlyBookRegChart.get(i).getDt();
			monthlyBook_reg_chart_data += "', ";
			monthlyBook_reg_chart_data += monthlyBookRegChart.get(i).getCnt();
			monthlyBook_reg_chart_data += "] ";
		}
		monthlyBook_reg_chart_data += "]";
		
		List<ChartDTO> empHireOrResignChart = this.analysisService.getEmpHireOrResignChart();
		
		String empHireOrResign_data = "[";
		empHireOrResign_data += "['기간', '총원', '채용인원수', '퇴사인원수']";
		
		for(int i=0; i<empHireOrResignChart.size(); i++) {
			empHireOrResign_data += ", ['";
			empHireOrResign_data += empHireOrResignChart.get(i).getDt();
			empHireOrResign_data += "', ";
			empHireOrResign_data += empHireOrResignChart.get(i).getTot_cnt();
			empHireOrResign_data += ", ";
			empHireOrResign_data += empHireOrResignChart.get(i).getHire_cnt();
			empHireOrResign_data += ", ";
			empHireOrResign_data += empHireOrResignChart.get(i).getResign_cnt();
			empHireOrResign_data += "] ";
		}
		empHireOrResign_data += "]";
		
		List<ChartDTO> catInventoryChart = this.analysisService.getCatInventoryChart();
		String catInventory_chart_data = "[";
		catInventory_chart_data += "['카테고리', '보유수량']";
		
		for(int i=0; i<catInventoryChart.size(); i++) {
			catInventory_chart_data += ", ['";
			catInventory_chart_data += catInventoryChart.get(i).getCat_name();
			catInventory_chart_data += "', ";
			catInventory_chart_data += catInventoryChart.get(i).getCnt();
			catInventory_chart_data += "] ";
		}
		
		catInventory_chart_data += "] ";
		
		
		List<ManyChartDTO> deptEmpCnt = this.manyDAO.getDeptEmpCnt();
		mav.addObject("deptEmpCnt", deptEmpCnt);
		
		ManyChartDTO perLeave = this.manyDAO.getPerLeave();
		mav.addObject("perLeave", perLeave);

		List<ManyChartDTO> perBookCat = this.manyDAO.getPerBookCat();
		mav.addObject("perBookCat", perBookCat);
		
		List<ManyChartDTO> perCorpArea = this.manyDAO.getPerCorpArea();
		mav.addObject("perCorpArea", perCorpArea);
		
		
		mav.addObject("bookCategoryList", bookCategoryList);
		mav.addObject("employee_chart_data", employee_chart_data);
		mav.addObject("monthlyBook_reg_chart_data", monthlyBook_reg_chart_data);
		mav.addObject("empHireOrResign_data", empHireOrResign_data);
		mav.addObject("bookCategory_reg_chart_data", bookCategory_reg_chart_data);
		mav.addObject("catInventory_chart_data", catInventory_chart_data);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/viewCategoryChart.do", 
			method = RequestMethod.POST, 
			produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public ModelAndView viewCategoryChartReport(HttpSession session, ChartDTO chartDTO, String cat_cd) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ChartDTO> categoryRegChart = this.analysisService.getCategoryRegChart(cat_cd);
		System.out.println("viewCategoryChartReport 메소드 실행==="+cat_cd);
		String bookCategory_reg_chart_data = "[";
		bookCategory_reg_chart_data += "['기간', '건수']";
		for(int i=0; i<categoryRegChart.size(); i++) {
			bookCategory_reg_chart_data += ", ['";
			bookCategory_reg_chart_data += categoryRegChart.get(i).getDt();
			bookCategory_reg_chart_data += "', ";
			bookCategory_reg_chart_data += categoryRegChart.get(i).getCnt();
			bookCategory_reg_chart_data += "] ";
		}
		
		bookCategory_reg_chart_data += "]";
		
		System.out.println(bookCategory_reg_chart_data);
		
		mav.addObject("bookCategory_reg_chart_data", bookCategory_reg_chart_data);
		
		return mav;
	}
	
	
}

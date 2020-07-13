package com.group4.erp.controller;

import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.ManyChartDTO;
import com.group4.erp.ManyChartOnlineDTO;
import com.group4.erp.dao.ManyChartDAO;
import com.group4.erp.service.LoginService;



@Controller
public class CharController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ManyChartDAO manyDAO;
	
	
	@RequestMapping(value="/goMyChart.do")
	public ModelAndView chartForm(
			HttpSession httpsession,
			ManyChartDTO manychartDTO
			) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("manyChart.jsp");
		
		
		try {
			
			List<ManyChartDTO> perBookCat = this.manyDAO.getPerBookCat();
			mav.addObject("perBookCat", perBookCat);
			
			List<ManyChartDTO> perCorpArea = this.manyDAO.getPerCorpArea();
			mav.addObject("perCorpArea", perCorpArea);
			
			ManyChartDTO perLine = this.manyDAO.getPerLine();
			mav.addObject("perLine", perLine);
			
			ManyChartDTO perMember = this.manyDAO.getPerMember();
			mav.addObject("perMember", perMember);
			
			ManyChartDTO perLeave = this.manyDAO.getPerLeave();
			mav.addObject("perLeave", perLeave);
			
			List<ManyChartDTO> perOnlineOrder = this.manyDAO.getPerOnlineOrder();
			mav.addObject("perOnlineOrder", perOnlineOrder);
			
			List<ManyChartDTO> perOffOrder = this.manyDAO.getPerOffOrder();
			mav.addObject("perOffOrder", perOffOrder);
			
			List<ManyChartDTO> deptEmpCnt = this.manyDAO.getDeptEmpCnt();
			mav.addObject("deptEmpCnt", deptEmpCnt);
			
			List<ManyChartDTO> monthTotMoney = this.manyDAO.getmonthTotMoney();
			mav.addObject("monthTotMoney", monthTotMoney);
			
			List<ManyChartDTO> offMonthTotMoney = this.manyDAO.getOffMonthTotMoney();
			mav.addObject("offMonthTotMoney", offMonthTotMoney);
			
			List<ManyChartDTO> perReturnCnt = this.manyDAO.getPerReturn();
			mav.addObject("perReturnCnt", perReturnCnt);
			
			List<ManyChartDTO> creditTot = this.manyDAO.getCreditTot();
			mav.addObject("creditTot", creditTot);
			
			List<ManyChartDTO> debitTot = this.manyDAO.getDebitTot();
			mav.addObject("debitTot", debitTot);
			
		}catch(Exception e) {
			System.out.println("<차트 불러오기 실패>");
			System.out.println("예외 발생 =>"+e);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/goOnlineOrderProc.do")
	@ResponseBody
	public List<ManyChartOnlineDTO> goOnlineOrderProc(
			@RequestParam(value = "month_choice", required = false) String month_choice
			) {
		System.out.println("month_choice =>" + month_choice);
		
		List<ManyChartOnlineDTO> perOnlineOrder = null;
		
		try {
			
			 perOnlineOrder = this.manyDAO.getPerOnlineOrderAjax(month_choice);
			
		}catch(Exception e) {
			System.out.println("<온라인 비율 비동기 실패>");
			System.out.println("예외 발생 =>"+e);
		}
		
		return perOnlineOrder;
	}
	
	@RequestMapping(value="/goOfflineOrderProc.do")
	@ResponseBody
	public List<ManyChartOnlineDTO> goOfflineOrderProc(
			@RequestParam(value = "month_choice", required = false) String month_choice
			) {
		System.out.println("month_choice =>" + month_choice);
		
		List<ManyChartOnlineDTO> perOfflineOrder = null;
		
		try {
			
			perOfflineOrder = this.manyDAO.getPerOfflineOrderAjax(month_choice);
			
		}catch(Exception e) {
			System.out.println("<온라인 비율 비동기 실패>");
			System.out.println("예외 발생 =>"+e);
		}
		
		return perOfflineOrder;
	}
	
	@RequestMapping(value="/goBestBook.do")
	public ModelAndView goBestBook() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manyCharts2.jsp");
		
		try {
			
			List<Map<String, String>> bestSellers = this.manyDAO.getBestSellers();
			mav.addObject("bestSellers", bestSellers);
			
		}catch(Exception e) {
			System.out.println("<베스트셀러 불러오기 실패>");
			System.out.println("예외 발생=> "+e);
		}
		
		return mav;
	}
	
}

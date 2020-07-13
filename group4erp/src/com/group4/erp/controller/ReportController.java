package com.group4.erp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.CorporationDTO;
import com.group4.erp.service.AccountService;
import com.group4.erp.CorpSearchDTO;

@Controller
public class ReportController {
	
	
	@Autowired
	AccountService accountService;
	
	//매출정보 기능 구현
	@RequestMapping(value="/viewSalesReport.do")
	public ModelAndView viewSalesReport(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewSalesReport");
		mav.addObject("navigator", "[회계관리] → [매출정보]");
		
		return mav;
	}
	
	
	//어음정보 관련 기능 구현
	@RequestMapping(value="/viewPromiNoteList.do")
	public ModelAndView viewPromiNoteList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewPromiNoteList");
		mav.addObject("navigator", "[회계관리] → [전자어음]");
		
		return mav;
	}
	
	@RequestMapping(value="/viewTaxInvoiceList.do")
	public ModelAndView viewTaxInvoiceList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTaxInvoiceList");
		mav.addObject("navigator", "[회계관리] → [세금계산서]");
		
		return mav;
	}
	
	@RequestMapping(value="/viewTaxInvoiceForm.do")
	public ModelAndView viewTaxInvoiceInfo(HttpSession session, CorpSearchDTO corpSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTaxInvoiceForm");
		mav.addObject("navigator", "[회계관리] → [세금계산서] → [발급하기]");
		
		int corpListCnt = this.accountService.getCorpListCnt(corpSearchDTO);
		List<CorporationDTO> corpList = this.accountService.getCorpList(corpSearchDTO);
		System.out.println("corpList size==="+corpList.size());
		
		mav.addObject("corpListCnt", corpListCnt);
		mav.addObject("corpList", corpList);
		
		return mav;
	}
	
	
	@RequestMapping(value="/selectCorp.do")
	public ModelAndView selectCorp(HttpSession session, String corp_no, CorpSearchDTO corpSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTaxInvoiceForm");
		
		try {
			System.out.println("selected corp_no=="+corp_no);
			int corpListCnt = this.accountService.getCorpListCnt(corpSearchDTO);
			List<CorporationDTO> corpList = this.accountService.getCorpList(corpSearchDTO);
			
			
			CorporationDTO selectedCorp = this.accountService.selectCorp(corp_no);
			//System.out.println("selectedCorp no=="+selectedCorp.getCorp_no());
			
			//mav.addObject("corpListCnt", corpListCnt);
			mav.addObject("selectedCorp", selectedCorp);
			mav.addObject("corpListCnt", corpListCnt);
			mav.addObject("corpList", corpList);
			
		} catch(Exception e) {
			System.out.println("예외발생=="+e);
		}
		
		return mav;
	}
	
}

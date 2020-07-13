package com.group4.client;

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
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.service.InvenService;
import com.group4.erp.service.LoginService;



@Controller
public class OrderBookController {
	
	@Autowired
	private OrderBookService orderBookService;	
	
	@Autowired
	private InvenService invenService;
	
	@RequestMapping(value="/goOrderBookList.do")
	public ModelAndView goOrderMainListPage(
			HttpSession session
			,InvenSearchDTO invenSearchDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_orderBookList.jsp");
		
		try {
			
			int bookListCnt = this.invenService.getBookListCnt(invenSearchDTO);
			mav.addObject("bookListCnt", bookListCnt);
			
			if(bookListCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = invenSearchDTO.getSelectPageNo();
				//한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = invenSearchDTO.getRowCntPerPage();
				//검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if(bookListCnt<beginRowNo) invenSearchDTO.setSelectPageNo(1);
			}
			
			List<Map<String, String>> BookList = this.invenService.getBookList(invenSearchDTO);
			mav.addObject("BookList", BookList);
			
		}catch(Exception e) {
			System.out.println("<책 주문 페이지 불러오기 실패>");
			System.out.println("예외 발생 =>"+e);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/goBookOrderPage.do")
	public ModelAndView goBookOrderPage(
			@RequestParam(value="isbn13") String isbn13
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_bookOrderPage.jsp");
		mav.addObject("isbn",isbn13);
		
		return mav;
	}
	
	@RequestMapping(value="/goOrderCus.do")
	@ResponseBody
	public int goBookOrderCus(
			BookOrderInsertDTO boinsertDTO
			) {
		
		int insertOrder = 0;
		
		try {
			
			int bookCnt = this.orderBookService.getBookCnt(boinsertDTO);
			
			if(bookCnt>boinsertDTO.getBook_qty()) {
				
				insertOrder = this.orderBookService.getInsertOrderCnt(boinsertDTO);
				
			}else {
				
				return -2;
			}
		}catch(Exception e) {
			System.out.println("<회원 주문 넣기 실패>");
			System.out.println("예외 발생 =>"+e);
			insertOrder = -1;
		}
		return insertOrder;
	}
	
	@RequestMapping(value="/goOrderNoCus.do")
	@ResponseBody
	public int goBookOrderNoCus(
			BookOrderInsertDTO boinsertDTO
			) {
		
		int insertOrderNo = 0;
		
		try {
			
			int bookCnt = this.orderBookService.getBookCnt(boinsertDTO);
			
			if(bookCnt>boinsertDTO.getBook_qty()) {
				
				int insertNoMember = this.orderBookService.getInMemberCnt(boinsertDTO);
				if(insertNoMember==0) {
					return -2;
				}
				
				insertOrderNo = this.orderBookService.getInsertOrderNoCnt(boinsertDTO);
				
			}else {
				
				return -2;
			}
		}catch(Exception e) {
			System.out.println("<비회원 주문 넣기 실패>");
			System.out.println("예외 발생 =>"+e);
			insertOrderNo = -1;
		}
		return insertOrderNo;
	}
	
	@RequestMapping(value="/goOrderCorp.do")
	@ResponseBody
	public int goBookOrderCorp(
			BookOrderInsertDTO boinsertDTO
			) {
		
		int insertOrderCorp = 0;
		
		System.out.println(boinsertDTO.getIsbn13());
		
		try {
			
			int bookCnt = this.orderBookService.getBookCnt(boinsertDTO);
			
			if(bookCnt>boinsertDTO.getBook_qty()) {
				
				insertOrderCorp = this.orderBookService.getInsertOrderCorpCnt(boinsertDTO);
				
			}else {
				
				return -2;
			}
		}catch(Exception e) {
			System.out.println("<사업자 주문 넣기 실패>");
			System.out.println("예외 발생 =>"+e);
			insertOrderCorp = -1;
		}
		return insertOrderCorp;
	}
	
}

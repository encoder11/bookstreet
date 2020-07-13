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
import com.group4.erp.service.LoginService;



@Controller
public class LoginClientController {
	
	@Autowired
	private LoginClientService loginClientService;	
	
	@RequestMapping(value="/goClientLogin.do")
	public ModelAndView goClientMainPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_orderMain.jsp");
		return mav;
	}
	
	@RequestMapping(value="/goCusLogin.do")
	public ModelAndView goClientCusPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_clientCusLogin.jsp");
		return mav;
	}
	
	@RequestMapping(value="/goCorpLogin.do")
	public ModelAndView goClientCorpPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_clientCorpLogin.jsp");
		return mav;
	}
	
	@RequestMapping(value="/cusLoginProc.do")
	@ResponseBody
	public int goCusOrderPage(
			CustomerLoginDTO cusLoginDTO
			) {
		
		int checkCusLogin = 0;
		
		try {
			
			if(cusLoginDTO.getCheckMember().equals("y")) {
				checkCusLogin = this.loginClientService.getcusLoginCnt(cusLoginDTO);
			}else {
				return 1;
			}
		}catch(Exception e) {
			System.out.println("<고객 로그인 실패>");
			System.out.println("예외 발생 =>"+e);
			checkCusLogin = -1;
		}
		
		
		return checkCusLogin;
	}
	
	@RequestMapping(value="/goOrderMain.do")
	public ModelAndView goOrderMainPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_orderMain.jsp");
		return mav;
	}
	
	@RequestMapping(value="/goReturnLogin.do")
	public ModelAndView goReturnOrderMainPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_clientReturnLogin.jsp");
		return mav;
	}
	
	/*
	@RequestMapping(value="/ReturnMainLogin.do")
	@ResponseBody
	public int goReturnMainPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_clientReturnLogin.jsp");
		
		try {
			
			int checkID = this.loginClientService.getCheckIDCnt();
			
			System.out.println("구현중");
			
		}catch(Exception e) {
			System.out.println("<반품하기 로그인 실패>");
			System.out.println("예외 발생 =>"+e);
		}
		
		return 0;
	}*/
}

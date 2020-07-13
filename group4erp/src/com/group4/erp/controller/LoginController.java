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

import com.group4.erp.ChartDTO;
import com.group4.erp.CommonChartDTO;
import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.MainChartsDTO;
import com.group4.erp.dao.MainDAO;
import com.group4.erp.service.AnalysisService;
import com.group4.erp.service.LoginService;
import com.group4.erp.service.MainService;

@Controller
public class LoginController {

   @Autowired
   private LoginService loginService;
   @Autowired
   private MainService mainService;
   @Autowired
   AnalysisService analysisService;
   @Autowired
   MainDAO mainDAO;

   @RequestMapping(value = "/loginForm.do")
   public ModelAndView loginForm() {

      ModelAndView mav = new ModelAndView();
      mav.setViewName("login.jsp");

      return mav;
   }

   @RequestMapping(value = "/loginProc.do" // 접속하는 클의 URL 주소 설정
         , method = RequestMethod.POST // 접속하는 클의 파값 전송 방법
         , produces = "application/json;charset=UTF-8" // 응당할 데이터 종류 json 설정
   )
   @ResponseBody
   public int loginProc(@RequestParam(value = "emp_id") String emp_id, @RequestParam(value = "emp_pwd") String emp_pwd,
         HttpSession session, HttpServletResponse response

   ) {
      System.out.println("로그인 컨트롤러 시작");
      Map<String, String> map = new HashMap<String, String>();
      map.put("emp_id", emp_id);
      map.put("emp_pwd", emp_pwd);
      int emp_idCnt = 0;

      EmployeeDTO empInfo = this.loginService.getLoginEmpInfo(emp_id);

      try {

         emp_idCnt = this.loginService.getEmpIdCnt(map);
         System.out.println("<접속성공> [접속URL]->/loginProc.do [호출메소드]->LoginController.loginProc(~) \n");
         if (emp_idCnt == 1) {

            String dep_no = empInfo.getDep_no() + "";

            session.setAttribute("emp_id", emp_id);
            session.setAttribute("emp_name", empInfo.getEmp_name());
            session.setAttribute("jikup", empInfo.getJikup());
            session.setAttribute("jikup_cd", empInfo.getJikup_cd());
            session.setAttribute("mgr", empInfo.getMgr());
            session.setAttribute("mgr_emp_no", empInfo.getMgr_emp_no());
            session.setAttribute("dep_no", dep_no);
            session.setAttribute("ceo_no", empInfo.getCeo_no());
         }

      } catch (Exception e) {
         System.out.println("예외발생 : " + e);
         System.out.println("<접속실패> [접속URL]->/loginProc.do [호출메소드]->LoginController.loginProc(~) \n");
         emp_idCnt = -1;
      }
      // admin 테이블에 존재하는 로그인 아이디의 존재 개수 리턴하기
      return emp_idCnt;
   }

   /*
    * @RequestMapping(value="/loginProc.do") public ModelAndView
    * loginProc(HttpSession session) {
    * 
    * ModelAndView mav = new ModelAndView(); mav.setViewName("main.jsp");
    * 
    * return mav; } <<<<<<< HEAD
    * 
    * /*@RequestMapping(value="/joininsert.do") public ModelAndView
    * joinMembership() { =======
    */
   @RequestMapping(value = "/goMainPage.do")
   public ModelAndView goMainPage(HttpSession session) {

      ModelAndView mav = new ModelAndView();

      mav.setViewName("main.jsp");
      mav.addObject("subMenu", "mainPage");
      return mav;
   }

   @RequestMapping(value = "/goMainTest.do")
   public ModelAndView goMainTest(HttpSession session, ChartDTO chartDTO) {

      ModelAndView mav = new ModelAndView();
      List<Map<String, String>> monthEvnt = mainService.getMonthEvnt();
      mav.addObject("monthEvnt", monthEvnt);
      
      List<ChartDTO> monthlyBookRegChart = this.analysisService.getMonthlyBookRegChart();
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
      mav.addObject("monthlyBook_reg_chart_data", monthlyBook_reg_chart_data);
      
      CommonChartDTO orderStat = mainService.getOrderStat();
      mav.addObject("orderStat", orderStat);
      System.out.println("orderStat => " + orderStat);
      
      CommonChartDTO returnStat = mainService.getReturnStat();
      mav.addObject("returnStat", returnStat);
      System.out.println("returnStat => " +returnStat);
      
      List<Map<String, String>> bestSellers = this.mainDAO.getBestSellers();
        mav.addObject("bestSellers", bestSellers);
        
        MainChartsDTO mainChartsDTO = null;
      try {
         mainChartsDTO = mainService.getMainCharts();
         for(int i=0; i<mainChartsDTO.getSellingStat().size(); i++) {
            String yearmonth = mainChartsDTO.getSellingStat().get(i).getTitle();
            yearmonth = yearmonth.replace("-", "년 ");
            yearmonth = yearmonth + "월";
            //System.out.println("yearmonth" + yearmonth);
            mainChartsDTO.getSellingStat().get(i).setTitle(yearmonth);
         }
         System.out.println("mainChartsDTO = > " + mainChartsDTO);

      } catch (Exception e) {
         e.printStackTrace();
      }
      mav.addObject("mainChartsDTO" , mainChartsDTO);
      
      
      
      
      
      mav.setViewName("test.jsp");
      return mav;
   }

   @RequestMapping(value = "/checkApprovalProc.do")
   @ResponseBody
   public EmpApprovalCheckDTO joinMembership(EmpApprovalCheckDTO empCheckDTO,
         @RequestParam(value = "jumin_num") String jumin) {
      //System.out.println("승인 여부 확인 시작");

      EmpApprovalCheckDTO loginInfo = null;

      try {

         loginInfo = this.loginService.getApprovalCheck(jumin);

         String checkemp = loginInfo.getEmp_no() + "";
         String checkwork = loginInfo.getWorktime_cd();
         System.out.println("checkwork => " + checkwork);
         if (checkwork.equals("6")) {
            System.out.println("미승인 체크");
            loginInfo.setCheckApproval("미승인");
         } else {
            System.out.println("승인 체크");
            loginInfo.setCheckApproval("승인");
         }

      } catch (Exception e) {
         System.out.println("<승인 여부 확인 실패>");
         System.out.println("예외 발생 =>" + e);
      }

      return loginInfo;
   }

   @RequestMapping(value = "/logout.do")
   public ModelAndView logout(
         // HttpSession 객체의 메모리위치주소값이 저장된 매개변수 선언
         HttpSession session) {

      session.removeAttribute("admin_id");
      session.removeAttribute("uri");
      // session.removeAttribute("boardSearchDTO");

      // session.invalidate(); //<참고> HttpSession 객체에 저장된 데이터를 모두 제거한다.

      ModelAndView mav = new ModelAndView();
      mav.setViewName("logout.jsp");
      System.out.println("<접속성공> [접속 URI]-> /logout.do [호출 메소드]->LoginController.logout() \n");

      return mav;
   }

}
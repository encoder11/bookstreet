package com.group4.erp.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;
import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.OrderDTO;
import com.group4.erp.SalesInfoDTO;
import com.group4.erp.TranSpecDTO;
import com.group4.erp.ApprovalDTO;
import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.service.AccountService;
import com.group4.erp.service.ApprovalService;
import com.group4.erp.service.MarketingService;



@Controller
public class MarketingController {
	
	@Autowired
	//private LoginService loginService;	
	MarketingService marketingService;
	
	@Autowired
	ApprovalService approvalService;
	
	@Autowired
	AccountService accountService;
	
	
	@RequestMapping(value="/viewSalesInfoList.do")
	public ModelAndView viewSalesInfoList(HttpSession session, SalesInfoDTO salesSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewSalesInfoList");
		mav.addObject("navigator", "[마케팅관리] → [판매현황]");
	
		try {
			
			
			int online_order_cnt = this.marketingService.getOnlineOrderCnt(salesSearchDTO);
			int tot_revenue = this.marketingService.getTotRevenue();
			List<OrderDTO> onlineOrderList = this.marketingService.getOnlineOrderList(salesSearchDTO);
			
			int corpOrderCnt = this.marketingService.getCorpOrderTotCnt();
			int corpTotRevenue = this.marketingService.getCorpTotRevenue();
			
			//int corp_order_cnt = this.accountService.getCorpOrderCnt(corpSearchDTO);
			//List<CorpOrderDTO> corp_order_list = this.accountService.getCorpOrderList(corpSearchDTO);
			
			List<CorpOrderDTO> corpOrderCntList = this.marketingService.getCorpOrderCntChart();
			
			String sales_chart_data = "[";
			sales_chart_data += "['분류', '주문수량', '반품수량']";
				
			List<SalesInfoDTO> orderInfo = this.marketingService.getOrderInfoChart();
			
			for(int i=0; i<orderInfo.size(); i++) {
				sales_chart_data += ", ['";
				sales_chart_data += orderInfo.get(i).getCategory();
				sales_chart_data += "', ";
				sales_chart_data += orderInfo.get(i).getBook_qty();
				sales_chart_data += ", ";
				sales_chart_data += orderInfo.get(i).getReturn_qty();
				sales_chart_data += "] ";
			}
			sales_chart_data += "]";
			
			String corpOrder_chart_data = "[";
			corpOrder_chart_data += "['분류', '수량']";
			
			for(int i=0; i<corpOrderCntList.size(); i++) {
				corpOrder_chart_data += ", ['";
				corpOrder_chart_data += corpOrderCntList.get(i).getCategory();
				corpOrder_chart_data += "', ";
				corpOrder_chart_data += corpOrderCntList.get(i).getBooks_qty();
				corpOrder_chart_data += "] ";
			}
			corpOrder_chart_data += "]";
			
			
			List<SalesInfoDTO> dailyOrderCnt = this.marketingService.getDailyOrderCnt();
			
			String dailyOrder_chart_data ="[";
			dailyOrder_chart_data += "['일자', '건수']";
			
			for(int i=0; i<dailyOrderCnt.size(); i++) {
				dailyOrder_chart_data += ", ['";
				dailyOrder_chart_data += dailyOrderCnt.get(i).getOrder_dt();
				dailyOrder_chart_data += "', ";
				dailyOrder_chart_data += dailyOrderCnt.get(i).getBook_qty();
				dailyOrder_chart_data += "] ";
			}
			
			dailyOrder_chart_data += "]";
			
			
			List<SalesInfoDTO> dailyCorpOrderCnt = this.marketingService.getDailyCorpOrderCnt();
			
			String dailyCorpOrder_chart_data = "[";
			dailyCorpOrder_chart_data += "['일자', '건수']";
			
			for(int i=0; i<dailyCorpOrderCnt.size(); i++) {
				dailyCorpOrder_chart_data += ", ['";
				dailyCorpOrder_chart_data += dailyCorpOrderCnt.get(i).getOrder_dt();
				dailyCorpOrder_chart_data += "', ";
				dailyCorpOrder_chart_data += dailyCorpOrderCnt.get(i).getBook_qty();
				dailyCorpOrder_chart_data += "] ";
			}
		
			dailyCorpOrder_chart_data +="]";
			
			
			List<SalesInfoDTO> dailyOfflineSalesChart = this.marketingService.getDailyOfflineSalesChart();
			SalesInfoDTO dailyOfflineSalesTotCnt = this.marketingService.getDailyOfflineSalesTotCnt();
			
			String offline_chart_data = "[";
			offline_chart_data += "['일자', '오프라인 판매량', '온라인 판매량']";
			
			for(int i=0; i<dailyOfflineSalesChart.size(); i++) {
				offline_chart_data += ", ['";
				offline_chart_data += dailyOfflineSalesChart.get(i).getBuy_dt();
				offline_chart_data += "', ";
				offline_chart_data += dailyOfflineSalesChart.get(i).getOffline_cnt();
				offline_chart_data += ", ";
				offline_chart_data += dailyOfflineSalesChart.get(i).getOnline_cnt();
				offline_chart_data += "] ";
			}
		
			offline_chart_data +="]";
			
			mav.addObject("dailyOfflineSalesTotCnt", dailyOfflineSalesTotCnt);		
			mav.addObject("onlineOrderCnt", online_order_cnt);
			mav.addObject("onlineOrderList", onlineOrderList);
			mav.addObject("salesSearchDTO", salesSearchDTO);
			mav.addObject("corpOrderCnt", corpOrderCnt);
			mav.addObject("corpTotRevenue", corpTotRevenue);
			mav.addObject("tot_revenue", tot_revenue);
			mav.addObject("sales_chart_data", sales_chart_data);
			mav.addObject("corpOrder_chart_data", corpOrder_chart_data);
			mav.addObject("dailyOrder_chart_data", dailyOrder_chart_data);
			mav.addObject("dailyCorpOrder_chart_data", dailyCorpOrder_chart_data);
			mav.addObject("offline_chart_data", offline_chart_data);
			
				
		} catch(Exception e) {
			System.out.println("viewSalesInfoList() 메소드에서 예외 발생==="+e);
		}
		
		return mav;
	}
	
	//이벤트 현황 조회
	@RequestMapping(value="/viewEventList.do")
	public ModelAndView viewEventList(HttpSession session, EventSearchDTO eventSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEventList");
		mav.addObject("navigator", "[마케팅관리] → [이벤트행사 현황]");
			
		try {
			
			int updateEvntState = this.marketingService.updateEvntState();	//이벤트 종료 여부를 업데이트함(이벤트 종료날이 지났으면 '종료'로 표시)
			
			System.out.println("(String)session.getAttribute()==="+(String)session.getAttribute("emp_id"));
			
			eventSearchDTO.setEmp_no((String)session.getAttribute("emp_id"));
			
			System.out.println("selectPageNo==="+eventSearchDTO.getSelectPageNo());
			System.out.println("rowCntPerPage==="+eventSearchDTO.getRowCntPerPage());
			
			int eventCnt = this.marketingService.getEventCnt(eventSearchDTO);
			int eventAllCnt = this.marketingService.getEventAllCnt(eventSearchDTO);
			
			if(eventAllCnt >0 ) {
				int selectPageNo = eventSearchDTO.getSelectPageNo();	//선택한 페이지 번호 구하기
				int rowCntPerPage = eventSearchDTO.getRowCntPerPage();	//한 화면에 보여지는 행의 개수 구하기
				int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage +1;	//검색할 시작행 번호 구하기
				if(eventAllCnt < beginRowNo) {		//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한 페이지 번호를 1로 지정
					eventSearchDTO.setSelectPageNo(1);
				}
			}
					
			List<EventDTO> eventList = this.marketingService.getEventList(eventSearchDTO);
			
			mav.addObject("eventCnt", eventCnt);
			mav.addObject("eventAllCnt", eventAllCnt);
			mav.addObject("eventList", eventList);
			//mav.addObject("eventSearchDTO", eventSearchDTO);
			
		} catch(Exception e) {
			System.out.println("viewEventList() 메소드에서 예외발생=="+e);
		}
		
		return mav;
	}
	
	//이벤트 신청 페이지 보기
	@RequestMapping(value="/eventScheduling.do")
	public ModelAndView eventScheduling(HttpSession session, String evnt_no, EventDTO eventDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "eventReserve");
		mav.addObject("navigator", "[마케팅관리] → [이벤트행사 현황] → [이벤트신청]");
		
		System.out.println("eventScheduling() 메소드 실행");
		
		try {
		
			if(evnt_no != null) {
			
				System.out.println("재결재합니다. document_no==="+evnt_no);
				EventDTO myEventInfo = this.marketingService.getMyEventInfoApproval(evnt_no);
			
				System.out.println("myEventInfo.getEvent_start_dt==="+myEventInfo.getEvnt_start_dt());
				System.out.println("myEventInfo.getEvent_end_dt==="+myEventInfo.getEvnt_end_dt());
			
				mav.addObject("myEventReApproval", myEventInfo);
			
			} else {
				
				int eventAllCnt = this.marketingService.getEventNumForApproval();
				int eventNo = eventAllCnt+1;
				
				mav.addObject("eventNo", eventNo);
			}

		
		} catch(Exception e) {
			System.out.println("eventScheduling() 메소드에서 예외 발생");
		} 
		
		return mav;
	}
	
	
	//이벤트 신청하기
	@RequestMapping( 
			value="/insertEventProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int insertEvent(HttpSession session, EventDTO eventDTO, String evnt_no) {
		
		int insertEventCnt = 0;
		int insertApprovalCnt = 0;
		
		String emp_no = (String)session.getAttribute("emp_id");
		
		try {

			//System.out.println("EventDTO.getAtchd_data==="+eventDTO.getAtchd_data());
			
			//System.out.println("emp_no==="+emp_no);
			//System.out.println("evnt_no==="+evnt_no);
			System.out.println("event_no of DTO ==="+eventDTO.getEvnt_no());
			eventDTO.setEmp_no(Integer.parseInt(emp_no));
			eventDTO.setAtchd_data(null);
			
			insertEventCnt = this.marketingService.insertEvent(eventDTO);
			System.out.println("insertEventCnt==="+insertEventCnt);
			
			if(insertEventCnt > 0) {
				
				ApprovalDTO approvalDTO = new ApprovalDTO();
				
				approvalDTO.setDocument_no(eventDTO.getEvnt_no());
				System.out.println("approvalDTO.getDocument_no=="+approvalDTO.getDocument_no());
				approvalDTO.setEmp_no(Integer.parseInt(emp_no));
				System.out.println("approvalDTO.getEmp_no==="+approvalDTO.getEmp_no());
				approvalDTO.setE_work_comment(eventDTO.getEvnt_comment());
				
				insertApprovalCnt = this.approvalService.insertApproval(approvalDTO); 
			}
			
				
		} catch(Exception e) {
			System.out.println("insertEvent() 메소드에서 예외 발생>>> "+e);
			insertEventCnt = -1;
		} 
				
		return insertEventCnt;	
	}
	
	
	@RequestMapping(value="/deleteEvntProc.do", 
			method=RequestMethod.POST, 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int deleteEvntProc(@RequestParam(value="evnt_no") String[] evnt_no) {
		int delCnt = 0;
		
		try {
			
			delCnt = this.marketingService.deleteEvnt(evnt_no);
			
			/*if(upDel.equals("up")) {
				upDelCnt = this.boardService.updateBoard(boardDTO);
			}
			
			//만약 삭제 모드이면 삭제 실행하고 삭제 적용행의 개수를 저장
			else {
				upDelCnt = this.boardService.deleteBoard(boardDTO);
			} */
			
		} catch(Exception e) {
			System.out.println("deleteEvntProc() 메소드에서 예외 발생 >>> "+e);
		}
				
		return delCnt;
	}
	
	
	@RequestMapping(value="/updateEventProc.do", 
			method=RequestMethod.POST, 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int updateEventProc(EventDTO eventDTO, ApprovalDTO approvalDTO, String evnt_no) {
		int upCnt = 0;
		int upApprovalCnt = 0;
		int myReApprovalCnt =0;
			
		try {
			
			String document_no = eventDTO.getEvnt_no();
			
			if(document_no != null) {
				System.out.println("재결재 이벤트 번호==="+document_no);
			}
			
			System.out.println("event_title==="+eventDTO.getEvnt_title());
			
			System.out.println("컨트롤러 updateEventProc() 메소드 실행");
					
			//이벤트 재결재시 결재 테이블에도 반영(대기중)
			myReApprovalCnt = this.approvalService.getMyReApprovalCnt(document_no);
			
			System.out.println("evnt_comment==="+eventDTO.getEvnt_comment());
			
			if(myReApprovalCnt > 0) {
				
				approvalDTO.setE_works_state_cd("1");
				approvalDTO.setDocument_no(document_no);
				
				eventDTO.setEvnt_state_cd("1");
				eventDTO.setEvnt_no(document_no);
				
				upCnt = this.marketingService.updateEventInfo(eventDTO);
				upApprovalCnt = this.approvalService.updateApprovalProc(approvalDTO);
			} else {
				
				upCnt = this.marketingService.updateEventInfo(eventDTO);
				System.out.println("upCnt==="+upCnt);
				
			}
			
		} catch(Exception e) {
			System.out.println("updateEventProc() 메소드에서 예외 발생 >>> "+e);
		}
				
		return upCnt;
	}
	
	
	//광고 현황 조회
	/*@RequestMapping(value="/viewAdApplyList.do")
	public ModelAndView viewAdApplyList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewAdApplyList");
		mav.addObject("navigator", "[마케팅관리] → [광고신청현황]");
		
		int ad_apply_cnt = this.marketingService.getAdApplyCnt();
		List<AdApplyDTO> ad_apply_list = this.marketingService.getAdApplyList();
		
		mav.addObject("adApplyCnt", ad_apply_cnt);
		mav.addObject("adApplyList", ad_apply_list);
		
		return mav;
	}
	
	//광고 신청 페이지
	@RequestMapping(value="/insertAdApply.do")
	public ModelAndView viewInsertAdApply(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewInsertAdApply");
		mav.addObject("navigator", "[마케팅관리] → [광고신청현황] → [광고신청]");
		
		try {
			
			int ad_apply_cnt = this.marketingService.getAdApplyCnt();
			List<CorporationDTO> corpList = this.marketingService.getCorpList();
			
			int adNum = ad_apply_cnt+1;
			mav.addObject("adNum", adNum);
			mav.addObject("corpList", corpList);
			
		} catch(Exception e) {
			System.out.println("viewInsertAdApply() 메소드에서 예외 발생==="+e);
		}
		
		
		//int ad_apply_cnt = this.marketingService.getAdApplyCnt();
		//List<AdApplyDTO> ad_apply_list = this.marketingService.getAdApplyList();
		
		
		return mav;
	}
	
	
	@RequestMapping( 
			value="/insertAdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int insertAdProc(AdApplyDTO adApplyDTO, ApprovalDTO approvalDTO) {
		
		int insertAdCnt = 0;
		int insertApprovalCnt = 0;
		
		try {
					
			System.out.println("adApplyDTO.getEmp_no()==="+adApplyDTO.getEmp_no());
			System.out.println("adApplyDTO.getImgDoc()==="+adApplyDTO.getImg_doc());
			if(adApplyDTO.getImg_doc()==null) {
				adApplyDTO.setImg_doc("temporary");
			}
			
			insertAdCnt = this.marketingService.insertAd(adApplyDTO);
			
			insertApprovalCnt = this.approvalService.insertApproval(approvalDTO); 
				
		} catch(Exception e) {
			System.out.println("insertAd() 메소드에서 예외 발생>>> "+e);
			insertAdCnt = -1;
		} 
				
		return insertAdCnt;		
	}
	
	
	@RequestMapping( 
			value="/updateAdInfoProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int updateAdInfoProc(AdApplyDTO adApplyDTO) {
		
		int updateCnt = 0;
		
		try {
					
			System.out.println("adApplyDTO.getEmp_no()==="+adApplyDTO.getEmp_no());
			System.out.println("adApplyDTO.getImgDoc()==="+adApplyDTO.getImg_doc());
			
			if(adApplyDTO.getImg_doc()==null) {
				adApplyDTO.setImg_doc("temporary");
			}
			
			updateCnt = this.marketingService.updateAdInfoProc(adApplyDTO);
				
		} catch(Exception e) {
			System.out.println("insertAd() 메소드에서 예외 발생>>> "+e);
			updateCnt = -1;
		} 
				
		return updateCnt;		
	} */
	
	
}

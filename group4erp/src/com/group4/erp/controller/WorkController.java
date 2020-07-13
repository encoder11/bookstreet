package com.group4.erp.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;
import com.group4.erp.service.ApprovalService;
import com.group4.erp.service.WorkService;


@Controller
public class WorkController {
	

	@Autowired
	private WorkService workService;	
	
	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping(value="/businessTripList.do")
	public ModelAndView goBusinessTripList(HttpSession session
				,BusinessTripSearchDTO businessTripSearchDTO
				,BusinessTripDTO businessTripDTO
				) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "businessTripList");
		mav.addObject("navigator", "[업무관리] → [출장신청&보고]");
		
		try {
			
			//리스트 종개수 구하기
			int getbusinessTripListAllCnt = this.workService.getbusinessTripListAllCnt(businessTripSearchDTO);
			
			
			if(getbusinessTripListAllCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = businessTripSearchDTO.getSelectPageNo();
				//한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = businessTripSearchDTO.getRowCntPerPage();
				//검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if(getbusinessTripListAllCnt<beginRowNo){
					businessTripSearchDTO.setSelectPageNo(1);
					}
				
				

				if(businessTripDTO.getLogin_emp_id()== null){
					businessTripDTO.setLogin_emp_id((String)session.getAttribute("emp_id"));
				}
				if(businessTripDTO.getLogin_jikup()== null){
					businessTripDTO.setLogin_jikup((String)session.getAttribute("jikup"));
				}
				if(businessTripDTO.getLogin_mgr()== null){
					businessTripDTO.setLogin_mgr((String)session.getAttribute("mgr"));
				}
				if(businessTripDTO.getLogin_mgr_no()== null){
					businessTripDTO.setLogin_mgr_no((String)session.getAttribute("mgr_emp_no"));
				}
				if(businessTripDTO.getLogin_dep_no()==null){
					businessTripDTO.setLogin_dep_no((String)session.getAttribute("dep_no"));
				}
				
			}
			
		List<Map<String, String>> getbusinessTripList = this.workService.getbusinessTripList(businessTripSearchDTO);
		
		System.out.println("insertBusinessTrip 컨트롤러");
		System.out.println(businessTripDTO.getLogin_emp_id()+"=로그인한 아이디");
		System.out.println(businessTripDTO.getLogin_jikup()+"=직급");
		System.out.println(businessTripDTO.getLogin_mgr()+"=상관명");
		System.out.println(businessTripDTO.getLogin_mgr_no()+"=상관번호");
		System.out.println(businessTripDTO.getLogin_dep_no()+"=부서번호");

		mav.addObject("businessTripList", getbusinessTripList);
		mav.addObject("businessTripListAllCnt", getbusinessTripListAllCnt);
		}catch(Exception e) {
			System.out.println("<출장리스트 불러오기 실패>");
			System.out.println("예외발생"+'='+e);

		}
		return mav;
		
	}
	
	@RequestMapping(value="/businessTripForm.do")
	public ModelAndView goBusinessTripForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "businessTripForm");
		mav.addObject("navigator", "[업무관리]-[출장신청]");

		return mav;
		
	}
	
	
	//출장 상세 보기
	@RequestMapping(value="/businessTripContentsForm.do")
	public ModelAndView goBusinessTripContentsForm(
			@RequestParam(value="work_outside_seq") int work_outside_seq
			,HttpSession session
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "businessTripContentsForm"); 
		mav.addObject("navigator", "[업무관리] → [출장신청&보고] → [상세보기]");
		
		try {
			
			BusinessTripDTO businessTripDTO = this.workService.getBusinessTripDTO(work_outside_seq);
			mav.addObject("businessTripDTO", businessTripDTO);
			
		}catch(Exception e) {
			System.out.println("goBusinessTripContentsForm <에러발생>"+"="+e); 
		}

		return mav;
		
	}
	
	
		@RequestMapping(
				value="/businessTripRegProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
			)
		@ResponseBody
		public int insertBusinessTrip(
				BusinessTripDTO businessTripDTO, ApprovalDTO approvalDTO
		){
			System.out.println("insertBusinessTrip 컨트롤러");
			System.out.println(businessTripDTO.getDestination());
			System.out.println(businessTripDTO.getEmp_no());
			System.out.println(businessTripDTO.getOutside_start_time().replace(",", ""));
			System.out.println(businessTripDTO.getOutside_end_time().replace(",", ""));
			System.out.println(businessTripDTO.getWork_outside_reason().replace(",", ""));
			
			int businessTripRegCnt = 0;
			int bTripApprovalCnt = 0;
			
			try {
				//[BoardServiceImpl 객체]의 insertBoard 메소드 호출로 게시판 입력하고 [게시판 입력 적용행의 개수] 얻기
				businessTripRegCnt = this.workService.insertBusinessTrip(businessTripDTO);
				
				//결재 테이블에도 출장 신청 정보를 넣는다(조충래 추가)
				String bTrip_no = this.workService.searchMyBTripApplyNo(businessTripDTO);
				
				String approval_bTrip_no = "BT-"+bTrip_no;
				
				//approvalDTO.setApproval_num(approval_bTrip_no);
				approvalDTO.setDocument_no(approval_bTrip_no);
				approvalDTO.setEmp_no(businessTripDTO.getEmp_no());
				approvalDTO.setE_work_comment("");
				
				bTripApprovalCnt = this.approvalService.insertBTripApproval(approvalDTO);
				
				
			}catch(Exception e) {
				System.out.println("<에러발생>="+e);
				businessTripRegCnt= -1;
			}
			return businessTripRegCnt;
			
		}
	
		//businessTripUpDelForm.do 접속시 호출되는 메소드 선언
		@RequestMapping( value="/businessTripUpDelForm.do" )
		public ModelAndView goBusinessTripUpDelForm(
				@RequestParam(value="work_outside_seq") int work_outside_seq
				,HttpSession session
			) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("main.jsp");
			mav.addObject("subMenu", "businessTripUpDelForm"); 
			mav.addObject("navigator", "[업무관리] → [출장신청&보고] → [수정/삭제/승인]");

			
			
			BusinessTripDTO businessTripDTO = this.workService.getBusinessTripDTO(work_outside_seq);
			mav.addObject("businessTripDTO", businessTripDTO);
			
			if(businessTripDTO.getLogin_emp_id()== null){
				businessTripDTO.setLogin_emp_id((String)session.getAttribute("emp_id"));
			}
			if(businessTripDTO.getLogin_jikup()== null){
				businessTripDTO.setLogin_jikup((String)session.getAttribute("jikup"));
			}
			if(businessTripDTO.getLogin_mgr()== null){
				businessTripDTO.setLogin_mgr((String)session.getAttribute("mgr"));
			}
			if(businessTripDTO.getLogin_mgr_no()== null){
				businessTripDTO.setLogin_mgr_no((String)session.getAttribute("mgr_emp_no"));
			}
			if(businessTripDTO.getLogin_dep_no()==null){
				businessTripDTO.setLogin_dep_no((String)session.getAttribute("dep_no"));
			}
			
			
			System.out.println("businessTripDTO");
			try {
				System.out.println("<접속성공> [접속URL]->/businessTripUpDelForm.do UpDelForm(~) \n\n\n");
			}catch(Exception e) {
				System.out.println("<접속실패> [접속URL]->/businessTripUpDelForm.do UpDelForm(~) \n\n\n");
			}
			return mav;
		}
		@RequestMapping(
				value="/businessTripUpDelAppProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int goBusinessTripUpDelProc(
					@RequestParam(value="upDelApp") String upDelApp
					,BusinessTripDTO businessTripDTO
				) {
			//수정 or 삭제 적용행의 개수가 저장되는 변수선언.
			int businessTripUpDelAppCnt = 0;
			try {
			  //만약 수정 모드이면 수정 실행하고 수정 적용행의 개수를 저장 
			if(upDelApp.equals("up")){ businessTripUpDelAppCnt = this.workService.updateBusinessTrip(businessTripDTO); }
			//만약 삭제 모드이면 수정 실행하고 삭제 적용행의 개수를 저장 
			else if(upDelApp.equals("del")){ businessTripUpDelAppCnt = this.workService.deleteBusinessTrip(businessTripDTO); }
			//만약 승인 이면 수정 실행하고 승인 적용행의 개수를 저장 
			else if(upDelApp.equals("app")){ businessTripUpDelAppCnt = this.workService.approvedBusinessTrip(businessTripDTO); }
					
			}catch(Exception e) {
				System.out.println("오류 발생");
			}
			return businessTripUpDelAppCnt;
		}
		
		
}

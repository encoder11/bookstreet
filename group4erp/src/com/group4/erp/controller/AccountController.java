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

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TranSpecDTO;
import com.group4.erp.TranSpecSearchDTO;
import com.group4.erp.service.AccountService;


@Controller
public class AccountController {
	
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value="/viewCorpList.do")
	public ModelAndView viewCorpList(HttpSession session, CorpSearchDTO corpSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");

		mav.addObject("subMenu", "viewCorpList");
		mav.addObject("navigator", "[회계관리] → [거래처 현황]");
		
		String corpBusiness = "";
		
		try {
			
			int corpListCnt = this.accountService.getCorpListCnt(corpSearchDTO);
						
			if(corpListCnt >0 ) {
				int selectPageNo = corpSearchDTO.getSelectPageNo();	//선택한 페이지 번호 구하기
				int rowCntPerPage = corpSearchDTO.getRowCntPerPage();	//한 화면에 보여지는 행의 개수 구하기
				int beginRowNo = (selectPageNo * rowCntPerPage - rowCntPerPage +1);	//검색할 시작행 번호 구하기
				if(corpListCnt < beginRowNo) corpSearchDTO.setSelectPageNo(1);
			}
			
			List<CorporationDTO> corpList = this.accountService.getCorpList(corpSearchDTO);
			List<CorporationDTO> business_area = this.accountService.getBusiness_area();

			System.out.println(corpSearchDTO.getSelectPageNo());
			System.out.println(corpSearchDTO.getRowCntPerPage());
			System.out.println(corpSearchDTO.getSearchKeyword());
			System.out.println(corpSearchDTO.getKeyword());
			
			mav.addObject("corpListCnt", corpListCnt);
			mav.addObject("corpList", corpList);
			mav.addObject("corp_business_area", business_area);
			mav.addObject("corpSearchDTO", corpSearchDTO);
			
						
		} catch(Exception e) {
			System.out.println("예외발생=="+e);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/goInsertCorpPage.do")
	public ModelAndView goInsertCorpPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "goInsertCorpPage");
		mav.addObject("navigator", "[회계관리] → [거래처등록/삭제]");
		
		List<CorporationDTO> business_area = this.accountService.getBusiness_area();
		
		mav.addObject("business_area", business_area);
		
		return mav;
	}
	
	
	@RequestMapping( 
			value="/insertCorpProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int insertCorp(CorporationDTO corporationDTO) {
		
		int insertCorpCnt = 0;
		try {
			//BoardServiceImpl 객체의 insertBoard 메소드 호출로 게시판 입력하고 게시판 입력 적용 행의 개수를 얻는다.
			
			String corp_no = corporationDTO.getCorp_no();
			
			int corpSearchCnt = this.accountService.searchCorpCnt(corp_no);
			
			if(corpSearchCnt==0) {
				insertCorpCnt = this.accountService.insertCorp(corporationDTO);
			} else if(corpSearchCnt >=1) {
				insertCorpCnt = -2;
			}			
				
		} catch(Exception e) {
			System.out.println("insertCorp() 메소드에서 예외 발생>>> "+e);
			insertCorpCnt = -1;
		} 
				
		return insertCorpCnt;		
	}
	
	
	@RequestMapping(value="/deleteCorpProc.do", 
			method=RequestMethod.POST, 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int deleteCorpProc(@RequestParam(value="corp_no") String[] corp_no) {
		int delCnt = 0;
		
		try {
			
			for(int i=0; i<corp_no.length; i++) {
				System.out.println("corp_no==="+corp_no[i]);
			}
			
			delCnt = this.accountService.deleteCorp(corp_no);
			
			/*if(upDel.equals("up")) {
				upDelCnt = this.boardService.updateBoard(boardDTO);
			}
			
			//만약 삭제 모드이면 삭제 실행하고 삭제 적용행의 개수를 저장
			else {
				upDelCnt = this.boardService.deleteBoard(boardDTO);
			} */
			
		} catch(Exception e) {
			System.out.println("deleteCorpProc() 메소드에서 예외 발생 >>> "+e);
		}
				
		return delCnt;
	}
	
	@RequestMapping(value="/updateCorpInfoProc.do", 
			method=RequestMethod.POST, 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public int updateCorpProc(CorporationDTO corpDTO) {
	
		int upCnt = 0;
		
		try {

			upCnt = this.accountService.updateCorpInfo(corpDTO);
			System.out.println("updateCorpProc() 메소드 실행 & upCnt=="+upCnt);
			
		} catch(Exception e) {
			System.out.println("updateCorpProc() 메소드에서 예외 발생 >>> "+e);
		}
				
		return upCnt;
	}
	
	@RequestMapping(value="/viewTranSpecList.do")
	public ModelAndView viewTranSpec(HttpSession session, CorpSearchDTO corpSearchDTO, TranSpecSearchDTO tranSpecSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTranSpecList");
		mav.addObject("navigator", "[회계관리] → [거래 내역]");
		
		try {
			int corp_tran_cnt = this.accountService.getCorpOrderCnt(corpSearchDTO);
			
			List<CorpOrderDTO> corp_tran_list = this.accountService.getCorpOrderList(corpSearchDTO);
			//List<TranSpecDTO> tranSpecIssueList = this.accountService.getTranSpecIssueList(tranSpecSearchDTO);
	
			//mav.addObject("tranSpecIssueList", tranSpecIssueList);		
			mav.addObject("corp_tran_cnt", corp_tran_cnt);
			mav.addObject("corp_tran_list", corp_tran_list);
			mav.addObject("corpSearchDTO", corpSearchDTO);
			mav.addObject("tranSpecSearchDTO", tranSpecSearchDTO);
			//mav.addObject("tranSpecIssueList", tranSpecIssueList);
			
		} catch(Exception e) {
			System.out.println("예외 발생=="+e);
		}
		
		return mav;		
	}
	
	@RequestMapping(value="/viewTranSpecInfo.do")
	public ModelAndView viewTranSpecInfo(HttpSession session, int order_no) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTranSpecInfo");
		mav.addObject("navigator", "[회계관리] → [거래내역 조회] → [거래명세서 발급]");
		
		try {
			
			int tranSpec_cnt = this.accountService.getTranSpecCnt(order_no);
			TranSpecDTO tranSpecList = this.accountService.getTranSpecList(order_no);

			/*
			int bookPrice = Integer.parseInt(tranSpecList.getBook_price());
			int taxCost = Integer.parseInt(tranSpecList.getTax());
			*/

			
			mav.addObject("tranSpec_cnt", tranSpec_cnt);
			mav.addObject("tranSpecList", tranSpecList);
			mav.addObject("order_no", order_no);
			
		} catch(Exception e) {
			System.out.println("예외 발생=="+e);
		} 
		
		return mav;		
	}
	
	@RequestMapping(value="/viewTranSpecIssueList.do")
	public ModelAndView viewTranSpecIssueList(HttpSession session, TranSpecSearchDTO tranSpecSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewTranSpecIssueList");
		mav.addObject("navigator", "[회계관리] → [거래내역 조회] → [거래명세서 발급 내역]");
		
		try {
			
			int tranSpecIssueCnt = this.accountService.getTranSpecIssueCnt(tranSpecSearchDTO);
			
			List<TranSpecDTO> tranSpecIssueList = this.accountService.getTranSpecIssueList(tranSpecSearchDTO);
			mav.addObject("tranSpecIssueList", tranSpecIssueList);
			mav.addObject("tranSpecIssueCnt", tranSpecIssueCnt);
			mav.addObject("tranSpecSearchDTO", tranSpecSearchDTO);
			
		} catch(Exception e) {
			System.out.println("예외 발생=="+e);
		} 
		
		return mav;		
	}
	
	
	@RequestMapping( 
			value="/issueTranSpec.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int issueTranSpec(TranSpecDTO tranSpecDTO) {
		
		int issueCnt = 0;

		System.out.println("order_no=="+tranSpecDTO.getOrder_no());
		//System.out.println("order_dt=="+tranSpecDTO.getOrder_dt());
		//System.out.println("corp_no=="+tranSpecDTO.getCorp_no());
		System.out.println("issue_no =>"+tranSpecDTO.getIssue_no());
		try {
					
			issueCnt = this.accountService.saveTempTranSpec(tranSpecDTO);
				
		} catch(Exception e) {
			System.out.println("issueTranSpec() 메소드에서 예외 발생>>> "+e);
			issueCnt = -1;
		} 
				
		return issueCnt;		
	}
	
	
	@RequestMapping( 
			value="/goPayCheckProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int payCheckProc() {
		
		int payCheckCnt = 0;
		System.out.println("payCheckProc() 메소드 시작");
		
		try {
			//BoardServiceImpl 객체의 insertBoard 메소드 호출로 게시판 입력하고 게시판 입력 적용 행의 개수를 얻는다.
							
			payCheckCnt = this.accountService.payCheckProc();
				
		} catch(Exception e) {
			System.out.println("payCheckProc() 메소드에서 예외 발생>>> "+e);
			payCheckCnt = -1;
		} 
				
		return payCheckCnt;		
	}
	

}

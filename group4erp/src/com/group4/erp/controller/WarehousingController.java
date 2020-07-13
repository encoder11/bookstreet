/*
 * 회계업무 관련 기능들을 처리
 * 
 */

package com.group4.erp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.group4.erp.WarehousingSearchDTO;
import com.group4.erp.service.WarehousingService;

@Controller
public class WarehousingController {

	@Autowired
	private WarehousingService warehousingService;

	@RequestMapping(value = "/goWarehousingList.do")
	public ModelAndView goBookWarehousing(HttpSession session, WarehousingSearchDTO warehousingSearchDTO) {

		ModelAndView mav = new ModelAndView();
		// mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewWarehousingList"); // viewInventoryList 아무 이름이나 설정 가능. 메인 페이지에서 해당 메뉴 뜰 때 해당 페이지를
		mav.addObject("navigator", "[재고현황] → [입고현황]");													// 임포트하기 위해서 붙이는 플래그명
		try {
			System.out.println(warehousingSearchDTO.getSearchToday());
			List<Map<String, String>> branch = this.warehousingService.getBranch(warehousingSearchDTO);
			mav.addObject("branch", branch);

			List<Map<String, String>> publisher = this.warehousingService.getPublisher(warehousingSearchDTO);
			mav.addObject("publisher", publisher);

			int warehousingListCnt = this.warehousingService.getWarehousingListCnt(warehousingSearchDTO);
			
			if(warehousingListCnt > 0) {
				int beginRowNo = warehousingSearchDTO.getSelectPageNo() * warehousingSearchDTO.getRowCntPerPage() - warehousingSearchDTO.getRowCntPerPage() + 1; 
				if( warehousingListCnt < beginRowNo ){
					warehousingSearchDTO.setSelectPageNo(1);
				}
			}
					
			mav.addObject("warehousingListCnt", warehousingListCnt);

			List<Map<String, String>> warehousingList = this.warehousingService.getWarehousingList(warehousingSearchDTO);
				
			mav.addObject("warehousingList", warehousingList);
			
			String setToday = warehousingSearchDTO.getSearchToday();
			if (setToday != null && setToday.length()>0) {
				 Date d = new Date();
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				 String s = sdf.format(d).toString();
				 warehousingSearchDTO.setDateFrom(s);
				 warehousingSearchDTO.setDateTill(s);
			}

		} catch (Exception e) {
			System.out.println("<입고목록 불러오기 실패>");
			System.out.println("예외발생" + e.getMessage());
		}
		return mav;
	}

	@RequestMapping(value = "/warehousingContentProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public WarehousingSearchDTO warehousingProc(@RequestParam(value = "order_inven_no") String order_inven_no, HttpSession session) {

		// --------------------------------------------------
		// 수정 또는 삭제 적용행의 개수가 저장되는 변수 선언
		// --------------------------------------------------
		System.out.println("컨트롤러 시작"+order_inven_no);
		WarehousingSearchDTO warehContent = null;
		try {
			warehContent = this.warehousingService.warehousingProc(order_inven_no);
			
		} catch (Exception e) {
			System.out.println("<입고 상세 페이지 불러오기 실패>");
			System.out.println("예외발생" + e.getMessage());
		}
		
		//System.out.println( warehContent.getBook_name() );
		return warehContent;
	}
	
	@RequestMapping(value = "/whConfirmProc.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public int warehousingConfirm(@RequestParam (value="wh_no") int wh_no) {
		System.out.println("입고 확인 버튼 컨트롤러 =>" + wh_no);
		int whConfirmCnt = 0;
		try {
			whConfirmCnt = this.warehousingService.warehousingConfirm(wh_no);
			
		} catch (Exception e) {
			System.out.println("<입고 완료 버튼 실행 실패>");
			System.out.println("예외발생" + e.getMessage());
			e.printStackTrace();
		}
		return whConfirmCnt;
	}
}

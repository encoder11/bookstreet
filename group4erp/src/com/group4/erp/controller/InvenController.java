package com.group4.erp.controller;

import com.group4.common.CommonMethod;
import com.group4.erp.service.*;
import com.group4.erp.*;
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

/*

--Inven을 기준으로 리펙토링 시작 / 범용적으로 쓸만한 메소드들은 테스트 후 시간이 남을때 전체 다 바꾸도록한다.


//각 리스트 호출을 한 메소드로 처리 할 수 있을까?
	//위 방법이 좋을까 select하는 메소드들은 DAO를 바로 불러 접속하는게 더 좋을까

//JSP파일 분할하여 subMenu삭제하기

--생각만 해둔 것--
Controller에서 JSP파일로 넘어 갈떄 JSP파일에서 inputData함수를 쓰려면 HTML태그의 name값과 DTO이름.속성변수명 이 필요함
그러므로 모든 Controller에서 필요한 이름의 값을 String으로 넘겨 준다면 편하지 않을까?

DTO통합이 가능할까

ModelAndView에 main.jsp를 넣는것을 객체화 할수 있을까?

commit testing
*/

@Controller
public class InvenController extends CommonMethod {

	@Autowired
	InvenService invenService;
	
	//페이지 선택 번호를 리셋하는 메소드는 전 컨트롤러에서 폭넓게 사용중이기 때문에 Java파일을 따로 생성하도록 한다.
	/* CommonMethod로 이동함
	public int resetPage(int selectPage, int rowPage, int listCnt) {
		if(listCnt>0) {
			//검색할 시작행 번호 구하기
			int beginRowNo = (selectPage*rowPage-rowPage+1);
			//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
			if(listCnt<beginRowNo) return 1;
		}
		//조건문에 걸리지 않는다면 선택한 페이지 번호를 리턴
		return selectPage;
	}
	*/
	/* 좀더 다듬어야함
	//생성자를 사용하여 해당 컨트롤러에 ModelAndView를 한번만 생성하여 페이지 이동시 삭제->필요한 jsp를 넣는 방식을 구현해본다.
	public InvenController() {
	      ModelAndView mavCons = modelFalseOOP();
	   }
	public ModelAndView modelFalseOOP() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		return mav;
	}
	public ModelAndView modelIf(ModelAndView mav) {
		if(mav.isEmpty()==true) {
			mav.clear();
			return mav;
		}else {
			mav = modelFalseOOP();
			return mav;
		}
	}
	*/
	@RequestMapping(value="/goBookList.do")
	public ModelAndView goBookInvenList(
			HttpSession session
			,InvenSearchDTO invenSearchDTO
		) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewInventoryList");
		mav.addObject("navigator", "[재고현황] → [도서정보조회]");
		try {
			
			InvenService AutoInvenS = this.invenService;
			
			//branch나 publisher 같은 코드식으로 불러오는 데이터들은 패키지화 하여 필요시에 객체화 후 메소드로 호출할 수 있도록 수정
				//-> 모든 코드데이터는 기본적인 select이기 때문에 DTO를 가져갈 필요가 없다.
			//-----------------------------------------------------------------------------
			//CommonMethod.java를 상속시켜 super.메소드 로 호출하여 쓸수 있도록 중복되는 코드 select들을 통합한다
			//		-> 추후 CommonMethod.xml을 만들어 공용 메소드를 만들것.(DB연동이 필요한것들만)
			List<Map<String, String>> branch = super.getBrchList();
			mav.addObject("branch",branch);
			
			List<Map<String, String>> publisher = super.getPublcList();
			mav.addObject("publisher",publisher);
			
			List<Map<String, String>> size = super.getSizeList();
			mav.addObject("size", size);
			
			List<Map<String, String>> category = super.getCatList();
			mav.addObject("category", category);
			
			List<Map<String, String>> inventory_loc = super.getLocList();
			mav.addObject("inventory_loc", inventory_loc);
			//-----------------------------------------------------------------------------
			
			int bookListCnt = AutoInvenS.getBookListCnt(invenSearchDTO);
			mav.addObject("bookListCnt", bookListCnt);
			
			//해당 메소드는 추후 수정을 더 해야함.
			int selectPageNo = invenSearchDTO.getSelectPageNo();
			int rowCntPerPage = invenSearchDTO.getRowCntPerPage();
			invenSearchDTO.setSelectPageNo(resetPage(selectPageNo,rowCntPerPage,bookListCnt));
			 
			
			List<Map<String, String>> BookList = AutoInvenS.getBookList(invenSearchDTO);
			mav.addObject("BookList", BookList);
			
			
		}catch(Exception e) {
			System.out.println("<게시글 불러오기 실패>");
			System.out.println("예외발생 =>"+e);
		}
		return mav; 
	}
	

	@RequestMapping(value="/goReleaseList.do")
	public ModelAndView goBookReleaseInfo(
			HttpSession session
			,InvenSearchDTO invenSearchDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewReleaseList");
		mav.addObject("navigator", "[재고현황] → [출고현황조회]");
		
		try {
			
			List<Map<String, String>> publisher = getPublcList();
			mav.addObject("publisher",publisher);
			
			List<Map<String, String>> inventory_loc = getLocList();
			mav.addObject("inventory_loc", inventory_loc);
			
			int releaseListCnt = this.invenService.getReleaseListCnt(invenSearchDTO);
			mav.addObject("releaseListCnt", releaseListCnt);
			
			if(releaseListCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = invenSearchDTO.getSelectPageNo();
				//한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = invenSearchDTO.getRowCntPerPage();
				//검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if(releaseListCnt<beginRowNo) invenSearchDTO.setSelectPageNo(1);
			}
			
			List<Map<String, String>> releaseList = this.invenService.getReleaseList(invenSearchDTO);
			mav.addObject("releaseList", releaseList);
		}catch(Exception e) {
			System.out.println("<출고형황 불러오기 실패>");
			System.out.println("예외발생 =>"+e);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/goReleaseContentForm.do")
	@ResponseBody
	public Cus_releaseInfoDTO goReleaseContentForm(
			@RequestParam(value="all_order_no") int all_order_no
			,Cus_releaseInfoDTO cus_releaseInfoDTO
			) {
		
		//ModelAndView mav = new ModelAndView();
		//mav.setViewName("main.jsp");
		//mav.addObject("subMenu", "viewReleaseContent");
		//mav.addObject("navigator", "[재고현황]-[출고현황조회]-[상세보기]");
		
		String orderSize = all_order_no+"";
		Cus_releaseInfoDTO all_order = null;
		String cus = "cus";
		String corp = "corp";
		try {
			
			if(orderSize.length()==10) {
				Cus_releaseInfoDTO cus_order = this.invenService.getReleaseCusInfo(all_order_no);
				cus_order.setCheck_order_num(cus);
				all_order = cus_order;
				//mav.addObject("cus_order", cus_order);
			}else {
				Cus_releaseInfoDTO corp_order = this.invenService.getReleaseCorpInfo(all_order_no);
				corp_order.setCheck_order_num(corp);
				
				all_order = corp_order;
				//mav.addObject("corp_order", corp_order);
			}
			
			//mav.addObject("orderSize", orderSize);
		}catch(Exception e) {
			System.out.println("<출고 상세 정보 불러오기 실패>");
			System.out.println("예외발생 =>"+e);
		}
		
		
		return all_order;
	}
		

	@RequestMapping(value="/goReturnOrderList.do")
	public ModelAndView goReturnOrderList(HttpSession session, ReturnSearchDTO returnSearchDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewReturnOrderList");
		mav.addObject("navigator", "[재고현황] → [반품현황조회]");
		
		try {
			int returnOrderCnt = this.invenService.getReturnOrderCnt(returnSearchDTO);
			List<ReturnOrderDTO> returnOrderList = this.invenService.getReturnOrderList(returnSearchDTO);
			
			mav.addObject("returnOrderCnt", returnOrderCnt);
			mav.addObject("returnOrderList", returnOrderList);
			
		} catch(Exception e) {
			System.out.println("예외발생"+e);
		}
		return mav;
	}
	
	@RequestMapping(value="/goReturnOrderContent.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")
	@ResponseBody
	public ReturnSalseContentDTO goReturnOrderInfo(
			@RequestParam(value="pk_no") int return_sales_no
			,ReturnSalseContentDTO returnContentDTO
			) {
		
		ReturnSalseContentDTO returnInfo = null;
		
		try {
			
			returnInfo = this.invenService.getReturnContent(return_sales_no);
			
		} catch(Exception e) {
			System.out.println("<반품 상세 정보 불러오기 실패>");
			System.out.println("예외발생 => "+e);
		}
		return returnInfo;
	}
	
	@RequestMapping(value="/viewSignUpBook.do")
	public ModelAndView viewSignUpBook() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewSignUpBook");
		mav.addObject("navigator", "[재고현황] → [도서정보조회] → [도서등록]");
		
		List<Map<String, String>> size = getSizeList();
		mav.addObject("size", size);
		
		List<Map<String, String>> category = getCatList();
		mav.addObject("category", category);

		return mav;
	}
	
	@RequestMapping(value="/goSignUpBookProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")
	@ResponseBody
	public int goSignUpBook(
			InvenDTO invenDTO
			) {
		
		int insertSignUpBookCnt = 0;
		try {
			
			insertSignUpBookCnt = this.invenService.getSignUpCnt(invenDTO);

			
		}catch(Exception e) {
			System.out.println("<책 등록 실패>");
			System.out.println("예외 발생=>"+e);
			insertSignUpBookCnt = -1;
		}
		
		return insertSignUpBookCnt;
	}
	
	@RequestMapping(value="/viewBookContentForm.do")
	public ModelAndView viewBookContentForm(
			@RequestParam(value="isbn13_search") String isbn13_search
			,BookInfoDTO bookInfoDTO
			,InvenSearchDTO invenSearchDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewBookContentForm");
		mav.addObject("navigator", "[재고현황] → [도서정보조회] → [상세정보]");
		
		//System.out.println(isbn13_search);
		
		try {
			
			BookInfoDTO bookInfo = this.invenService.getBookInfo(isbn13_search);
			
			String bookprice = bookInfo.getBook_price().trim();
			bookprice = bookprice.replace(",", "");
			bookInfo.setBook_price(bookprice);
			
			mav.addObject("bookInfo", bookInfo);
			
			List<Map<String, String>> inventory_loc = getLocList();
			mav.addObject("inventory_loc", inventory_loc);
			
		}catch(Exception e) {
			System.out.println("<서적 상세정보 불러오기 실패>");
			System.out.println("에러 발생=>"+e);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/goBookInfoUpProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")
	@ResponseBody
	public int goBookInfoUpProc(
			BookInfoDTO bookInfoDTO
			) {
		
		int bookInfoUpCnt = 0;
		
		try {
			
			bookInfoUpCnt = this.invenService.getBookInfoUpCnt(bookInfoDTO);
			
		}catch(Exception e) {
			System.out.println("<책 정보 수정 실패>");
			System.out.println("예외 발생 =>" + e);
		}
		
		return bookInfoUpCnt;
	}
	
	
	@RequestMapping(value="/goReleaseUp.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")
	@ResponseBody
	public int goReleaseUp(
			@RequestParam(value="all_order_no") String all_order_no
			) {
		
		int releaseUpCnt = 0;
		int isbn_cnt = 0;
		int order_cnt = 0;
		
		try {
			
			order_cnt = this.invenService.getOrderCnt(all_order_no);
			
			isbn_cnt = this.invenService.getIsbnCnt(all_order_no);
			
			if(isbn_cnt>order_cnt) {
				
				releaseUpCnt = this.invenService.getReleaseUpCnt(all_order_no);
				
			}else{
				
				return releaseUpCnt = -1;
				
			}
			
		}catch(Exception e) {
			System.out.println("<출고 날짜 등록 실패>");
			System.out.println("예외 발생=>"+e);
			releaseUpCnt = -2;
		}
		
		return releaseUpCnt;
	}
}

  
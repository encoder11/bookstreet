package com.group4.erp.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.service.AccountService;
import com.group4.erp.service.HRService;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.EmployeeDTO;
import com.group4.erp.EmployeeInfoUpDTO;
import com.group4.erp.HrDayoffDTO;
import com.group4.erp.HrListSearchDTO;
import com.group4.erp.SalListSearchDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.service.HRService;

@Controller
public class HRController {

	@Autowired
	HRService hrservice;
	AccountService accountService;

	@RequestMapping(value = "/viewEmpList.do")
	public ModelAndView viewEmpListList(HttpSession session, HrListSearchDTO hrListSearchDTO) {

		ModelAndView mav = new ModelAndView();
		// mav.setViewName("eventScheduleForm.jsp");

		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpList");
		mav.addObject("navigator", "[인사관리] → [직원정보]");

		try {

			int getEmpBoardListCnt = this.hrservice.getEmpListAllCnt(hrListSearchDTO);
			mav.addObject("getEmpBoardListCnt", getEmpBoardListCnt);

			if (getEmpBoardListCnt > 0) {
				// 선택한 페이지 번호 구하기
				int selectPageNo = hrListSearchDTO.getSelectPageNo();
				// 한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = hrListSearchDTO.getRowCntPerPage();
				// 검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo * rowCntPerPage - rowCntPerPage + 1);
				// 만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if (getEmpBoardListCnt < beginRowNo)
					hrListSearchDTO.setSelectPageNo(1);
			}

			List<Map<String, String>> getEmpBoardList = this.hrservice.getEmpList(hrListSearchDTO);
			mav.addObject("getEmpBoardList", getEmpBoardList);
			mav.addObject("hrListSearchDTO", hrListSearchDTO);

		} catch (Exception e) {
			System.out.println("<직원 리스트 조회 실패>");
			System.out.println("예외발생=>" + e);
		}

		return mav;
	}

	@RequestMapping(value = "/viewSalList.do")
	   public ModelAndView viewSalList(HttpSession session, SalListSearchDTO salListSearchDTO) {

	      ModelAndView mav = new ModelAndView();

	      try {

	         int emp_tot_cnt = this.hrservice.getEmpListAllCnt(salListSearchDTO);

	         System.out.println("emp_tot_cnt==" + emp_tot_cnt);

	         List<SalaryDTO> empSalList = this.hrservice.getEmpSalList(salListSearchDTO);

	         TimeDTO timeDTO = this.hrservice.getTime();

	         if (emp_tot_cnt > 0) {
	            int selectPageNo = salListSearchDTO.getSelectPageNo(); // 선택한 페이지 번호 구하기
	            int rowCntPerPage = salListSearchDTO.getRowCntPerPage(); // 한 화면에 보여지는 행의 개수 구하기
	            int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage + 1; // 검색할 시작행 번호 구하기
	            if (emp_tot_cnt < beginRowNo) { // 만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한 페이지 번호를 1로 지정

	               salListSearchDTO.setSelectPageNo(1);
	            }
	         }
	         
	         
	         String sal_chart_data = "[";
	         sal_chart_data += "['직급', '평균연봉']";
	      
	         List<SalaryDTO> avgSalInfo = this.hrservice.getAvgSalChart();

	         for (int i = 0; i < avgSalInfo.size(); i++) {
	            if(avgSalInfo.get(i).getJikup() == null || avgSalInfo.get(i).getJikup() =="") {
	            	continue;
	            }
	               // System.out.print(salaryList.get(i).get("jikup"));
	               sal_chart_data += ", ['";
	               sal_chart_data += avgSalInfo.get(i).getJikup();
	               sal_chart_data += "', ";
	               sal_chart_data += avgSalInfo.get(i).getAvg_salary();
	               sal_chart_data += "] ";
	            
	               
	         }
	         sal_chart_data += "]";

	         System.out.println(sal_chart_data);
	         // obj.put("chartName", "직원평균연봉정보");

	         mav.addObject("sal_chart_data", sal_chart_data);
	         

	         mav.setViewName("main.jsp");
	         mav.addObject("salListSearchDTO", salListSearchDTO);
	         mav.addObject("empSalList", empSalList);
	         mav.addObject("timeDTO", timeDTO);

	         mav.addObject("emp_tot_cnt", emp_tot_cnt);
	         mav.addObject("subMenu", "viewSalList");
	         mav.addObject("navigator", "[인사관리]-[급여지급현황]");

	      } catch (Exception e) {
	         System.out.println("예외발생==" + e);
	      }

	      return mav;
	   }
	
	//급여명세서(개인별) 조회 기능
	@RequestMapping(value="/viewEmpSalInfo.do")
	public ModelAndView viewEmpSalInfo(HttpSession session, SalListSearchDTO salListSearchDTO) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpSalInfo");
		mav.addObject("navigator", "[인사관리] → [급여지급내역]");
	
		String emp_no = (String)session.getAttribute("emp_id");
		int my_emp_no = Integer.parseInt(emp_no);

		salListSearchDTO.setMy_emp_no(my_emp_no);
		salListSearchDTO.setEmp_no(emp_no);
	
		TimeDTO timeDTO = this.hrservice.getTime();
		
		System.out.println("salListSearchDTO.getRowCntPerPage=="+salListSearchDTO.getRowCntPerPage());
		System.out.println("salListSearchDTO.getSelectPageNo=="+salListSearchDTO.getSelectPageNo());
		
		int myPayCheckCnt = this.hrservice.getMyPayCheckCnt(my_emp_no);

			
		//List<SalaryDTO> empSalInfo = this.hrservice.getEmpSalList(salListSearchDTO);
		if(myPayCheckCnt>0) {
			//선택한 페이지 번호 구하기
			int selectPageNo = salListSearchDTO.getSelectPageNo();
			//한 화면에 보여지는 행의 개수 구하기
			int rowCntPerPage = salListSearchDTO.getRowCntPerPage();
			//검색할 시작행 번호 구하기
			int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
			//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
			if(myPayCheckCnt<beginRowNo) salListSearchDTO.setSelectPageNo(1);
			
		}


		System.out.println("급여 컨트롤러 시작");
		
		List<SalaryDTO> myPayCheckList = this.hrservice.getSalaryInfo(salListSearchDTO);
		
		System.out.println("컨트롤러 급여명세서 조회 성공");
		
		
		mav.addObject("myPayCheckList", myPayCheckList);
		//mav.addObject("salListSearchDTO", salListSearchDTO);
		mav.addObject("myPayCheckCnt", myPayCheckCnt);

		mav.addObject("timeDTO", timeDTO);
		
		return mav;

	}

	
	// 직급별 평균 연봉을 막대 차트로 보여준다.
	@RequestMapping(value = "/viewEmpAvgSalChart.do")
	public ModelAndView viewEmpAvgSalChart(HttpSession session) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpAvgSalChart");

		String sal_chart_data = "[";
		sal_chart_data += "['직급', '평균연봉']";
		try {
			List<SalaryDTO> avgSalInfo = this.hrservice.getAvgSalChart();

			for (int i = 0; i < avgSalInfo.size(); i++) {
				// System.out.print(salaryList.get(i).get("jikup"));
				sal_chart_data += ", ['";
				sal_chart_data += avgSalInfo.get(i).getJikup();
				sal_chart_data += "', ";
				sal_chart_data += avgSalInfo.get(i).getAvg_salary();
				sal_chart_data += "] ";
			}
			sal_chart_data += "]";

			System.out.println(sal_chart_data);
			// obj.put("chartName", "직원평균연봉정보");

			mav.addObject("sal_chart_data", sal_chart_data);
			// mav.addObject("salaryList", salaryList);
		} catch (Exception e) {
			System.out.println("예외발생==" + e);
		}

		return mav;
	}

	@RequestMapping(value = "/viewEmpDayOffList.do")
	public ModelAndView viewDayOffList(HttpSession session, HrListSearchDTO hrListSearchDTO) {

		ModelAndView mav = new ModelAndView();
		// mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewDayOffList");
		mav.addObject("navigator", "[인사관리] → [직원 휴가 현황]");

		try {
			int getDayOffListCnt = this.hrservice.getDayOffListCnt(hrListSearchDTO);

			if (getDayOffListCnt > 0) {
				int beginRowNo = hrListSearchDTO.getSelectPageNo() * hrListSearchDTO.getRowCntPerPage()
						- hrListSearchDTO.getRowCntPerPage() + 1;
				if (getDayOffListCnt < beginRowNo) {
					hrListSearchDTO.setSelectPageNo(1);
				}
			}

			List<Map<String, String>> getDayOffList = this.hrservice.getDayOffList(hrListSearchDTO);

			mav.addObject("getDayOffListCnt", getDayOffListCnt);
			mav.addObject("getDayOffList", getDayOffList);
			mav.addObject("hrListSearchDTO", hrListSearchDTO);

			// System.out.println(hrListSearchDTO.getSelectPageNo());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mav;
	}

	@RequestMapping(value = "/viewEmpWorkStateList.do")
	public ModelAndView viewEmpWorkStateList(HttpSession session, HrListSearchDTO hrListSearchDTO) {

		// System.out.println(123456789);

		ModelAndView mav = new ModelAndView();
		// mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpWorkStateList");
		mav.addObject("navigator", "[인사관리] → [직원별 근무현황조회]");

		try {

			int getEmpInoutListCnt = this.hrservice.getEmpInoutListCnt(hrListSearchDTO);
			mav.addObject("getEmpInoutListCnt", getEmpInoutListCnt);

			List<Map<String, String>> getEmpInoutList = this.hrservice.getEmpInoutList(hrListSearchDTO);
			mav.addObject("getEmpInoutList", getEmpInoutList);

			mav.addObject("hrListSearchDTO", hrListSearchDTO);

			System.out.println("갯수" + getEmpInoutListCnt);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mav;
	}

	@RequestMapping(value = "/viewEmpContentForm.do")
	public ModelAndView empViewContectProc(@RequestParam(value = "emp_no") int emp_no) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpContentInfo");
		mav.addObject("navigator", "[인사관리]-[직원정보]-[상세보기]");

		try {

			EmployeeInfoUpDTO getEmpContentInfo = this.hrservice.getEmpContant(emp_no);

			mav.addObject("employeeInfoUpDTO", getEmpContentInfo);

		} catch (Exception e) {

		}

		return mav;

	}

	@RequestMapping(value = "/viewNewEmpJoin.do")
	public ModelAndView newEmpjoinMemberForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewEmpJoinMember");
		mav.addObject("navigator", "[인사관리] → [직원정보] → [직원등록]");
		return mav;
	}
	@RequestMapping(value = "/empWorkStateUpdateProc.do" // 접속하는 클의 URL 주소 설정

	// POST를 없애면 GET방식과 POST 방식 모두 수용하기 때문에 보안상 문제가 발생할수 있다.
	// 현업에선 보안 중시이니 귀찮더라더 from 태그 여러개 만들며 POST 방식으로 만들것!

			, method = RequestMethod.POST // 접속하는 클의 파값 전송 방법
			, produces = "application/json;charset=UTF-8" // 응당할 데이터 종류 json 설정
	)
	@ResponseBody // 비동기방식으로 들어온것이며 HTML소스가 아닌 DB연동의 결과물을 얻고 싶을때 메소드 위에 설정한다.
	public int updateDayInOutTime(@RequestParam(value = "in_time") String in_time,
			@RequestParam(value = "out_time", required = false) String out_time,
			@RequestParam(value = "check_inout_name") String check_inout_name,
			@RequestParam(value = "remarks", required = false) String remarks,
			@RequestParam(value = "emp_no") String emp_no, @RequestParam(value = "dt_work") String dt_work,
			HttpSession session) {
		System.out.println("dt_work =>" + dt_work);
		System.out.println("in_time =>" + in_time);
		System.out.println("out_time =>" + out_time);
		System.out.println("check_inout_name =>" + check_inout_name);
		System.out.println("remarks =>" + remarks);
		System.out.println("emp_no =>" + emp_no);
		// 매개변수에 저장된 파라미터값(즉 아이디,암호)을 HashMap에 저장하기
		// 이렇게 한 군데에 모으는 이유는 서비스 클래스에게 전달할 때 하나로 단일화하기 위함이다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("dt_work", dt_work);
		map.put("emp_no", emp_no);
		map.put("in_time", in_time);
		map.put("out_time", out_time);
		map.put("check_inout_name", check_inout_name);
		map.put("remarks", remarks);
		/*
		 * System.out.print("admin_id2 =>"+paramMap.get("admin_id"));
		 * System.out.print("pwd2 =>"+paramMap.get("pwd"));
		 */
		int updateCnt = 0;
		try {
			updateCnt = this.hrservice.getUpdateCnt(map);
		} catch (Exception e) {
			System.out.println("컨트롤러 에러 발생 : " + e);
		}
		return updateCnt;
	}

	@RequestMapping(value = "/newEmpInfoProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public int newEmpjoinMemberProc(EmployeeDTO employeeDTO, @RequestParam("uploadBtn") MultipartFile multipartFile) {
	      int newEmpInsertCnt = 0;

	      try {
	         String profilePath = "C:/git/prj1/group4erp/WebContent/WEB-INF/resources/image/";
	         String originalFilename = multipartFile.getOriginalFilename();
	         if(originalFilename.isEmpty() != true){   
	            originalFilename = originalFilename.trim().toLowerCase().replaceAll(" ", "");
	            //int length = originalFilename.length();
	            int position =  originalFilename.lastIndexOf(".");
	            String emp_email = employeeDTO.getEmp_email();
	            //System.out.println("emp_no=>"+emp_no);
	            String upFileName = emp_email + originalFilename.substring(position);
	            File localFile = new File(profilePath + upFileName);
	            //if(localFile.exists()==true){
	            //   localFile.delete();
	            //}
	            multipartFile.transferTo(localFile);
	            employeeDTO.setEmp_pic(upFileName);
	         }
	         else {
	            employeeDTO.setEmp_pic("newWithoutPic");
	         }
	         newEmpInsertCnt = this.hrservice.getNewEmpInsertCnt(employeeDTO);
	      } catch (Exception e) {
	         System.out.println("<사원 등록 실패>");
	         System.out.println("예외 발생=>" + e);
	      }

	      return newEmpInsertCnt;
	   }

	// ================================
	// 직원 상세보기 수정화면에서 수정될 값들 받는 ajax
	// ================================
	@RequestMapping(value = "/empInfoUpProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int empInfoUpProc(EmployeeInfoUpDTO employeeInfoUpDTO,
			@RequestParam("uploadBtn") MultipartFile multipartFile) {
		int empInfoUpdate = 0;
		int addDayoffinfo = 0;
		try {
			String profilePath = "C:/git/prj1/group4erp/WebContent/WEB-INF/resources/image/";
			String originalFilename = multipartFile.getOriginalFilename();
			if(originalFilename.isEmpty() != true){	
				System.out.println("진입");
				originalFilename = originalFilename.trim().toLowerCase().replaceAll(" ", "");
				//int length = originalFilename.length();
				int position =  originalFilename.lastIndexOf(".");
				String emp_email = employeeInfoUpDTO.getEmp_email();
				System.out.println("emp_email=>"+emp_email);
				String upFileName = emp_email + originalFilename.substring(position);
				File localFile = new File(profilePath + upFileName);
				if(localFile.exists()==true){
					localFile.delete();
				}
				multipartFile.transferTo(localFile);
				employeeInfoUpDTO.setEmp_pic(upFileName);
				//System.out.println("upFileName=>"+upFileName);
				//System.out.println("localFile=>"+localFile);
			}
			
			
			empInfoUpdate = this.hrservice.empInfoUpProc(employeeInfoUpDTO);
			addDayoffinfo = this.hrservice.getAddDayoffinfoCnt(employeeInfoUpDTO);
			/*
			 * EmployeeInfoUpDTO noEmp_pic =
			 * this.hrservice.getEmpNoEmpPic(employeeInfoUpDTO);
			 */
			if (empInfoUpdate != 1) {
				return 0;
			}
			
			
			//String newName = employeeInfoUpDTO.getEmp_pic();
			//String newEmp_no = employeeInfoUpDTO.getEmp_no();
			//if(newName != null) {
			//	System.out.println("Emp_no=>"+newEmp_no+"Emp_pic=>"+newName);
			//	int newPosition =  newName.lastIndexOf(".");
			//	System.out.println("newPosition=>"+newPosition);
			//	File updateFileName = new File(profilePath + newName);
			//	File updateFileNameNew = new File(profilePath + newEmp_no + newName.substring(newPosition));
			//	if( updateFileName.exists() ) updateFileName.renameTo( updateFileNameNew );
			//}

		} catch (Exception e) {
			System.out.println("<직원 상세보기 수정 실패>");
			System.out.println("예외 발생=>" + e);
		}
		return empInfoUpdate;

	}

	// ================================
	// 비동기 방식으로 휴가 신청 현황을 수정하는 메소드
	// ================================
	@RequestMapping(value = "/dayoffUpdateProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int dayoffUpdateProc(HrDayoffDTO hrDayoffDTO) {
		int dayoffUpdateCnt = 0;
		int dayoffUpdate = 0;
		try {
			dayoffUpdate = this.hrservice.dayoffUpdateProcI(hrDayoffDTO);
			if (dayoffUpdate != 1) {
				return 0;
			}
			dayoffUpdateCnt = this.hrservice.dayoffUpdateProcII(hrDayoffDTO);
		} catch (Exception e) {
			System.out.println("<휴가 현황 수정 실패>");
			System.out.println("예외 발생=>" + e);
		}
		return dayoffUpdateCnt;
	}

	// ================================
	// 비동기 방식으로 휴가 신청 현황을 삭제하는 메소드
	// ================================
	@RequestMapping(value = "/dayoffDeleteProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int dayoffDeleteProc(HrDayoffDTO hrDayoffDTO) {
		int dayoffDeleteCntI = 0;
		int dayoffDeleteCntII = 0;
		try {
			dayoffDeleteCntI = this.hrservice.dayoffDeleteProcI(hrDayoffDTO);
			if (dayoffDeleteCntI != 1) {
				return 0;
			}
			dayoffDeleteCntII = this.hrservice.dayoffDeleteProcII(hrDayoffDTO);
			if (dayoffDeleteCntII != 1) {
				return 0;
			}
		} catch (Exception e) {
			System.out.println("<휴가 현황 수정 실패>");
			System.out.println("예외 발생=>" + e);
		}
		return dayoffDeleteCntI;
	}


// 파일 업로드
/*
@RequestMapping(value = "/insertSampleFile.do") 
public ModelAndView insertBoard(HttpServletRequest request) throws Exception { 
	ModelAndView mv = new ModelAndView(); 
	MultipartHttpServletRequest multipartHttpServletRequest =(MultipartHttpServletRequest) request;
	multipartHttpServletRequest.getAttribute(arg0) 
	Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
	MultipartFile multipartFile = null; 
	multipartFile.transferTo(arg0); 
	while (iterator.hasNext()) {
		multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
		if(multipartFile.isEmpty() == false) {
			System.out.println("------------- file start -------------");
			System.out.println("name : " + multipartFile.getName());
			System.out.println("filename : " + multipartFile.getOriginalFilename());
			System.out.println("size : " + multipartFile.getSize());
			System.out.println("-------------- file end --------------\n"); } }
	
	 return mv; 
}

	// 파일 업로드
	@RequestMapping(value = "/insertSampleFile.do")
	public ModelAndView insertBoard(@RequestParam("profilePic") MultipartFile multipartFile) throws Exception {
		ModelAndView mv = new ModelAndView();
		File localFile = new File("C:/git/prj1/group4erp/WebContent/WEB-INF/resources/image/" + multipartFile.getOriginalFilename());
		multipartFile.transferTo(localFile);
		return mv;
	}
*/
}

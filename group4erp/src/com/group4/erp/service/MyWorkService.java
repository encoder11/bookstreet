package com.group4.erp.service;
import com.group4.erp.DayOffApplyDTO;
import com.group4.erp.HrDayoffJoinDTO;
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.MyWorkSearchDTO;
import com.group4.erp.WareHousingInsertDTO;

import java.util.*;

public interface MyWorkService {

	//담당상품조회
	//===================================================================================================
	//검색 조건 불러오는 부분
	List<Map<String,String>> getMyCareBookList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getCategoryList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBookSizeList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBranchList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getPublisherList(MyWorkSearchDTO myWorkSearchDTO);
	//===================================================================================================s
	//페이징 처리용 총 개수 호출
	int getMyWorkListAllCnt(MyWorkSearchDTO myWorkSearchDTO);

	//근태조회
	//===================================================================================================
	//검색 총 개수 리턴
	int getWorkDaysListAllCnt(MyWorkSearchDTO myWorkSearchDTO);
	//===================================================================================================
	//검색된 테이블 자료 리턴
	List<Map<String,String>> getWorkDaysList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String, String>> getSearchEmpNo(MyWorkSearchDTO myWorkSearchDTO);
	
	int getInsertBeforeCnt(WareHousingInsertDTO whInsertDTO);
	int getInsertWareHousing(WareHousingInsertDTO whInsertDTO);
	
	int getDayoffJoinCnt(HrDayoffJoinDTO dayoffJoinDTO);
	
	Map<String, String> getRemain(int emp_no);
	int getEmpDayoffTot();
	
	String getDayOffApplyNo(int emp_no);
	
	DayOffApplyDTO getMyDayOffApproval(int my_dayoff_approval_no);
}

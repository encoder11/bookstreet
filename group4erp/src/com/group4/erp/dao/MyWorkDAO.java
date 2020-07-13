package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.*;



public interface MyWorkDAO {


	//담담 상품 조회
	//===================================================================================================
	//검색 항목 불러오는 코드
	List<Map<String,String>> getMyCareBookList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getCategoryList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBookSizeList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getBranchList(MyWorkSearchDTO myWorkSearchDTO);
	List<Map<String,String>> getPublisherList(MyWorkSearchDTO myWorkSearchDTO);

	//===================================================================================================
	//페이징 처리를 위한 총 검색 개수 불러오는 코드
	int getMyWorkListAllCnt(MyWorkSearchDTO myWorkSearchDTO);

	//근태조회
	//===================================================================================================
	//검색 총 개수 리턴
	int getWorkDaysListAllCnt(MyWorkSearchDTO myWorkSearchDTO);
	//===================================================================================================
	//검색된 테이블 자료 리턴
	List<Map<String,String>> getWorkDaysList(MyWorkSearchDTO myWorkSearchDTO);
	
	List<Map<String,String>> getSearchEmpNo(MyWorkSearchDTO myWorkSearchDTO);
	
	int getInsertBeforeCnt(WareHousingInsertDTO whInsertDTO);
	int getInsertWareHousing(WareHousingInsertDTO whInsertDTO);
	
	int getDayoffCnt(HrDayoffJoinDTO dayoffJoinDTO);
	int getDayoffJoinCnt(HrDayoffJoinDTO dayoffJoinDTO);
	int getUpDayoffInfo(HrDayoffJoinDTO dayoffJoinDTO);
	int getUpDayoffInfoE(HrDayoffJoinDTO dayoffJoinDTO);
	
	Map<String, String> getRemain(int emp_no);
	int getEmpDayoffTot();
	
	String getDayOffApplyNo(int emp_no);
	
	DayOffApplyDTO getMyDayOffApproval(int my_dayoff_approval_no);
}

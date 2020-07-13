package com.group4.erp.service;

import com.group4.erp.DayOffApplyDTO;
import com.group4.erp.HrDayoffJoinDTO;
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.MyWorkSearchDTO;
import com.group4.erp.WareHousingInsertDTO;
import com.group4.erp.dao.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MyWorkServiceImpl implements MyWorkService{

	@Autowired
	private MyWorkDAO myWorkDAO;

	//담담 상품 조회
	//검색된 관리 상품 목록 불러오는 코드
	public List<Map<String,String>> getMyCareBookList(MyWorkSearchDTO myWorkSearchDTO) {

		List<Map<String,String>> getMyCareBookList = this.myWorkDAO.getMyCareBookList(myWorkSearchDTO);

		//System.out.println("서비스 : " + getMyCareBookList.size());
		return getMyCareBookList;
		
	}
	//===================================================================================================
	//검색 항목 불러오는 코드
	public List<Map<String,String>> getCategoryList(MyWorkSearchDTO myWorkSearchDTO) {

		List<Map<String,String>> getCategoryList = this.myWorkDAO.getCategoryList(myWorkSearchDTO);

		//System.out.println("서비스 : " + getCategoryList.size());
		return getCategoryList;
		
	}
	public List<Map<String,String>> getBookSizeList(MyWorkSearchDTO myWorkSearchDTO) {

		List<Map<String,String>> getBookSizeList = this.myWorkDAO.getBookSizeList(myWorkSearchDTO);

		//System.out.println("서비스 : " + getBookSizeList.size());
		return getBookSizeList;
		
	}
	public List<Map<String,String>> getBranchList(MyWorkSearchDTO myWorkSearchDTO) {

		List<Map<String,String>> getBranchList = this.myWorkDAO.getBranchList(myWorkSearchDTO);

		//System.out.println("서비스 : " + getBranchList.size());
		return getBranchList;
		
	}
	public List<Map<String,String>> getPublisherList(MyWorkSearchDTO myWorkSearchDTO) {

		List<Map<String,String>> getPublisherList = this.myWorkDAO.getPublisherList(myWorkSearchDTO);

		//System.out.println("서비스 : " + getPublisherList.size());
		return getPublisherList;
		
	}
	//===================================================================================================
	//페이징 처리를 위한 총 검색 개수 불러오는 코드
	public int getMyWorkListAllCnt(MyWorkSearchDTO myWorkSearchDTO) {

		int myWorkListAllCnt = this.myWorkDAO.getMyWorkListAllCnt(myWorkSearchDTO);

		//System.out.println("서비스 : " + myWorkListAllCnt);
		return myWorkListAllCnt;
		
	}
	
	//근태 조회
	//===================================================================================================
	//검색 총 개수 리턴
	public int getWorkDaysListAllCnt(MyWorkSearchDTO myWorkSearchDTO) {

		int workDaysListAllCnt = this.myWorkDAO.getWorkDaysListAllCnt(myWorkSearchDTO);

		//System.out.println("서비스 : " + workDaysListAllCnt);
		return workDaysListAllCnt;
		
	}
	//===================================================================================================
	//검색된 테이블 자료 리턴
	public List<Map<String,String>> getWorkDaysList(MyWorkSearchDTO myWorkSearchDTO){
		List<Map<String,String>> getWorkDaysList = this.myWorkDAO.getWorkDaysList(myWorkSearchDTO);
		
		//System.out.println("서비스 : " + getWorkDaysList.size());
		return getWorkDaysList;
	}
	public List<Map<String, String>> getSearchEmpNo(MyWorkSearchDTO myWorkSearchDTO) {

		List<Map<String, String>> searchEmpNo = this.myWorkDAO.getSearchEmpNo(myWorkSearchDTO);
		return searchEmpNo;
		
	}
	
	public int getInsertBeforeCnt(WareHousingInsertDTO whInsertDTO) {
		
		int insertBeforeCnt = this.myWorkDAO.getInsertBeforeCnt(whInsertDTO);
		
		return insertBeforeCnt;
	}
	public int getInsertWareHousing(WareHousingInsertDTO whInsertDTO) {
		
		int insertWareHousing = this.myWorkDAO.getInsertWareHousing(whInsertDTO);
		
		return insertWareHousing;
	}
	
	public int getDayoffJoinCnt(HrDayoffJoinDTO dayoffJoinDTO) {
		
		int selectDayoffCnt = this.myWorkDAO.getDayoffCnt(dayoffJoinDTO);
		if(selectDayoffCnt >= 1) {
			return -3;
		}
		
		int insertDayoffJoin = this.myWorkDAO.getDayoffJoinCnt(dayoffJoinDTO);
		int dayoff_cd = dayoffJoinDTO.getDayoff_cd();
		if(dayoff_cd==3 || dayoff_cd==4 || dayoff_cd==6) {
			int UpExceptionDayoffInfo = this.myWorkDAO.getUpDayoffInfoE(dayoffJoinDTO);
			if(UpExceptionDayoffInfo == 0 ) return -3;
		}else {
			int updateDayoffInfo = this.myWorkDAO.getUpDayoffInfo(dayoffJoinDTO);
			if(updateDayoffInfo == 0) return -2;
		}
		
		
		
		return insertDayoffJoin;
	}
	
	public Map<String, String> getRemain(int emp_no){
		
		Map<String, String> searchRemain = this.myWorkDAO.getRemain(emp_no);
		
		return searchRemain;
	}
	public int getEmpDayoffTot() {
		
		int empDayoffTot = this.myWorkDAO.getEmpDayoffTot();
		
		return empDayoffTot;
	}
	@Override
	public String getDayOffApplyNo(int emp_no) {
		// TODO Auto-generated method stub
		String dayOffApplyNo = this.myWorkDAO.getDayOffApplyNo(emp_no);
		
		return dayOffApplyNo;
	}
	@Override
	public DayOffApplyDTO getMyDayOffApproval(int my_dayoff_approval_no) {
		// TODO Auto-generated method stub
		DayOffApplyDTO myDayOffApplyInfo = this.myWorkDAO.getMyDayOffApproval(my_dayoff_approval_no);
		
		return myDayOffApplyInfo;
	}
}

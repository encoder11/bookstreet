package com.group4.erp.dao;

import com.group4.erp.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyWorkDAOImpl implements MyWorkDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	//담담 상품 조회
	//===================================================================================================
	//검색 항목 불러오는 코드
	public List<Map<String,String>> getMyCareBookList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getMyCareBookList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getMyCareBookList"
					,myWorkSearchDTO
				);
		//ystem.out.println("DAO : " + getMyCareBookList.size());
		return getMyCareBookList;
		
	}
	public List<Map<String,String>> getCategoryList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getCategoryList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getCategoryList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getCategoryList.size());
		return getCategoryList;
		
	}
	public List<Map<String,String>> getBookSizeList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getBookSizeList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getBookSizeList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getBookSizeList.size());
		return getBookSizeList;
		
	}
	public List<Map<String,String>> getBranchList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getBranchList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getBranchList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getBranchList.size());
		return getBranchList;
		
	}
	public List<Map<String,String>> getPublisherList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getPublisherList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getPublisherList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getPublisherList.size());
		return getPublisherList;
		
	}
	//===================================================================================================
	//페이징 처리를 위한 총 검색 개수 불러오는 코드
	public int getMyWorkListAllCnt(MyWorkSearchDTO myWorkSearchDTO){
		
		int myWorkListAllCnt = this.sqlSession.selectOne(
					"com.group4.erp.dao.myWorkDAO.getMyWorkListAllCnt"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + myWorkListAllCnt);
		return myWorkListAllCnt;
		
	}
	
	//근태 조회
	//===================================================================================================
	//검색 총 개수 리턴
	public int getWorkDaysListAllCnt(MyWorkSearchDTO myWorkSearchDTO){
		
		int workDaysListAllCnt = this.sqlSession.selectOne(
					"com.group4.erp.dao.myWorkDAO.getWorkDaysListAllCnt"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + workDaysListAllCnt);
		return workDaysListAllCnt;
		
	}
	//===================================================================================================
	//검색된 테이블 자료 리턴
	public List<Map<String,String>> getWorkDaysList(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getWorkDaysList = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getWorkDaysList"
					,myWorkSearchDTO
				);
		//System.out.println("DAO : " + getWorkDaysList.size());
		return getWorkDaysList;
		
	}
	public List<Map<String,String>> getSearchEmpNo(MyWorkSearchDTO myWorkSearchDTO){
		
		List<Map<String,String>> getSearchEmpNo = this.sqlSession.selectList(
					"com.group4.erp.dao.myWorkDAO.getSearchEmpNo"
					,myWorkSearchDTO
				);
		return getSearchEmpNo;
		
	}
	
	public int getInsertBeforeCnt(WareHousingInsertDTO whInsertDTO) {
		
		int insertBeforeCnt = this.sqlSession.insert(
				"com.group4.erp.dao.myWorkDAO.insertWHBefore"
				,whInsertDTO
				);
		
		return insertBeforeCnt;
	}
	public int getInsertWareHousing(WareHousingInsertDTO whInsertDTO) {
		
		int insertWareHousing = this.sqlSession.insert(
				"com.group4.erp.dao.myWorkDAO.insertWareHousing"
				,whInsertDTO
				);
		
		return insertWareHousing;
	}
	
	public int getDayoffJoinCnt(HrDayoffJoinDTO dayoffJoinDTO) {
		
		int insertDayoffJoin = this.sqlSession.insert(
				"com.group4.erp.dao.myWorkDAO.insertDayoff"
				,dayoffJoinDTO
				);
		
		return insertDayoffJoin;
	}

	public int getUpDayoffInfoE(HrDayoffJoinDTO dayoffJoinDTO) {
		
		int UpExceptionDayoffInfo = this.sqlSession.update(
				"com.group4.erp.dao.myWorkDAO.upExceptionDayoffInfo"
				,dayoffJoinDTO
				);
		
		return UpExceptionDayoffInfo;
	}

	public int getUpDayoffInfo(HrDayoffJoinDTO dayoffJoinDTO) {
		
		int updateDayoffInfo = this.sqlSession.update(
				"com.group4.erp.dao.myWorkDAO.updateDayoff"
				,dayoffJoinDTO
				);
		
		return updateDayoffInfo;
	}

	public int getDayoffCnt(HrDayoffJoinDTO dayoffJoinDTO) {
		
		int selectDayoffCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.myWorkDAO.selectDayoff"
				,dayoffJoinDTO
				);
		return selectDayoffCnt;
	}
	
	public Map<String,String> getRemain(int emp_no){
		
		Map<String, String> searchRemain = this.sqlSession.selectOne(
				"com.group4.erp.dao.myWorkDAO.selectRemain"
				,emp_no
				);
		
		return searchRemain;
	}
	public int getEmpDayoffTot() {
		
		int empDayoffTot = this.sqlSession.selectOne(
				"com.group4.erp.dao.myWorkDAO.empDayoffTot"
				);
		
		return empDayoffTot;
	}
	@Override
	public String getDayOffApplyNo(int emp_no) {
		// TODO Auto-generated method stub
		String dayOffApplyNo = this.sqlSession.selectOne("com.group4.erp.dao.myWorkDAO.getDayOffApplyNo", emp_no);
		
		return dayOffApplyNo;
	}
	@Override
	public DayOffApplyDTO getMyDayOffApproval(int dayoff_approval_no) {
		// TODO Auto-generated method stub
		DayOffApplyDTO dayOffApplyDTO = this.sqlSession.selectOne("com.group4.erp.dao.myWorkDAO.getMyDayOffApproval", dayoff_approval_no);
		
		return dayOffApplyDTO;
	}
}

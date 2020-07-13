package com.group4.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.group4.erp.InvenSearchDTO;
import com.group4.erp.service.InvenService;



public class CommonMethod {
	
	@Autowired
	InvenService invenService;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * 자사의 지역 위치를 가져오는 메소드
	 * 코드 데이터 형식이다.
	 */
	public List<Map<String, String>> getBrchList(){
		List<Map<String, String>> branch = this.sqlSession.selectList(
				"com.group4.common.dao.commet.getBrchList"
			);
		return branch;
	}
	
	public List<Map<String,String>> getLocList(){
		List<Map<String, String>> locList = this.sqlSession.selectList(
				"com.group4.common.dao.commet.getLocList"
			);
		return locList;
	}
	
	public List<Map<String, String>> getPublcList(){
		List<Map<String, String>> publcList =this.sqlSession.selectList(
				"com.group4.common.dao.commet.getPublcList"
			);
		return publcList;
	}
	
	public List<Map<String, String>> getSizeList(){
		List<Map<String, String>> sizeList =this.sqlSession.selectList(
				"com.group4.common.dao.commet.getSizeList"
			);
		return sizeList;
	}
	
	public List<Map<String, String>> getCatList(){
		List<Map<String, String>> catList =this.sqlSession.selectList(
				"com.group4.common.dao.commet.getCatList"
			);
		return catList;
	}
	
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
	
}

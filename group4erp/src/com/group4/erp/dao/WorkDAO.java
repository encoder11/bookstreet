package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;



public interface WorkDAO {

	//출장 신청 리스트
	List<Map<String,String>> getbusinessList(BusinessTripSearchDTO businessTripSearchDTO);
	//출장 신청 개수
	int getbusinessTripListAllCnt(BusinessTripSearchDTO businessTripSearchDTO);
	//출장 상세보기
	BusinessTripDTO getBusinessTripDTO(int work_outside_seq);
	//출장 신청
	int insertBusinessTrip(BusinessTripDTO businessTripDTO);
	//출장 신청 수정
	int updateBusinessTrip(BusinessTripDTO businessTripDTO);
	//출장 신청 삭제
	int deleteBusinessTrip(BusinessTripDTO businessTripDTO);
	//출장 승인
	int approvedBusinessTrip(BusinessTripDTO businessTripDTO);
	//삭제할 게시판 존재 개수
	//int getBusinessDelCnt(BusinessTripDTO businessTripDTO);
	//업데이트할 게시판 존재 개수
	//int getBusinessAppCnt(BusinessTripDTO businessTripDTO);
	
	//출장 신청시 결재 테이블에 저장할 결재번호를 만들기 위해 신청번호를 검색
	String searchMyBTripApplyNo(BusinessTripDTO businessTripDTO);
	
	//결재 화면에서 불러올 출장 신청 정보를 검색함
	BusinessTripDTO getMyBTripApproval(int my_bTrip_approval_no);
}

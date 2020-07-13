package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;
import com.group4.erp.dao.WorkDAO;

@Service
public class WokrServiceImpl implements WorkService {

	@Autowired
	WorkDAO workDAO;

	@Override
	public List<Map<String, String>> getbusinessTripList(BusinessTripSearchDTO businessTripSearchDTO){
		
		List<Map<String, String>> getbusinessTripList = this.workDAO.getbusinessList(businessTripSearchDTO);
		
		return getbusinessTripList;

	}

	public int getbusinessTripListAllCnt(BusinessTripSearchDTO businessTripSearchDTO) {
		
		int getbusinessTripListAllCnt = this.workDAO.getbusinessTripListAllCnt(businessTripSearchDTO);
		
		return getbusinessTripListAllCnt;
	}
	
	public BusinessTripDTO getBusinessTripDTO(int work_outside_seq) {

		//[BoardDAOImpl 객체]의 getBoardDTO 메소드를 호출하여 [1개 게시판 글]을 얻는다
		BusinessTripDTO businessTripDTO = this.workDAO.getBusinessTripDTO(work_outside_seq);
		
		//[1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
		return businessTripDTO;
	}
	
	public int insertBusinessTrip(BusinessTripDTO businessTripDTO) {

		//1개 게시판 글 입력 후 입력 적용 행의 개수 리턴하기
			//[BoardDTO 인터페이스]를 구현한 객체의 insertBoard 메소드를 호출하여 1개 게시판 글 입력 후 입력 적용 행의 개수를 리턴받는다
		int businessTripRegCnt = this.workDAO.insertBusinessTrip(businessTripDTO);
		
		return businessTripRegCnt;
	}
	
	public int updateBusinessTrip(BusinessTripDTO businessTripDTO) {
		
		/*
		 * int delCnt = this.workDAO.getBusinessDelCnt(businessTripDTO); if(delCnt==0)
		 * return -1;
		 */
		
		/*
		 * int upCnt = this.workDAO.getBusinessUpCnt(businessTripDTO); if(upCnt==0)
		 * return -1;
		 */
		//1개 게시판 글 입력 후 입력 적용 행의 개수 리턴하기
		//[BoardDTO 인터페이스]를 구현한 객체의 insertBoard 메소드를 호출하여 1개 게시판 글 입력 후 입력 적용 행의 개수를 리턴받는다
		int businessTripUpDelAppCnt = this.workDAO.updateBusinessTrip(businessTripDTO);
		
		return businessTripUpDelAppCnt;
	}
	
	public int deleteBusinessTrip(BusinessTripDTO businessTripDTO) {
		
		 //int delCnt = this.workDAO.getBusinessDelCnt(businessTripDTO); if(delCnt==0)
		 //return -1;
		 
		
		//1개 게시판 글 입력 후 입력 적용 행의 개수 리턴하기
			//[BoardDTO 인터페이스]를 구현한 객체의 insertBoard 메소드를 호출하여 1개 게시판 글 입력 후 입력 적용 행의 개수를 리턴받는다
		int businessTripUpDelCnt = this.workDAO.deleteBusinessTrip(businessTripDTO);
		
		return businessTripUpDelCnt;
	}
	
	public int approvedBusinessTrip(BusinessTripDTO businessTripDTO) {
	
		//int delCnt = this.workDAO.getBusinessDelCnt(businessTripDTO); if(delCnt==0)
		//return -1;
			
		
		//int appCnt = this.workDAO.getBusinessAppCnt(businessTripDTO); if(appCnt==0)
		//return -2;
		
		//1개 게시판 글 입력 후 입력 적용 행의 개수 리턴하기
			//[BoardDTO 인터페이스]를 구현한 객체의 insertBoard 메소드를 호출하여 1개 게시판 글 입력 후 입력 적용 행의 개수를 리턴받는다
		int businessTripUpDelCnt = this.workDAO.approvedBusinessTrip(businessTripDTO);
		
		return businessTripUpDelCnt;
	}

	@Override
	public String searchMyBTripApplyNo(BusinessTripDTO businessTripDTO) {
		// TODO Auto-generated method stub
		String myBTrupApplyNo = this.workDAO.searchMyBTripApplyNo(businessTripDTO);
		
		return myBTrupApplyNo;
	}

	@Override
	public BusinessTripDTO getMyBTripApproval(int my_bTrip_approval_no) {
		// TODO Auto-generated method stub
		BusinessTripDTO myBTripApplyInfo = this.workDAO.getMyBTripApproval(my_bTrip_approval_no);
		
		return myBTripApplyInfo;
	}
}

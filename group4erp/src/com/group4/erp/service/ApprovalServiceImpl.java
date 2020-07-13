package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;
import com.group4.erp.BusinessTripDTO;
import com.group4.erp.dao.ApprovalDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	ApprovalDAO approvalDAO;

	@Override
	public int insertApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		System.out.println("Service insertApproval() 메소드 실행");
		int insertCnt = this.approvalDAO.insertApproval(approvalDTO);
		
		return insertCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalReqList = this.approvalDAO.getApprovalReqList(approvalSearchDTO);
		
		return approvalReqList;
	}

	@Override
	public int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalReqCnt = this.approvalDAO.getApprovalReqCnt(approvalSearchDTO);
		
		return approvalReqCnt;
	}

	@Override
	public int getApprovalResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalToCnt = this.approvalDAO.getApprovalResCnt(approvalSearchDTO);
		
		return approvalToCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.approvalDAO.getApprovalResList(approvalSearchDTO);
		
		return approvalResList;
	}

	@Override
	public int updateApprovalState(String document_no) {
		// TODO Auto-generated method stub
		int approvalState = this.approvalDAO.updateApprovalState(document_no);
		
		return approvalState;
	}

	@Override
	public int updateEventState(String document_no) {
		// TODO Auto-generated method stub
		int eventState = this.approvalDAO.updateEventState(document_no);
		
		return eventState;
	}

	@Override
	public int insertApproval_dayOff(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int approval_dayOffCnt = this.approvalDAO.insertApproval_dayOff(approvalDTO);
		
		return approval_dayOffCnt;
	}

	@Override
	public int updateApprovalProc(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int updateApprovalCnt = this.approvalDAO.updateApprovalProc(approvalDTO);
		
		return updateApprovalCnt;
	}

	@Override
	public int getApprovalCEOResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalCEOCnt = this.approvalDAO.getApprovalCEOResCnt(approvalSearchDTO);
		
		return approvalCEOCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalCEOResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.approvalDAO.getApprovalCEOResList(approvalSearchDTO);
		
		return approvalResList;
	}

	@Override
	public int insertBTripApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int myBTripApprovalCnt = this.approvalDAO.insertBTripApproval(approvalDTO);
		
		return myBTripApprovalCnt;
	}

	@Override
	public int getMyReApprovalCnt(String document_no) {
		// TODO Auto-generated method stub
		int myReApprovalCnt = this.approvalDAO.getMyReApprovalCnt(document_no);
		
		return myReApprovalCnt;
	}

	@Override
	public int deleteDayOffApproval(int dayoff_apply_no) {
		// TODO Auto-generated method stub
		int delMyDayOffApproval = this.approvalDAO.deleteDayOffApproval(dayoff_apply_no);
		
		return delMyDayOffApproval;
	}

	@Override
	public int updateBTripApprovalProc(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int bTripApprovalCnt = this.approvalDAO.updateBTripApprovalProc(approvalDTO);
		
		return bTripApprovalCnt;
	}


	@Override
	public int deleteBTripApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int delBTripApprovalCnt = this.approvalDAO.deleteBTripApproval(approvalDTO);
		
		return delBTripApprovalCnt;
	}

	@Override
	public int deleteBTripApplyInfo(BusinessTripDTO businessTripDTO) {
		// TODO Auto-generated method stub
		int delBTripApplyInfoCnt = this.approvalDAO.deleteBTripApplyInfo(businessTripDTO);
		
		return delBTripApplyInfoCnt;
	}

}

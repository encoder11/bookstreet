package com.group4.erp.service;

import java.util.List;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;
import com.group4.erp.BusinessTripDTO;

public interface ApprovalService {
	
	int insertApproval(ApprovalDTO approvalDTO);
	
	List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO);
	
	int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO);
	
	int getApprovalResCnt(ApprovalSearchDTO approvalSearchDTO);
	
	int getApprovalCEOResCnt(ApprovalSearchDTO approvalSearchDTO);
	
	List<ApprovalDTO> getApprovalResList(ApprovalSearchDTO approvalSearchDTO);
	
	List<ApprovalDTO> getApprovalCEOResList(ApprovalSearchDTO approvalSearchDTO);
	
	int updateApprovalState(String document_no);
	
	int updateEventState(String document_no);
	
	int insertApproval_dayOff(ApprovalDTO approvalDTO);
	
	int updateApprovalProc(ApprovalDTO approvalDTO);
	
	int insertBTripApproval(ApprovalDTO approvalDTO);
	
	int getMyReApprovalCnt(String document_no);
	
	int deleteDayOffApproval(int dayoff_apply_no);
	
	int updateBTripApprovalProc(ApprovalDTO approvalDTO);

	int deleteBTripApproval(ApprovalDTO approvalDTO);
	
	int deleteBTripApplyInfo(BusinessTripDTO businessTripDTO);


}

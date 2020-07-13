package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;
import com.group4.erp.BusinessTripDTO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.ApprovalDAO.";

	@Override
	public int insertApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		
		System.out.println("DAO insertApproval() 메소드 실행");
		
		int approvalCnt = this.sqlSession.insert(mapper_namespace+"insertApproval", approvalDTO);
		
		return approvalCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalReqList = this.sqlSession.selectList(mapper_namespace+"getApprovalReqList", approvalSearchDTO);
		
		return approvalReqList;
	}

	@Override
	public int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalReqCnt = this.sqlSession.selectOne(mapper_namespace+"getApprovalReqCnt", approvalSearchDTO);
		
		return approvalReqCnt;
	}

	@Override
	public int getApprovalResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalToCnt = this.sqlSession.selectOne(mapper_namespace+"getApprovalResCnt", approvalSearchDTO);
		
		return approvalToCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.sqlSession.selectList(mapper_namespace+"getApprovalResList", approvalSearchDTO);
		
		return approvalResList;
	}

	@Override
	public int updateApprovalState(String document_no) {
		// TODO Auto-generated method stub
		int approvalState = this.sqlSession.update(mapper_namespace+"updateApprovalState", document_no);
		
		return approvalState;
	}

	@Override
	public int updateEventState(String document_no) {
		// TODO Auto-generated method stub
		int eventState = this.sqlSession.update(mapper_namespace+"updateEventState", document_no);
		
		return eventState;
	}

	@Override
	public int insertApproval_dayOff(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int approval_dayOffCnt = this.sqlSession.insert(mapper_namespace+"insertApproval", approvalDTO);
		
		return approval_dayOffCnt;
	}

	@Override
	public int updateApprovalProc(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int updateApprovalCnt = this.sqlSession.update(mapper_namespace+"updateApprovalProc", approvalDTO);
		
		return updateApprovalCnt;
	}

	@Override
	public int getApprovalCEOResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalCEOCnt = this.sqlSession.selectOne(mapper_namespace+"getApprovalCEOResCnt", approvalSearchDTO);
		
		return approvalCEOCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalCEOResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.sqlSession.selectList(mapper_namespace+"getApprovalCEOResList", approvalSearchDTO);
		
		return approvalResList;
	}

	@Override
	public int insertBTripApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int myBTripApprovalCnt = this.sqlSession.insert(mapper_namespace+"insertApproval", approvalDTO);
		
		return myBTripApprovalCnt;
	}

	@Override
	public int getMyReApprovalCnt(String document_no) {
		// TODO Auto-generated method stub
		int myReApprovalCnt = this.sqlSession.selectOne(mapper_namespace+"getMyReApprovalCnt", document_no);
		
		return myReApprovalCnt;
	}

	@Override
	public int deleteDayOffApproval(int dayoff_apply_no) {
		// TODO Auto-generated method stub
		int deleteMyDayOffApproval = this.sqlSession.delete(mapper_namespace+"deleteDayOffApproval", dayoff_apply_no);
		
		return deleteMyDayOffApproval;
	}

	@Override
	public int updateBTripApprovalProc(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int bTripApprovalCnt = this.sqlSession.update(mapper_namespace+"updateBTripApproval", approvalDTO);
		
		return bTripApprovalCnt;
	}

	@Override
	public int deleteBTripApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int delBTripApprovalCnt = this.sqlSession.update(mapper_namespace+"deleteBTripApproval", approvalDTO);
		
		return delBTripApprovalCnt;
	}

	@Override
	public int deleteBTripApplyInfo(BusinessTripDTO businessTripDTO) {
		// TODO Auto-generated method stub
		int delBTripApplyInfoCnt = this.sqlSession.update(mapper_namespace+"deleteBTripApplyInfo", businessTripDTO);
		
		return delBTripApplyInfoCnt;
	}

}

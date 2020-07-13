package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;

@Repository
public class WorkDAOImpl implements WorkDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String,String>> getbusinessList(BusinessTripSearchDTO businessTripSearchDTO){
		
		List<Map<String,String>> getbusinessList = this.sqlSession.selectList(
				"com.group4.erp.dao.WorkDAO.getBusinessTripList"
				,businessTripSearchDTO
				);
		
		return getbusinessList;
		
	}
	public int getbusinessTripListAllCnt(BusinessTripSearchDTO businessTripSearchDTO) {
		
		int getbusinessTripListAllCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.WorkDAO.getbusinessTripListAllCnt"		//실행할 SQL구문의 위치 지정
				,businessTripSearchDTO									//실행할 SQL구문에서 사용할 데이터 지정
				);

		return getbusinessTripListAllCnt;
	}
	
	public BusinessTripDTO getBusinessTripDTO(int work_outside_seq) {
		//[SqlSessionTemplate 객체]의 selectOne(~,~)을 호출하여 [1개 게시판 글 정보] 얻기
		BusinessTripDTO businessTripDTO = this.sqlSession.selectOne(
				"com.group4.erp.dao.WorkDAO.getBusinessTripDTO"
				,work_outside_seq
				);
		return businessTripDTO;
	}
	
	public int insertBusinessTrip(BusinessTripDTO businessTripDTO) {
		int businessTripRegCnt = sqlSession.insert(
				"com.group4.erp.dao.WorkDAO.insertBusinessTrip"
				,businessTripDTO
			);
		return businessTripRegCnt;
	}
	
	public int updateBusinessTrip(BusinessTripDTO businessTripDTO) {
		int businessTripUpDelAppCnt = sqlSession.update(
				"com.group4.erp.dao.WorkDAO.updateBusinessTrip"
				,businessTripDTO
			);
		return businessTripUpDelAppCnt;
	}
	
	public int deleteBusinessTrip(BusinessTripDTO businessTripDTO) {
		int businessTripUpDelCnt = sqlSession.update(
				"com.group4.erp.dao.WorkDAO.deleteBusinessTrip"
				,businessTripDTO
			);
		return businessTripUpDelCnt;
	}
	
	public int approvedBusinessTrip(BusinessTripDTO businessTripDTO) {
		int businessTripUpDelCnt = sqlSession.update(
				"com.group4.erp.dao.WorkDAO.approvedBusinessTrip"
				,businessTripDTO
			);
		return businessTripUpDelCnt;
	}
	/*public int getBusinessDelCnt(BusinessTripDTO businessTripDTO) {
		int delCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.WorkDAO.getBusinessDelCnt"
				,businessTripDTO
			);
		return delCnt;
	}*/
	@Override
	public String searchMyBTripApplyNo(BusinessTripDTO businessTripDTO) {
		// TODO Auto-generated method stub
		String myBTripApplyNo = sqlSession.selectOne("com.group4.erp.dao.WorkDAO.searchMyBTripApplyNo", businessTripDTO);
		
		return myBTripApplyNo;
	}
	@Override
	public BusinessTripDTO getMyBTripApproval(int my_bTrip_approval_no) {
		// TODO Auto-generated method stub
		BusinessTripDTO myBTripApplyInfo = sqlSession.selectOne("com.group4.erp.dao.WorkDAO.getMyBTripApproval", my_bTrip_approval_no);
		
		return myBTripApplyInfo;
	}
}
package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.ApprovalDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.EmployeeInfoDTO;
import com.group4.erp.EmployeeInfoUpDTO;
import com.group4.erp.HrDayoffDTO;
import com.group4.erp.HrListSearchDTO;
import com.group4.erp.SalListSearchDTO;

@Repository
public class HrDAOImpl implements HrDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.HrDAO.";

	@Override
	public List<SalaryDTO> getEmpSalList(SalListSearchDTO salListSearchDTO) {

		// TODO Auto-generated method stub

		System.out.println("getEmpSalList() 메소드 시작");
		List<SalaryDTO> empSalList = this.sqlSession.selectList(mapper_namespace + "getEmpSalList", salListSearchDTO);
		System.out.println("getEmpSalList() 메소드 끝");
		
		return empSalList;
	
	}
	
	
	public TimeDTO getTime() {
		// TODO Auto-generated method stub
		TimeDTO timeDTO = this.sqlSession.selectOne(mapper_namespace + "getTime");
		return timeDTO;
	}

	
	public int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO) {
		
		int getEmpBoardListCnt = this.sqlSession.selectOne(
				mapper_namespace+"getEmpListCnt"
				,hrListSearchDTO
				);
		
		return getEmpBoardListCnt;
	}
	
	public List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO){

		List<Map<String, String>> getEmpBoardList = this.sqlSession.selectList(
				mapper_namespace+"getEmpList"
				,hrListSearchDTO
				);
		//System.out.println("DAO=>" + getEmpBoardList);
		return getEmpBoardList;

	}
	
	@Override
	public int getDayOffListCnt(HrListSearchDTO hrListSearchDTO) {
		int getDayOffListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.HrDAO.getDayOffListCnt"
				,hrListSearchDTO
				);
		
		return getDayOffListCnt;
	}

	//휴가 신청 현황 리스트
	@Override
	public List<Map<String, String>> getDayOffList(HrListSearchDTO hrListSearchDTO) {
		List<Map<String, String>> getDayOffList = this.sqlSession.selectList(
				"com.group4.erp.dao.HrDAO.getDayOffList"
				,hrListSearchDTO
				);
		return getDayOffList;
	}
	
	
	public int dayoffUpdateProcI(HrDayoffDTO hrDayoffDTO) {
		int dayoffUpdate = this.sqlSession.update(
				mapper_namespace+"dayoffUpdateProcI"
				,hrDayoffDTO
				);	
		return dayoffUpdate;
	}
	
	@Override
	public int dayoffUpdateProcII(HrDayoffDTO hrDayoffDTO) {
		int dayoffUpdateCnt = this.sqlSession.update(
				mapper_namespace+"dayoffUpdateProcII"
				,hrDayoffDTO
				);		
		return dayoffUpdateCnt;
	}
	
	
	@Override
	public int dayoffDeleteProcI(HrDayoffDTO hrDayoffDTO) {
		int dayoffDeleteCntI = this.sqlSession.update(
				mapper_namespace+"dayoffDeleteProcI"
				,hrDayoffDTO
				);
		return dayoffDeleteCntI;
	}
	@Override
	public int dayoffDeleteProcII(HrDayoffDTO hrDayoffDTO) {
		int dayoffDeleteCntII = this.sqlSession.delete(
				mapper_namespace+"dayoffDeleteProcII"
				,hrDayoffDTO
				);
		return dayoffDeleteCntII;
	}



	
	

	
	@Override
	public int getEmpInoutListCnt(HrListSearchDTO hrListSearchDTO) {
		
		int getEmpInoutListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.HrDAO.getEmpInoutListCnt"
				,hrListSearchDTO
				);
		
		return getEmpInoutListCnt;
	}

	@Override
	public List<Map<String, String>> getEmpInoutList(HrListSearchDTO hrListSearchDTO) {
		
		List<Map<String, String>> getEmpInoutList = this.sqlSession.selectList(
				"com.group4.erp.dao.HrDAO.getEmpInoutList"
				,hrListSearchDTO
				);
		
		return getEmpInoutList;
	}
	


	@Override
	public List<SalaryDTO> getSalaryInfo(SalListSearchDTO salListSearchDTO) {
		// TODO Auto-generated method stub
		
		System.out.println("DAO getSalaryInfo() 메소드 실행");
		List<SalaryDTO> myPayCheckList = this.sqlSession.selectList(mapper_namespace+"getEmpSalInfo", salListSearchDTO);
		
		return myPayCheckList;
	}


	@Override
	public int getEmpListAllCnt(SalListSearchDTO salListSearchDTO) {
		// TODO Auto-generated method stub
		
		int getSalListCnt = this.sqlSession.selectOne(
				mapper_namespace+"getEmpListCnt"
				,salListSearchDTO
				);
		
		return getSalListCnt;
	
	}


	public EmployeeInfoUpDTO getEmpContant(int emp_no) {
		
		EmployeeInfoUpDTO getEmpContantList = this.sqlSession.selectOne(
				mapper_namespace+"getEmpContentList"
				,emp_no
				);
		
		return getEmpContantList;
		
	}
	
	
	


	@Override
	public int empInfoUpProc(EmployeeInfoUpDTO employeeInfoUpDTO) {
		int empInfoUpdate = this.sqlSession.update(
				mapper_namespace+"empInfoUpProc"
				,employeeInfoUpDTO
				);
		return empInfoUpdate;
	}
	
	public int newEmpConfirmProc(EmployeeInfoUpDTO employeeInfoUpDTO) {
		int	newEmpConfirm = this.sqlSession.update(
					mapper_namespace+"newEmpConfirmProc"
					,employeeInfoUpDTO
					);
		return newEmpConfirm;
	}
	
	/*
	 * public EmployeeInfoUpDTO getEmpNoEmpPic(EmployeeInfoUpDTO employeeInfoUpDTO)
	 * { EmployeeInfoUpDTO noEmp_pic = this.sqlSession.selectOne(
	 * mapper_namespace+"getEmpNoEmpPic" ,employeeInfoUpDTO ); return noEmp_pic; }
	 */
	
	
	
	
	


	@Override
	public List<SalaryDTO> getAvgSalChart() {
		// TODO Auto-generated method stub
		List<SalaryDTO> avgSalInfo = this.sqlSession.selectList(mapper_namespace+"getAvgSalChart");
		
		return avgSalInfo;
	}
	
	public int getNewEmpInsertCnt(EmployeeDTO employeeDTO) {
		
		int newEmpInsertCnt = this.sqlSession.insert(
				mapper_namespace+"getNewEmpInsert"
				,employeeDTO
				);
				
		return newEmpInsertCnt;
	}
	
	
	public int getAddDayoffinfoCnt(EmployeeInfoUpDTO employeeInfoUpDTO) {
	      String emp_no = employeeInfoUpDTO.getEmp_no();
	      int addDayoffinfo = 0;
	      if(emp_no.length() < 6) {
	         addDayoffinfo = this.sqlSession.insert(
	               mapper_namespace+"getAddDayoffinfo"
	               ,employeeInfoUpDTO
	         );
	         
	      }
	      return addDayoffinfo;
	   }

	/*
	public String getMgrEmpName(EmployeeDTO employeeDTO){
		String mgrEmpName = this.sqlSession.selectOne(
				mapper_namespace+".getMgrEmpName"
				,employeeDTO );
		return mgrEmpName;
	}*/

	public int getUpdateCnt(Map<String, String> emp_no_in_time_out_time_check_inout_name_remarks) {
		System.out.println("DAO 진입 성공");
		int updateCnt = this.sqlSession.update(
				mapper_namespace+"getUpdateCnt"
				,emp_no_in_time_out_time_check_inout_name_remarks
				);
		System.out.println("DAO 작업 성공 : " + updateCnt);
		return updateCnt;
	}


	@Override
	public int dayoffUpdateProc(HrDayoffDTO hrDayoffDTO) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getMyPayCheckCnt(int emp_no) {
		// TODO Auto-generated method stub
		int myPayCheckCnt = this.sqlSession.selectOne(mapper_namespace+"getMyPayCheckCnt", emp_no);
		
		return myPayCheckCnt;
	}


	@Override
	public int updateDayOffApprovalProc(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int myDayOffApproval = this.sqlSession.update(mapper_namespace+"updateDayOffApprovalProc", approvalDTO);
		
		return myDayOffApproval;
	}



}

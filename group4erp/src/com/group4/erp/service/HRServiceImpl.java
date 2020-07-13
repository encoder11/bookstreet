package com.group4.erp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.EmployeeInfoDTO;
import com.group4.erp.EmployeeInfoUpDTO;
import com.group4.erp.HrDayoffDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.SalListSearchDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.dao.HrDAO;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group4.erp.HrListSearchDTO;
import com.group4.erp.SalListSearchDTO;
import com.group4.erp.dao.HrDAO;
import com.group4.erp.dao.InvenDAO;

@Service
public class HRServiceImpl implements HRService {

	
	@Autowired
	HrDAO hrDAO;

	@Override
	public List<SalaryDTO> getEmpSalList(SalListSearchDTO salListSearchDTO) {
		
		List<SalaryDTO> empSalList = this.hrDAO.getEmpSalList(salListSearchDTO);
		
		return empSalList;
	}
	
	public int getEmpListAllCnt(HrListSearchDTO hrListSearchDTO) {
		
		int getEmpBoardListCnt = this.hrDAO.getEmpListAllCnt(hrListSearchDTO);
		
		return getEmpBoardListCnt;
	}
	
	public List<Map<String, String>> getEmpList(HrListSearchDTO hrListSearchDTO){
		
		List<Map<String, String>> getEmpBoardList = this.hrDAO.getEmpList(hrListSearchDTO);
		
		return getEmpBoardList;

	}
	
	@Override
	public int getDayOffListCnt(HrListSearchDTO hrListSearchDTO) {
		int getDayOffListCnt = this.hrDAO.getDayOffListCnt(hrListSearchDTO);
		return getDayOffListCnt;
	}

	@Override
	public List<Map<String, String>> getDayOffList(HrListSearchDTO hrListSearchDTO) {
		List<Map<String, String>> getDayOffList = this.hrDAO.getDayOffList(hrListSearchDTO);
		return getDayOffList;
	}

	@Override
	public int getEmpInoutListCnt(HrListSearchDTO hrListSearchDTO) {
		int getEmpInoutListCnt = this.hrDAO.getEmpInoutListCnt(hrListSearchDTO);
		return getEmpInoutListCnt;
	}

	@Override
	public List<Map<String, String>> getEmpInoutList(HrListSearchDTO hrListSearchDTO) {
		List<Map<String, String>> getEmpInoutList = this.hrDAO.getEmpInoutList(hrListSearchDTO);
		return getEmpInoutList;
	}
	
	
	
	public int getEmpListAllCnt(SalListSearchDTO salListSearchDTO) {
		
		int getEmpBoardListCnt = this.hrDAO.getEmpListAllCnt(salListSearchDTO);
		
		return getEmpBoardListCnt;
	}
	

	@Override
	public TimeDTO getTime() {
		// TODO Auto-generated method stub
		TimeDTO timeDTO = this.hrDAO.getTime();
		
		return timeDTO;
	}

	@Override
	public List<SalaryDTO> getSalaryInfo(SalListSearchDTO salListSearchDTO) {
		// TODO Auto-generated method stub
		
		List<SalaryDTO> myPayCheckList = this.hrDAO.getSalaryInfo(salListSearchDTO);
		
		return myPayCheckList;
	}

	public EmployeeInfoUpDTO getEmpContant(int emp_no) {
		
		EmployeeInfoUpDTO getEmpContantList = this.hrDAO.getEmpContant(emp_no);
		
		return getEmpContantList;

	}
	
	

	@Override
	public int empInfoUpProc(EmployeeInfoUpDTO employeeInfoUpDTO) {
		int empInfoUpdate = 0;
		String emp_no = employeeInfoUpDTO.getEmp_no();
		if(emp_no.length() < 6) {
			System.out.println(employeeInfoUpDTO.toString());
			int newEmpConfirm = this.hrDAO.newEmpConfirmProc(employeeInfoUpDTO);
			if(newEmpConfirm != 1) {
				return 0;
			}
		}else {
			System.out.println(employeeInfoUpDTO.toString());
			empInfoUpdate = this.hrDAO.empInfoUpProc(employeeInfoUpDTO);
		}
		return empInfoUpdate;	
			
	}
	
	/*
	 * @Override public EmployeeInfoUpDTO getEmpNoEmpPic(EmployeeInfoUpDTO
	 * employeeInfoUpDTO) { EmployeeInfoUpDTO noEmp_pic =
	 * this.hrDAO.getEmpNoEmpPic(employeeInfoUpDTO); return noEmp_pic; }
	 */

	
	

	@Override
	public List<SalaryDTO> getAvgSalChart() {
		List<SalaryDTO> avgSalInfo = this.hrDAO.getAvgSalChart();
		return avgSalInfo;
	}
	

	public int getNewEmpInsertCnt(EmployeeDTO employeeDTO) {
		int newEmpInsertCnt = this.hrDAO.getNewEmpInsertCnt(employeeDTO);
		return newEmpInsertCnt;
	}
	
	
	@Override
	public int getAddDayoffinfoCnt(EmployeeInfoUpDTO employeeInfoUpDTO) {
		int addDayoffinfo = this.hrDAO.getAddDayoffinfoCnt(employeeInfoUpDTO);
		return addDayoffinfo;
	}


	/*
	public String getMgrEmpName(EmployeeDTO employeeDTO){
		String mgrEmpName = this.hrDAO.getMgrEmpName(employeeDTO);
		
		return mgrEmpName;
	}
*/

	@Override
	public int dayoffUpdateProcI(HrDayoffDTO hrDayoffDTO) {
		int dayoffUpdate = this.hrDAO.dayoffUpdateProcI(hrDayoffDTO);
		return dayoffUpdate;
	}

	@Override
	public int dayoffUpdateProcII(HrDayoffDTO hrDayoffDTO) {
		int dayoffUpdateCnt = this.hrDAO.dayoffUpdateProcII(hrDayoffDTO);
		return dayoffUpdateCnt;
	}


	@Override
	public int dayoffDeleteProcI(HrDayoffDTO hrDayoffDTO) {
		int dayoffDeleteCntI = this.hrDAO.dayoffDeleteProcI(hrDayoffDTO);
		return dayoffDeleteCntI;
	}

	@Override
	public int dayoffDeleteProcII(HrDayoffDTO hrDayoffDTO) {
		int dayoffDeleteCntII = this.hrDAO.dayoffDeleteProcII(hrDayoffDTO);
		return dayoffDeleteCntII;
	}

	@Override
	public int dayoffUpdateProc(HrDayoffDTO hrDayoffDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int getUpdateCnt(Map<String, String> emp_no_in_time_out_time_check_inout_name_remarks) {
		System.out.println("서비스 진입 성공");
		int updateCnt = this.hrDAO.getUpdateCnt(emp_no_in_time_out_time_check_inout_name_remarks);
		System.out.println("서비스 작업 성공 : " + updateCnt);
		return updateCnt;
	}

	@Override
	public int getMyPayCheckCnt(int emp_no) {
		// TODO Auto-generated method stub
		int myPayCheckCnt = this.hrDAO.getMyPayCheckCnt(emp_no);
		
		return myPayCheckCnt;
	}

	@Override
	public int updateDayOffApprovalProc(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int myDayOffApproval = this.hrDAO.updateDayOffApprovalProc(approvalDTO);
		
		return myDayOffApproval;
	}

}

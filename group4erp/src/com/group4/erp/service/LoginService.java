package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TimeDTO;
import com.group4.erp.HrListSearchDTO;


public interface LoginService {
	int getEmpIdCnt(Map<String, String> emp_id_pwd);
	
	EmployeeDTO getLoginEmpInfo(String emp_id);
	
	EmpApprovalCheckDTO getApprovalCheck(String jumin);
}

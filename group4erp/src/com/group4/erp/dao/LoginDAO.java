package com.group4.erp.dao;

import java.util.Map;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;



public interface LoginDAO {

	
	int getEmpIdCnt(Map<String, String> emp_id_pwd);
	
	EmployeeDTO getLoginEmpInfo(String emp_id);

	EmpApprovalCheckDTO getApprovalCheck(String jumin);
}

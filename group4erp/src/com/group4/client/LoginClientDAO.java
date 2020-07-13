package com.group4.client;

import java.util.Map;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;



public interface LoginClientDAO {

	int getcusLoginCnt(CustomerLoginDTO cusLoginDTO);
	
	/*
	int getInsertCus(CustomerLoginDTO cusLoginDTO);
	
	int getNcusLoginCnt(CustomerLoginDTO cusLoginDTO);
	*/
}

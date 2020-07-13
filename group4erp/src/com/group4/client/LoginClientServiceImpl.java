package com.group4.client;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.dao.LoginDAO;


@Service
@Transactional
public class LoginClientServiceImpl implements LoginClientService {
	
	@Autowired
	private LoginClientDAO loginClientDAO;


	public int getcusLoginCnt(CustomerLoginDTO cusLoginDTO) {
		
		int checkCusLogin = this.loginClientDAO.getcusLoginCnt(cusLoginDTO);
		
		/*
		if(cusLoginDTO.getCheckMember().equals("y")) {
			
			checkCusLogin = this.loginClientDAO.getcusLoginCnt(cusLoginDTO);
			
		}else {
			int insertCus = this.loginClientDAO.getInsertCus(cusLoginDTO);
			if(insertCus==0) {
				return -2;
			}
			
			checkCusLogin = this.loginClientDAO.getNcusLoginCnt(cusLoginDTO);
		}*/
		
		return checkCusLogin;
	}
	
}

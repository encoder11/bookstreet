package com.group4.client;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;


//[DAO 클래스]인 [LoginDAOImpl 클래스]선언
	//@Repository를 붙임으로써 DAO클래스 임을 지정하게되고, bean 태그로 자동 등록된다
@Repository
public class LoginClientDAOImpl implements LoginClientDAO {
	
	//SqlSessionTemplate객체를 생성해 속성변수 sqlSession에 저장
	//속성변수 sqlSession 선언하고, @Autowired에 의해 SqlSessionTemplate클래스를 객체화하여 저장한다
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String Loginmapper = "com.group4.erp.dao.CLoginDAO";
	
	public int getcusLoginCnt(CustomerLoginDTO cusLoginDTO) {
		
		int checkCusLogin = this.sqlSession.selectOne(
				Loginmapper+".getcusYLoginCnt"
				,cusLoginDTO
				);
		
		
		/*
		if(cusLoginDTO.getCheckMember().equals("y")) {
			checkCusLogin = this.sqlSession.selectOne(
					Loginmapper+".getcusYLoginCnt"
					,cusLoginDTO
					);
		}else {
			checkCusLogin = this.sqlSession.selectOne(
					Loginmapper+".getcusNLoginCnt"
					,cusLoginDTO
					);
		}
		*/
		
		
		
		return checkCusLogin;
	}

}

package com.group4.erp.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;


//[DAO 클래스]인 [LoginDAOImpl 클래스]선언
	//@Repository를 붙임으로써 DAO클래스 임을 지정하게되고, bean 태그로 자동 등록된다
@Repository
public class LoginDAOImpl implements LoginDAO {
	
	//SqlSessionTemplate객체를 생성해 속성변수 sqlSession에 저장
	//속성변수 sqlSession 선언하고, @Autowired에 의해 SqlSessionTemplate클래스를 객체화하여 저장한다
	@Autowired
	private SqlSessionTemplate sqlSession;

	//로그인 정보의 개수를 리턴하는 메소드 선언
	public int getEmpIdCnt(Map<String, String> emp_id_pwd) {

		//SqlSessionTemplate객체의 selectOne메소드를 호출하여 검색 SQL구문을 실행하여 1행n열의 데이터를 얻는다.
		int emp_idCnt = this.sqlSession.selectOne(
			
				//xml파일중에 <mapper namespace="com.naver.erp.LoginDAO">태그 내부에 id=getAdminCnt를 가진 태그 내부의 SQL구문을 실행하라
				"com.group4.erp.dao.loginDAO.getEmpIdCnt"
				//위 SQL구문을 실행할때 참여할 HashMap객체 지정
				,emp_id_pwd
		);

		System.out.println("DAO : " + emp_idCnt);
		//로그인 정보의 개수를 리턴
		return emp_idCnt;
	}

	@Override
	public EmployeeDTO getLoginEmpInfo(String emp_id) {
		// TODO Auto-generated method stub
		
		EmployeeDTO loginEmpInfo = this.sqlSession.selectOne("com.group4.erp.dao.loginDAO.getLoginEmpInfo", emp_id);
		
		return loginEmpInfo;
	}
	
	public EmpApprovalCheckDTO getApprovalCheck(String jumin) {
		
		System.out.println("DAODAODAO");
		
		EmpApprovalCheckDTO loginInfo = this.sqlSession.selectOne(
				"com.group4.erp.dao.loginDAO.getApprovalCheck"
				,jumin
				);
		
		System.out.println("DAODAODAOoutoutout");
		
		return loginInfo;
		
	}

}

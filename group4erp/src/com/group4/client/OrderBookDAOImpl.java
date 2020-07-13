package com.group4.client;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderBookDAOImpl implements OrderBookDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapperOrder = "com.group4.cilent.dao.OrderBookDAO";
	
	public int getBookCnt(BookOrderInsertDTO boinsertDTO) {
		
		int bookCnt = this.sqlSession.selectOne(
				mapperOrder+".getBookCnt"
				,boinsertDTO
				);
		
		return bookCnt;
	}
	
	public int getInsertOrderCnt(BookOrderInsertDTO boinsertDTO) {
		
		int checkID = this.sqlSession.selectOne(
				mapperOrder+".getCheckID"
				,boinsertDTO
				);
		if(checkID==0) {
			return -3;
		}
		
		/*
		int updateStockCnt = this.sqlSession.update(
				mapperOrder+".getUpStockCnt"
				,boinsertDTO
				);
		if(updateStockCnt==0) {
			return -4;
		}
		*/
		int insertDebit = this.sqlSession.insert(
				mapperOrder+".insertDebit"
				,boinsertDTO
				);
		if(insertDebit==0) {
			return -6;
		}
		
		//시간이없어서 유효성없이 때려박음
		int insertOrder = this.sqlSession.insert(
				mapperOrder+".getInsertOrderCnt"
				,boinsertDTO
				);
		
		int insertRelease = this.sqlSession.insert(
				mapperOrder+".getInsertReleaseCus"
				,boinsertDTO
				);
		if(insertRelease==0) {
			return -5;
		}
		
		
		return insertOrder;
	}
	
	
	public int getInMemberCnt(BookOrderInsertDTO boinsertDTO) {
		
		int insertNoMember = this.sqlSession.insert(
				mapperOrder+".getInMemberCnt"
				,boinsertDTO
				);
		
		return insertNoMember;
	}
	
	public int getInsertOrderNoCnt(BookOrderInsertDTO boinsertDTO) {
		
		int insertDebit = this.sqlSession.insert(
				mapperOrder+".insertDebit"
				,boinsertDTO
				);
		if(insertDebit==0) {
			return -6;
		}
		
		int insertOrderNo = this.sqlSession.insert(
				mapperOrder+".getInsertOrderNoCnt"
				,boinsertDTO
				);
		
		int insertRelease = this.sqlSession.insert(
				mapperOrder+".getInsertReleaseCus"
				,boinsertDTO
				);
		if(insertRelease==0) {
			return -5;
		}
		
		return insertOrderNo;
	}
	
	public int getInsertOrderCorpCnt(BookOrderInsertDTO boinsertDTO) {
		
		int checkID = this.sqlSession.selectOne(
				mapperOrder+".getCheckCorpID"
				,boinsertDTO
				);
		if(checkID==0) {
			return -3;
		}
		
		int insertDebit = this.sqlSession.insert(
				mapperOrder+".insertDebit"
				,boinsertDTO
				);
		if(insertDebit==0) {
			return -4;
		}
		
		int insertOrderCorp = this.sqlSession.insert(
				mapperOrder+".getInsertOrderCorpCnt"
				,boinsertDTO
				);

		return insertOrderCorp;
	}
	
	public int getInsertReleaseCorp(BookOrderInsertDTO boinsertDTO) {
		int insertRelease = this.sqlSession.insert(
				mapperOrder+".getInsertReleaseCorp"
				,boinsertDTO
				);
		
		return insertRelease;
	}
}

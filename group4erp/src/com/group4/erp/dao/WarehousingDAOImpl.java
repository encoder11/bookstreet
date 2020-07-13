package com.group4.erp.dao;

import com.group4.erp.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WarehousingDAOImpl implements WarehousingDAO{

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   
 
	
	
	

	@Override
	public int getWarehousingListCnt(WarehousingSearchDTO warehousingSearchDTO) {
		int warehousingListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.WarehousingDAO.getWarehousingListCnt"
				,warehousingSearchDTO
				);
		
		return warehousingListCnt;
	}
	
	
	@Override
	public List<Map<String, String>> getWarehousingList(WarehousingSearchDTO warehousingSearchDTO) {
		List<Map<String,String>> warehousingList = this.sqlSession.selectList(
				"com.group4.erp.dao.WarehousingDAO.getWarehousingList"
				,warehousingSearchDTO
			);
	
	return warehousingList;
	}
	
	
	@Override
	public List<Map<String, String>> getBranch(WarehousingSearchDTO warehousingSearchDTO) {
		List<Map<String, String>> branch = this.sqlSession.selectList(
				"com.group4.erp.dao.WarehousingDAO.getBranch"
				,warehousingSearchDTO
				);
		return branch;
	}
	
	
	
	public List<Map<String, String>> getPublisher(WarehousingSearchDTO warehousingSearchDTO){
		List<Map<String, String>> publisher = this.sqlSession.selectList(
				"com.group4.erp.dao.WarehousingDAO.getPublisherList"
				,warehousingSearchDTO
				);
		
		return publisher;
	}


	@Override
	public WarehousingSearchDTO warehousingProc(String order_inven_no) {
		WarehousingSearchDTO warehContent = this.sqlSession.selectOne(
				"com.group4.erp.dao.WarehousingDAO.warehContent"
				,order_inven_no);
		
		//System.out.println(warehContent.getBook_name());
		return warehContent;
	}

	
	
	public int warehousingStock(int wh_no) {
		int whStockCnt = this.sqlSession.update(
				"com.group4.erp.dao.WarehousingDAO.whStockCnt"	
				,(Integer)wh_no);
		return whStockCnt;
	}

	@Override
	public int warehousingConfirm(int wh_no) {
		int whConfirmCnt = this.sqlSession.update(
				"com.group4.erp.dao.WarehousingDAO.whConfirmCnt"	
				,(Integer)wh_no);
		return whConfirmCnt;
	}
	
	
	
	
	
	
	


	

}

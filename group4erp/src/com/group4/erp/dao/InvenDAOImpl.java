package com.group4.erp.dao;

import com.group4.erp.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InvenDAOImpl implements InvenDAO{

   @Autowired
   private SqlSessionTemplate sqlSession;
   

	public List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getBookList = this.sqlSession.selectList(
					"com.group4.erp.dao.invenSearchDAO.getBookList"
					,invenSearchDTO
				);
		
		return getBookList;
		
	}
	
	
	public int getBookListCnt(InvenSearchDTO invenSearchDTO) {
		
		int bookListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getBookListCnt"
				,invenSearchDTO
				);
		
		return bookListCnt;
	}

	public int getReleaseListCnt(InvenSearchDTO invenSearchDTO) {
		
		int releaseListCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getReleaseListCnt"
				,invenSearchDTO
				);
		
		return releaseListCnt;
	}
	
	public List<Map<String,String>> getReleaseList(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getReleaseList = this.sqlSession.selectList(
				"com.group4.erp.dao.invenSearchDAO.getReleaseList"
				,invenSearchDTO
			);
	
		return getReleaseList;
	}
	
	public Cus_releaseInfoDTO getReleaseCusInfo(int all_order_no) {

		Cus_releaseInfoDTO cus_order = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getReleaseCusInfo"
				,all_order_no);
		
		return cus_order;
	}
	
	public Cus_releaseInfoDTO getReleaseCorpInfo(int all_order_no) {

		Cus_releaseInfoDTO corp_order = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getReleaseCorpInfo"
				,all_order_no);
		
		return corp_order;
	}
	
	public int getReturnOrderCnt() {	
		int returnOrderCnt = this.sqlSession.selectOne("com.group4.erp.dao.invenSearchDAO.getReturnOrderCnt");

		
		return returnOrderCnt;
	}
	
	public List<ReturnOrderDTO> getReturnOrderList(ReturnSearchDTO returnSearchDTO) {
		List<ReturnOrderDTO> returnOrderList = this.sqlSession.selectList("com.group4.erp.dao.invenSearchDAO.getReturnOrderList", returnSearchDTO);
		
		return returnOrderList;
	}
	

	public int getReturnOrderCnt(ReturnSearchDTO returnSearchDTO) {	
		int returnOrderCnt = this.sqlSession.selectOne("com.group4.erp.dao.invenSearchDAO.getReturnOrderCnt", returnSearchDTO);
		return returnOrderCnt;
	}
	
	public int getSignUpCnt(InvenDTO invenDTO) {
		
		int insertSignUpBookCnt = this.sqlSession.insert(
				"com.group4.erp.dao.invenSearchDAO.getSignUpBook"
				,invenDTO
				);
		
		return insertSignUpBookCnt;
	}
	
	public BookInfoDTO getBookInfo(String isbn13_search) {
		
		BookInfoDTO bookInfo = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getBookInfo"
				,isbn13_search
				);
		
		return bookInfo;
		
	}
	
	
	public int getOrderCnt(String all_order_no) {
		int orderCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getOrderCnt"
				,all_order_no
				);
		return orderCnt;
	}
	public int getOrderCnts(String all_order_no) {
		int orderCnts = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getOrderCnts"
				,all_order_no
				);
		return orderCnts;
	}
	
	public int getIsbnCnt(String all_order_no) {
		int isbnCnt = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getIsbnCnt"
				,all_order_no
				);
		return isbnCnt;
	}
	public int getIsbnCnts(String all_order_no) {
		int isbnCnts = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getIsbnCnts"
				,all_order_no
				);
		return isbnCnts;
	}
	
	
	public int getReleaseUpCnt(String all_order_no) {
		int releaseUpCnt = this.sqlSession.update(
				"com.group4.erp.dao.invenSearchDAO.getReleaseUpCnt"
				,all_order_no
				);
		
		return releaseUpCnt;
	}
	public int getReleaseUpCnts(String all_order_no) {
		int releaseUpCnts = this.sqlSession.update(
				"com.group4.erp.dao.invenSearchDAO.getReleaseUpCnts"
				,all_order_no
				);
		
		return releaseUpCnts;
	}
	
	public int getisbnCntUpdate(String all_order_no) {
		int isbnCntUpdate = this.sqlSession.update(
				"com.group4.erp.dao.invenSearchDAO.getIsbnCntUpdate"
				,all_order_no
				);
		return isbnCntUpdate;
	}
	public int getisbnCntUpdates(String all_order_no) {
		int isbnCntUpdates = this.sqlSession.update(
				"com.group4.erp.dao.invenSearchDAO.getIsbnCntUpdates"
				,all_order_no
				);
		return isbnCntUpdates;
	}
	
	public int getBookStockCnt(InvenDTO invenDTO) {
		
		int insertBookStock = this.sqlSession.insert(
				"com.group4.erp.dao.invenSearchDAO.getBookStock"
				,invenDTO
				);
		
		return insertBookStock;
	}
	
	public ReturnSalseContentDTO getReturnContent(int return_sales_no) {
		
		ReturnSalseContentDTO returnInfo = this.sqlSession.selectOne(
				"com.group4.erp.dao.invenSearchDAO.getReturnContent"
				,return_sales_no
				);
		
		return returnInfo;
	}
	
	public int getBookInfoUpCnt(BookInfoDTO bookInfoDTO) {
		int bookInfoUpCnt = this.sqlSession.update(
				"com.group4.erp.dao.invenSearchDAO.getBookInfoUpCnt"
				,bookInfoDTO
				);
		return bookInfoUpCnt;
	}
	public int getBranchUpCnt(BookInfoDTO bookInfoDTO) {
		int branchUpCnt = this.sqlSession.update(
				"com.group4.erp.dao.invenSearchDAO.getBranchUpCnt"
				,bookInfoDTO
				);
		
		return branchUpCnt;
	}
}

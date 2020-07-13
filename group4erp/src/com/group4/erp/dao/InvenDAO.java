package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.*;



public interface InvenDAO {
	
	int getBookListCnt(InvenSearchDTO invenSearchDTO);
	
	List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO);
	
	int getReleaseListCnt(InvenSearchDTO invenSearchDTO);
	
	int getReturnOrderCnt(ReturnSearchDTO returnSearchDTO);

	List<Map<String,String>> getReleaseList(InvenSearchDTO invenSearchDTO);

	Cus_releaseInfoDTO getReleaseCusInfo(int all_order_no);
	
	Cus_releaseInfoDTO getReleaseCorpInfo(int all_order_no);

	int getReturnOrderCnt();

	List<ReturnOrderDTO> getReturnOrderList(ReturnSearchDTO returnSearchDTO);


	int getSignUpCnt(InvenDTO invenDTO);
	
	BookInfoDTO getBookInfo(String isbn13_search);
	
	int getOrderCnt(String all_order_no);
	int getOrderCnts(String all_order_no);
	
	int getIsbnCnt(String all_order_no);
	int getIsbnCnts(String all_order_no);
	
	int getReleaseUpCnt(String all_order_no);
	int getReleaseUpCnts(String all_order_no);
	
	int getisbnCntUpdate(String all_order_no);
	int getisbnCntUpdates(String all_order_no);
	
	int getBookStockCnt(InvenDTO invenDTO);
	
	ReturnSalseContentDTO getReturnContent(int return_sales_no);
	
	int getBookInfoUpCnt(BookInfoDTO bookInfoDTO);
	int getBranchUpCnt(BookInfoDTO bookInfoDTO);
	
}
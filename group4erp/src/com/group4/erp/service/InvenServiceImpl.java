package com.group4.erp.service;

import com.group4.erp.BookInfoDTO;
import com.group4.erp.Cus_releaseInfoDTO;
import com.group4.erp.InvenDTO;
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.ReturnOrderDTO;
import com.group4.erp.ReturnSalseContentDTO;
import com.group4.erp.ReturnSearchDTO;
import com.group4.erp.dao.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InvenServiceImpl implements InvenService{

   @Autowired
   private InvenDAO invenDAO;
   
   
	
   public List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO) {

		List<Map<String,String>> getBookList = this.invenDAO.getBookList(invenSearchDTO);
		
		return getBookList;
		
	}
	
	public int getBookListCnt(InvenSearchDTO invenSearchDTO) {
		
		int bookListCnt = this.invenDAO.getBookListCnt(invenSearchDTO);
		
		return bookListCnt;
	}

	public int getReleaseListCnt(InvenSearchDTO invenSearchDTO) {
		
		int releaseListCnt = this.invenDAO.getReleaseListCnt(invenSearchDTO);
		
		return releaseListCnt;
	}
	
	public List<Map<String,String>> getReleaseList(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getReleaseList = this.invenDAO.getReleaseList(invenSearchDTO);
		
		return getReleaseList;
	}
	

	public Cus_releaseInfoDTO getReleaseCusInfo(int all_order_no) {

		Cus_releaseInfoDTO cus_order = this.invenDAO.getReleaseCusInfo(all_order_no);
		
		return cus_order;
	}
	
	public Cus_releaseInfoDTO getReleaseCorpInfo(int all_order_no) {

		Cus_releaseInfoDTO corp_order = this.invenDAO.getReleaseCorpInfo(all_order_no);
		
		return corp_order;
	}
	
	public int getReturnOrderCnt() {
		int returnOrderCnt = this.invenDAO.getReturnOrderCnt();
		
		return returnOrderCnt;
	}
	

	public int getReturnOrderCnt(ReturnSearchDTO returnSearchDTO) {
		int returnOrderCnt = this.invenDAO.getReturnOrderCnt(returnSearchDTO);
		return returnOrderCnt;
	}

	
	public List<ReturnOrderDTO> getReturnOrderList(ReturnSearchDTO returnSearchDTO) {
		List<ReturnOrderDTO> returnOrderList = this.invenDAO.getReturnOrderList(returnSearchDTO);
		
		return returnOrderList;

	}
	
	public int getSignUpCnt(InvenDTO invenDTO) {
		
		int insertSignUpBookCnt = this.invenDAO.getSignUpCnt(invenDTO);
		
		int insertBookStock = this.invenDAO.getBookStockCnt(invenDTO);
		if(insertBookStock==0) {
			return -2;
		}
		
		return insertSignUpBookCnt;
	}


	@Override
	public List<ReturnOrderDTO> getReturnOrderList() {
		// TODO Auto-generated method stub
		//List<ReturnOrderDTO> returnOrderList = this.invenDAO.getReturnOrderList();
		
		return null;
	}

	public BookInfoDTO getBookInfo(String isbn13_search) {
		
		BookInfoDTO bookInfo = this.invenDAO.getBookInfo(isbn13_search);
		
		return bookInfo;
		
	}
	
	public int getOrderCnt(String all_order_no) {
		
		int orderCnt = 0;
		
		String orderSize = all_order_no+"";
		
		if(orderSize.length()==10) {
			
			orderCnt = this.invenDAO.getOrderCnt(all_order_no);
			
		}else {
			
			orderCnt = this.invenDAO.getOrderCnts(all_order_no);
			
		}
		
		return orderCnt;
	}
	
	public int getIsbnCnt(String all_order_no) {
		
		int isbnCnt = 0;
		
		String orderSize = all_order_no+"";
		
		if(orderSize.length()==10) {
			
			isbnCnt = this.invenDAO.getIsbnCnt(all_order_no);
			
		}else { 
			
			isbnCnt = this.invenDAO.getIsbnCnts(all_order_no);
			
		}
		
		return isbnCnt;
	}
	
	public int getReleaseUpCnt(String all_order_no) {
		
		int releaseUpCnt = 0;
		
		String orderSize = all_order_no+"";
		

		if(orderSize.length()==10) {
			
			releaseUpCnt = this.invenDAO.getReleaseUpCnt(all_order_no);
			
			int isbnCntUpdate = this.invenDAO.getisbnCntUpdate(all_order_no);
			
		}else { 
			
			releaseUpCnt = this.invenDAO.getReleaseUpCnts(all_order_no);
			
			int isbnCntUpdate = this.invenDAO.getisbnCntUpdates(all_order_no);
		}
		
		
		return releaseUpCnt;
	}

	public ReturnSalseContentDTO getReturnContent(int return_sales_no) {
		
		ReturnSalseContentDTO returnInfo = this.invenDAO.getReturnContent(return_sales_no);
		
		return returnInfo;
	}
	
	public int getBookInfoUpCnt(BookInfoDTO bookInfoDTO) {
		
		int bookInfoUpCnt = this.invenDAO.getBookInfoUpCnt(bookInfoDTO);
		
		int branchUpCnt = this.invenDAO.getBranchUpCnt(bookInfoDTO);
		if(branchUpCnt==0) {
			return -2;
		}
		
		return bookInfoUpCnt;
	}
}

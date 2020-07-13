package com.group4.erp.service;

import com.group4.erp.WarehousingSearchDTO;
import com.group4.erp.dao.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WarehousingServiceImpl implements WarehousingService{

   @Autowired
   private WarehousingDAO warehousingDAO;
   
   
   public List<Map<String, String>> getBranch(WarehousingSearchDTO warehousingSearchDTO) {
		List<Map<String, String>> branch = this.warehousingDAO.getBranch(warehousingSearchDTO);
		return branch;
	}
   

	public List<Map<String, String>> getPublisher(WarehousingSearchDTO warehousingSearchDTO){
		
		List<Map<String, String>> publisher = this.warehousingDAO.getPublisher(warehousingSearchDTO);
		
		return publisher;
	}
	

   @Override
	public int getWarehousingListCnt(WarehousingSearchDTO warehousingSearchDTO) {
	   int warehousingListCnt = this.warehousingDAO.getWarehousingListCnt(warehousingSearchDTO);
		
		return warehousingListCnt;
	}

	@Override
	public List<Map<String, String>> getWarehousingList(WarehousingSearchDTO warehousingSearchDTO) {
		List<Map<String,String>> warehousingList = this.warehousingDAO.getWarehousingList(warehousingSearchDTO);
		
		return warehousingList;
	}


	@Override
	public WarehousingSearchDTO warehousingProc(String order_inven_no) {
		WarehousingSearchDTO warehContent = this.warehousingDAO.warehousingProc(order_inven_no); 
		return warehContent;
	}


	@Override
	public int warehousingConfirm(int wh_no) {
		int whStockCnt = this.warehousingDAO.warehousingStock(wh_no);
		int whConfirmCnt = this.warehousingDAO.warehousingConfirm(wh_no);
		return whConfirmCnt;
	}
	
	
	
	
	
	
	


	

}

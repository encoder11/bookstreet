package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.*;



public interface WarehousingDAO {
	
	List<Map<String, String>> getBranch(WarehousingSearchDTO warehousingSearchDTO);

	List<Map<String, String>> getPublisher(WarehousingSearchDTO warehousingSearchDTO);
	
	int getWarehousingListCnt(WarehousingSearchDTO warehousingSearchDTO);
	
	List<Map<String, String>> getWarehousingList(WarehousingSearchDTO warehousingSearchDTO);
	
	WarehousingSearchDTO warehousingProc(String order_inven_no);
	
	int warehousingStock(int wh_no);
	int warehousingConfirm(int wh_no);


}
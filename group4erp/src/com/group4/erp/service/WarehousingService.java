package com.group4.erp.service;
import com.group4.erp.WarehousingSearchDTO;

import java.util.*;

public interface WarehousingService {
	
	List<Map<String, String>> getBranch(WarehousingSearchDTO warehousingSearchDTO);

	List<Map<String, String>> getPublisher(WarehousingSearchDTO warehousingSearchDTO);
	
	int getWarehousingListCnt(WarehousingSearchDTO warehousingSearchDTO);
	
	List<Map<String, String>> getWarehousingList(WarehousingSearchDTO warehousingSearchDTO);
	
	WarehousingSearchDTO warehousingProc(String order_inven_no);
	
	int warehousingConfirm(int wh_no);


}

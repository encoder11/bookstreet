package com.group4.erp.dao;

import java.util.List;

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TranSpecDTO;
import com.group4.erp.TranSpecSearchDTO;

public interface AccountDAO {
	
	int getCorpListCnt(CorpSearchDTO corpSearchDTO);
	
	List<CorporationDTO> getCorpList(CorpSearchDTO corpSearchDTO);
	
	CorporationDTO selectCorp(String corp_no);
	
	int insertCorp(CorporationDTO corporationDTO);
	
	CorporationDTO getCorpInfo(String corp_no);
	
	int getCorpOrderCnt(CorpSearchDTO corpSearchDTO);
	
	List<CorpOrderDTO> getCorpOrderList(CorpSearchDTO corpSearchDTO);
	
	int getTranSpecCnt(int order_no);
	
	TranSpecDTO getTranSpecList(int order_no);
	
	int deleteCorp(String[] corp_no);
	
	int saveTempTranSpec(TranSpecDTO tranSpecDTO);
	
	List<TranSpecDTO> getTranSpecIssueList(TranSpecSearchDTO tranSpecSearchDTO);
	
	int payCheckProc();
	
	List<CorporationDTO> getBusiness_area();
	
	int updateCorpInfo(CorporationDTO corpDTO);
	
	int getTranSpecIssueCnt(TranSpecSearchDTO tranSpecSearchDTO);
	
	int searchCorpCnt(String corp_no);

}

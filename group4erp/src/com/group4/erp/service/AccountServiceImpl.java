package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TranSpecDTO;
import com.group4.erp.TranSpecSearchDTO;
import com.group4.erp.dao.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	AccountDAO accountDAO;

	@Override
	public int getCorpListCnt(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		int corpListCnt = this.accountDAO.getCorpListCnt(corpSearchDTO);
		
		return corpListCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		List<CorporationDTO> corpList = this.accountDAO.getCorpList(corpSearchDTO);
		
		return corpList;
	}

	@Override
	public int insertCorp(CorporationDTO corporationDTO) {
		// TODO Auto-generated method stub.
		
		int insertCorpCnt = this.accountDAO.insertCorp(corporationDTO);
		
		return insertCorpCnt;
	}

	@Override
	public CorporationDTO getCorpInfo(String corp_no) {
		// TODO Auto-generated method stub
		CorporationDTO selectedCorp = this.accountDAO.getCorpInfo(corp_no);
		
		return selectedCorp;
	}

	@Override
	public int getCorpOrderCnt(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		int corp_order_cnt = this.accountDAO.getCorpOrderCnt(corpSearchDTO);
		
		return corp_order_cnt;
	}

	@Override
	public List<CorpOrderDTO> getCorpOrderList(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		List<CorpOrderDTO> corp_order_list = this.accountDAO.getCorpOrderList(corpSearchDTO);
		
		return corp_order_list;
	}

	@Override
	public CorporationDTO selectCorp(String corp_no) {
		// TODO Auto-generated method stub
		CorporationDTO selectedCorp = this.accountDAO.selectCorp(corp_no);
		
		return selectedCorp;
	}

	@Override
	public int getTranSpecCnt(int order_no) {
		// TODO Auto-generated method stub
		int tranSpecCnt = this.accountDAO.getTranSpecCnt(order_no); 
		
		return tranSpecCnt;
	}

	@Override
	public TranSpecDTO getTranSpecList(int order_no) {
		// TODO Auto-generated method stub
		TranSpecDTO tranSpecList = this.accountDAO.getTranSpecList(order_no);
		
		return tranSpecList;
	}

	@Override
	public int deleteCorp(String[] corp_no) {
		// TODO Auto-generated method stub
		int delCnt = this.accountDAO.deleteCorp(corp_no);
		
		return delCnt;
	}

	@Override
	public int saveTempTranSpec(TranSpecDTO tranSpecDTO) {
		// TODO Auto-generated method stub
		int saveTempCnt = this.accountDAO.saveTempTranSpec(tranSpecDTO);
		
		return saveTempCnt;
	}

	@Override
	public List<TranSpecDTO> getTranSpecIssueList(TranSpecSearchDTO tranSpecSearchDTO) {
		// TODO Auto-generated method stub
		List<TranSpecDTO> tranSpecIssueList = this.accountDAO.getTranSpecIssueList(tranSpecSearchDTO);
		
		return tranSpecIssueList;
	}

	@Override
	public int payCheckProc() {
		// TODO Auto-generated method stub
		int payCheckCnt = this.accountDAO.payCheckProc();
		
		return payCheckCnt;
	}
	
	@Override
	public List<CorporationDTO> getBusiness_area() {
		// TODO Auto-generated method stub
		List<CorporationDTO> business_area = this.accountDAO.getBusiness_area();
		
		return business_area;
	}

	@Override
	public int updateCorpInfo(CorporationDTO corpDTO) {
		// TODO Auto-generated method stub
		int updateCorpCnt = this.accountDAO.updateCorpInfo(corpDTO);
		
		return updateCorpCnt;
	}

	@Override
	public int getTranSpecIssueCnt(TranSpecSearchDTO tranSpecSearchDTO) {
		// TODO Auto-generated method stub
		int tranSpecIssueCnt = this.accountDAO.getTranSpecIssueCnt(tranSpecSearchDTO);
		
		return tranSpecIssueCnt;
	}

	@Override
	public int searchCorpCnt(String corp_no) {
		// TODO Auto-generated method stub
		int corpSearchCnt = this.accountDAO.searchCorpCnt(corp_no);
		
		return corpSearchCnt;
	}
}

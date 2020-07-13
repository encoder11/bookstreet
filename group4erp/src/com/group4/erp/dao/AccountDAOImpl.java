package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorpSearchDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.SalaryDTO;
import com.group4.erp.TranSpecDTO;
import com.group4.erp.TranSpecSearchDTO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.AccountDAO.";

	@Override
	public int getCorpListCnt(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		
		int corpListCnt = this.sqlSession.selectOne(mapper_namespace+"getCorpListCnt", corpSearchDTO);
		
		return corpListCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		
		List<CorporationDTO> corpList = this.sqlSession.selectList(mapper_namespace+"getCorpList", corpSearchDTO);
		
		return corpList;
	}
	
	public int insertCorp(CorporationDTO corporationDTO) {
		
		int insertCorpCnt = this.sqlSession.insert(mapper_namespace+"insertCorp", corporationDTO);
		
		return insertCorpCnt;
	}

	@Override
	public CorporationDTO getCorpInfo(String corp_no) {
		
		CorporationDTO selectedCorp = this.sqlSession.selectOne(mapper_namespace+"getCorpInfo", corp_no);
		// TODO Auto-generated method stub
		return selectedCorp;
	}

	@Override
	public int getCorpOrderCnt(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		int corp_order_cnt = this.sqlSession.selectOne(mapper_namespace+"getCorpOrderCnt", corpSearchDTO);
		
		return corp_order_cnt;
	}

	@Override
	public List<CorpOrderDTO> getCorpOrderList(CorpSearchDTO corpSearchDTO) {
		// TODO Auto-generated method stub
		List<CorpOrderDTO> corp_order_list = this.sqlSession.selectList(mapper_namespace+"getCorpOrderList", corpSearchDTO);
		
		return corp_order_list;
	}

	@Override
	public CorporationDTO selectCorp(String corp_no) {
		// TODO Auto-generated method stub
		CorporationDTO selectedCorp = this.sqlSession.selectOne(mapper_namespace+"getCorpInfo", corp_no);
		
		return selectedCorp;
	}

	@Override
	public int getTranSpecCnt(int order_no) {
		// TODO Auto-generated method stub
		int tranSpecCnt = this.sqlSession.selectOne(mapper_namespace+"getTranSpecCnt", order_no);
		
		return tranSpecCnt;
	}

	@Override
	public TranSpecDTO getTranSpecList(int order_no) {
		// TODO Auto-generated method stub
		TranSpecDTO tranSpecList = this.sqlSession.selectOne(mapper_namespace+"getTranSpecList", order_no);
		
		return tranSpecList;
	}

	@Override
	public int deleteCorp(String[] corp_no) {
		// TODO Auto-generated method stub
		int delCnt = this.sqlSession.update(mapper_namespace+"deleteCorp", corp_no);
				
		return delCnt;
	}

	@Override
	public int saveTempTranSpec(TranSpecDTO tranSpecDTO) {
		// TODO Auto-generated method stub
		int saveTempCnt = this.sqlSession.insert(mapper_namespace+"saveTempTranSpec", tranSpecDTO);
		
		return saveTempCnt;
	}

	@Override
	public List<TranSpecDTO> getTranSpecIssueList(TranSpecSearchDTO tranSpecSearchDTO) {
		// TODO Auto-generated method stub
		List<TranSpecDTO> tranSpecIssueList = this.sqlSession.selectList(mapper_namespace+"getTranSpecIssue", tranSpecSearchDTO);
		
		return tranSpecIssueList;
	}

	@Override
	public int payCheckProc() {
		// TODO Auto-generated method stub
		int payCheckCnt = this.sqlSession.insert(mapper_namespace+"payCheckProc");
		
		return payCheckCnt;
	}

	@Override
	public List<CorporationDTO> getBusiness_area() {
		// TODO Auto-generated method stub
		List<CorporationDTO> business_area = this.sqlSession.selectList(mapper_namespace+"getBusiness_area");
		
		return business_area;
	}

	@Override
	public int updateCorpInfo(CorporationDTO corpDTO) {
		// TODO Auto-generated method stub
		int updateCorpCnt = this.sqlSession.update(mapper_namespace+"updateCorpInfo", corpDTO);
		
		return updateCorpCnt;
	}

	@Override
	public int getTranSpecIssueCnt(TranSpecSearchDTO tranSpecSearchDTO) {
		// TODO Auto-generated method stub
		int tranSpectIssueCnt = this.sqlSession.selectOne(mapper_namespace+"getTranSpecIssueCnt", tranSpecSearchDTO);
		
		return tranSpectIssueCnt;
	}

	@Override
	public int searchCorpCnt(String corp_no) {
		// TODO Auto-generated method stub
		int corpSearchCnt = this.sqlSession.selectOne(mapper_namespace+"getSearchCorpCnt", corp_no);
		
		return corpSearchCnt;
	}

}

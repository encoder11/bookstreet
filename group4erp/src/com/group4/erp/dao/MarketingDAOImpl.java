package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;
import com.group4.erp.OrderDTO;
import com.group4.erp.SalesInfoDTO;

@Repository
public class MarketingDAOImpl implements MarketingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.MarketingDAO.";

	@Override
	public int getEventCnt(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.sqlSession.selectOne(mapper_namespace+"getEventCnt", eventSearchDTO);
		
		return eventCnt;
	}

	@Override
	public List<EventDTO> getEventList(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		List<EventDTO> eventList = this.sqlSession.selectList(mapper_namespace+"getEventList", eventSearchDTO);
		
		return eventList;
	}

	@Override
	public int getAdApplyCnt() {
		// TODO Auto-generated method stub
		int ad_apply_cnt = this.sqlSession.selectOne(mapper_namespace+"getAdApplyCnt");
		
		return ad_apply_cnt;
	}

	@Override
	public List<AdApplyDTO> getAdApplyList() {
		// TODO Auto-generated method stub
		List<AdApplyDTO> ad_apply_list = this.sqlSession.selectList(mapper_namespace+"getAdApplyList");
		
		return ad_apply_list;
	}

	@Override
	public int insertEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.sqlSession.insert(mapper_namespace+"insertEvent", eventDTO);
		
		return eventCnt;
	}

	@Override
	public int getEventAllCnt(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		int eventAllCnt = this.sqlSession.selectOne(mapper_namespace+"getEventAllCnt", eventSearchDTO);
		
		return eventAllCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList() {
		// TODO Auto-generated method stub
		List<CorporationDTO> corpList = this.sqlSession.selectList(mapper_namespace+"getCorpList");
		
		return corpList;
	}

	@Override
	public int insertAd(AdApplyDTO adApplyDTO) {
		// TODO Auto-generated method stub
		int insertAdCnt = this.sqlSession.insert(mapper_namespace+"insertAd", adApplyDTO);
		
		return insertAdCnt;
	}

	@Override
	public int getOnlineOrderCnt(SalesInfoDTO salesSearchDTO) {
		// TODO Auto-generated method stub
		int online_order_cnt = this.sqlSession.selectOne(mapper_namespace+"getOnlineOrderCnt", salesSearchDTO);
		
		return online_order_cnt;
	}

	@Override
	public int deleteEvnt(String[] evnt_no) {
		// TODO Auto-generated method stub
		int deleteEvntCnt = this.sqlSession.delete(mapper_namespace+"deleteEvnt", evnt_no);
		
		return deleteEvntCnt;
	}

	@Override
	public int updateEvntState() {
		// TODO Auto-generated method stub
		int updateEvntCnt = this.sqlSession.update(mapper_namespace+"updateEvntState");
		
		return updateEvntCnt;
	}

	@Override
	public List<OrderDTO> getOnlineOrderList(SalesInfoDTO salesSearchDTO) {
		// TODO Auto-generated method stub
		List<OrderDTO> onlineOrderList = this.sqlSession.selectList(mapper_namespace+"getOnlineOrderList", salesSearchDTO);
		
		return onlineOrderList;
	}

	@Override
	public int getTotRevenue() {
		// TODO Auto-generated method stub
		int tot_revenue = this.sqlSession.selectOne(mapper_namespace+"getTotRevenue");
		
		return tot_revenue;
	}

	@Override
	public int getCorpOrderTotCnt() {
		// TODO Auto-generated method stub
		int corpOrderTotCnt = this.sqlSession.selectOne(mapper_namespace+"getCorpOrderTotCnt");
		
		return corpOrderTotCnt;
	}

	@Override
	public int getCorpTotRevenue() {
		// TODO Auto-generated method stub
		int corpTotRevenue = this.sqlSession.selectOne(mapper_namespace+"getCorpTotRevenue");
		
		return corpTotRevenue;
	}

	@Override
	public List<SalesInfoDTO> getOrderInfoChart() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> orderInfo = this.sqlSession.selectList(mapper_namespace+"getOrderInfoChart");
		
		return orderInfo;
	}

	@Override
	public int updateEventInfo(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		System.out.println("DAO updateEventInfo() 메소드 실행");
		int updateEventCnt = this.sqlSession.update(mapper_namespace+"updateEventInfo", eventDTO);
		
		return updateEventCnt;
	}

	@Override
	public int updateAdInfoProc(AdApplyDTO adApplyDTO) {
		// TODO Auto-generated method stub
		int updateCnt = this.sqlSession.update(mapper_namespace+"updateAdInfo", adApplyDTO);
		
		return updateCnt;
	}

	@Override
	public List<CorpOrderDTO> getCorpOrderCntChart() {
		// TODO Auto-generated method stub
		List<CorpOrderDTO> corpOrderCntList = this.sqlSession.selectList(mapper_namespace+"getCorpOrderCntChart");
		
		return corpOrderCntList;
	}

	@Override
	public List<SalesInfoDTO> getDailyOrderCnt() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> dailyOrderCnt = this.sqlSession.selectList(mapper_namespace+"getDailyOrderCntChart");
		
		return dailyOrderCnt;
	}

	@Override
	public List<SalesInfoDTO> getDailyCorpOrderCnt() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> dailyCorpOrderCnt = this.sqlSession.selectList(mapper_namespace+"getDailyCorpOrderCntChart");
		
		return dailyCorpOrderCnt;
	}

	@Override
	public EventDTO getMyEventInfoApproval(String document_no) {
		// TODO Auto-generated method stub
		EventDTO myEventInfo = this.sqlSession.selectOne(mapper_namespace+"getMyEventInfoApproval", document_no);
		
		return myEventInfo;
	}

	@Override
	public int updateEvntApprovalState(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		int eventAppovalState = this.sqlSession.update(mapper_namespace+"updateEvntApprovalState", eventDTO);
		
		return eventAppovalState;
	}

	@Override
	public List<SalesInfoDTO> getDailyOfflineSalesChart() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> dailyOfflineSalesChart = this.sqlSession.selectList(mapper_namespace+"getDailyOfflineSalesChart");
		
		return dailyOfflineSalesChart;
	}

	@Override
	public int updateEventReApproval(String document_no) {
		// TODO Auto-generated method stub
		int myEventReApproval = this.sqlSession.update(mapper_namespace+"updateEventReApproval", document_no);
		
		return myEventReApproval;
	}

	@Override
	public SalesInfoDTO getDailyOfflineSalesTotCnt() {
		// TODO Auto-generated method stub
		SalesInfoDTO dailyOfflineSalesTotCnt = this.sqlSession.selectOne(mapper_namespace+"getDailyOfflineSalesTotCnt");
		
		return dailyOfflineSalesTotCnt;
	}

	@Override
	public int getEventNumForApproval() {
		// TODO Auto-generated method stub
		int eventNumForApproval = this.sqlSession.selectOne(mapper_namespace+"getEventNumForApproval");
		
		return eventNumForApproval;
	}

}

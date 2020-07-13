package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.AdApplyDTO;
import com.group4.erp.CorpOrderDTO;
import com.group4.erp.CorporationDTO;
import com.group4.erp.EventDTO;
import com.group4.erp.EventSearchDTO;
import com.group4.erp.OrderDTO;
import com.group4.erp.SalesInfoDTO;
import com.group4.erp.dao.MarketingDAO;

@Service
public class MarketingServiceImpl implements MarketingService {
	
	@Autowired
	MarketingDAO marketingDAO;

	@Override
	public int getEventCnt(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.marketingDAO.getEventCnt(eventSearchDTO);
		
		return eventCnt;
	}

	@Override
	public List<EventDTO> getEventList(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		List<EventDTO> eventList = this.marketingDAO.getEventList(eventSearchDTO);
		
		return eventList;
	}

	@Override
	public int getAdApplyCnt() {
		// TODO Auto-generated method stub
		int ad_apply_cnt = this.marketingDAO.getAdApplyCnt();
		
		return ad_apply_cnt;
	}

	@Override
	public List<AdApplyDTO> getAdApplyList() {
		// TODO Auto-generated method stub
		List<AdApplyDTO> ad_apply_list = this.marketingDAO.getAdApplyList();
		
		return ad_apply_list;
	}

	@Override
	public int insertEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		int eventCnt = this.marketingDAO.insertEvent(eventDTO);
		
		return eventCnt;
	}

	@Override
	public int getEventAllCnt(EventSearchDTO eventSearchDTO) {
		// TODO Auto-generated method stub
		int eventAllCnt = this.marketingDAO.getEventAllCnt(eventSearchDTO);
		
		return eventAllCnt;
	}

	@Override
	public List<CorporationDTO> getCorpList() {
		// TODO Auto-generated method stub
		List<CorporationDTO> corpList = this.marketingDAO.getCorpList();
		
		return corpList;
	}

	@Override
	public int insertAd(AdApplyDTO adApplyDTO) {
		// TODO Auto-generated method stub
		int insertAdCnt = this.marketingDAO.insertAd(adApplyDTO);
		
		return insertAdCnt;
	}

	@Override
	public int getOnlineOrderCnt(SalesInfoDTO salesSearchDTO) {
		// TODO Auto-generated method stub
		int online_order_cnt = this.marketingDAO.getOnlineOrderCnt(salesSearchDTO);
		
		return online_order_cnt;
	}

	@Override
	public int deleteEvnt(String[] evnt_no) {
		// TODO Auto-generated method stub
		int deleteEvntCnt = this.marketingDAO.deleteEvnt(evnt_no);
		
		return deleteEvntCnt;
	}

	@Override
	public int updateEvntState() {
		// TODO Auto-generated method stub
		int updateEvntCnt = this.marketingDAO.updateEvntState();
		
		return updateEvntCnt;
	}

	@Override
	public List<OrderDTO> getOnlineOrderList(SalesInfoDTO salesSearchDTO) {
		// TODO Auto-generated method stub
		List<OrderDTO> onlineOrderList = this.marketingDAO.getOnlineOrderList(salesSearchDTO);
		
		return onlineOrderList;
	}

	@Override
	public int getTotRevenue() {
		// TODO Auto-generated method stub
		int tot_revenue = this.marketingDAO.getTotRevenue();
		
		return tot_revenue;
	}
	
	@Override
	public int getCorpOrderTotCnt() {
		// TODO Auto-generated method stub
		int corpOrderTotCnt = this.marketingDAO.getCorpOrderTotCnt();
		
		return corpOrderTotCnt;
	}

	@Override
	public int getCorpTotRevenue() {
		// TODO Auto-generated method stub
		int corpTotRevenue = this.marketingDAO.getCorpTotRevenue();
		
		return corpTotRevenue;
	}

	@Override
	public List<SalesInfoDTO> getOrderInfoChart() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> orderInfo = this.marketingDAO.getOrderInfoChart();
		
		return orderInfo;
	}

	@Override
	public int updateEventInfo(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		int updateEventCnt = this.marketingDAO.updateEventInfo(eventDTO);
		
		return updateEventCnt;
	}

	@Override
	public int updateAdInfoProc(AdApplyDTO adApplyDTO) {
		// TODO Auto-generated method stub
		int updateCnt = this.marketingDAO.updateAdInfoProc(adApplyDTO);
		
		return updateCnt;
	}

	@Override
	public List<CorpOrderDTO> getCorpOrderCntChart() {
		// TODO Auto-generated method stub
		List<CorpOrderDTO> corpOrderCntList = this.marketingDAO.getCorpOrderCntChart();
		
		return corpOrderCntList;
	}

	@Override
	public List<SalesInfoDTO> getDailyOrderCnt() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> dailyOrderCnt = this.marketingDAO.getDailyOrderCnt();
		
		return dailyOrderCnt;
	}

	@Override
	public List<SalesInfoDTO> getDailyCorpOrderCnt() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> dailyCorpOrderCnt = this.marketingDAO.getDailyCorpOrderCnt();
		
		return dailyCorpOrderCnt;
	}

	@Override
	public EventDTO getMyEventInfoApproval(String document_no) {
		// TODO Auto-generated method stub
		EventDTO myEventInfo = this.marketingDAO.getMyEventInfoApproval(document_no);
		
		return myEventInfo;
	}

	@Override
	public int updateEvntApprovalState(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		int eventApprovalState = this.marketingDAO.updateEvntApprovalState(eventDTO);
		
		return eventApprovalState;
	}

	@Override
	public List<SalesInfoDTO> getDailyOfflineSalesChart() {
		// TODO Auto-generated method stub
		List<SalesInfoDTO> dailyOfflineSalesChart = this.marketingDAO.getDailyOfflineSalesChart();
		
		return dailyOfflineSalesChart;
	}

	@Override
	public int updateEventReApproval(String document_no) {
		// TODO Auto-generated method stub
		int myEventReApproval = this.marketingDAO.updateEventReApproval(document_no);
		
		return myEventReApproval;
	}

	@Override
	public SalesInfoDTO getDailyOfflineSalesTotCnt() {
		// TODO Auto-generated method stub
		SalesInfoDTO dailyOfflineSalesTotCnt = this.marketingDAO.getDailyOfflineSalesTotCnt();
		
		return dailyOfflineSalesTotCnt;
	}

	@Override
	public int getEventNumForApproval() {
		// TODO Auto-generated method stub
		int eventNumForApproval = this.marketingDAO.getEventNumForApproval();
		
		return eventNumForApproval;
	}

}

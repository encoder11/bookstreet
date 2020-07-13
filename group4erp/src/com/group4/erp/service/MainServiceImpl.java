package com.group4.erp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.CommonChartDTO;
import com.group4.erp.MainChartsDTO;
import com.group4.erp.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainDAO mainDAO;

	@Override
	public MainChartsDTO getMainCharts() {
		MainChartsDTO mainChartsDTO = new MainChartsDTO();
		mainChartsDTO.setSellingStat(mainDAO.getSellingStat());
		mainChartsDTO.setAgeStat(mainDAO.getAgeStat());
		mainChartsDTO.setEventStat(mainDAO.getEventStat());
		mainChartsDTO.setGenderStat(mainDAO.getGenderStat());
		return mainChartsDTO;
	}

	@Override
	public List<Map<String, String>> getMonthEvnt() {
		List<Map<String, String>> monthEvnt = mainDAO.getMonthEvnt();
		return monthEvnt;
	}

	@Override
	public CommonChartDTO getOrderStat() {
		CommonChartDTO orderStat = mainDAO.getOrderStat();
		return orderStat;
	}

	@Override
	public CommonChartDTO getReturnStat() {
		CommonChartDTO returnStat = mainDAO.getReturnStat();
		return returnStat;
	}
	
	
	
	

}

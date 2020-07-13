package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.CommonChartDTO;
import com.group4.erp.WarehousingSearchDTO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CommonChartDTO> getSellingStat() {
		System.out.println(this.sqlSession.selectList("com.group4.erp.dao.MainDAO.selectSellingStat"));
		return this.sqlSession.selectList("com.group4.erp.dao.MainDAO.selectSellingStat");
	}

	@Override
	public List<CommonChartDTO> getAgeStat() {
		return this.sqlSession.selectList("com.group4.erp.dao.MainDAO.selectAgeStat");
	}

	@Override
	public List<CommonChartDTO> getEventStat() {
		return this.sqlSession.selectList("com.group4.erp.dao.MainDAO.selectEventStat");
	}

	@Override
	public List<CommonChartDTO> getGenderStat() {
		return this.sqlSession.selectList("com.group4.erp.dao.MainDAO.selectGenderStat");
	}

	@Override
	public List<Map<String, String>> getMonthEvnt() {
		List<Map<String, String>> monthEvnt = this.sqlSession.selectList("com.group4.erp.dao.MainDAO.selectMonthEvnt");
		return monthEvnt;
	}

	@Override
	public CommonChartDTO getOrderStat() {
		return this.sqlSession.selectOne("com.group4.erp.dao.MainDAO.selectOrder");
	}

	@Override
	public CommonChartDTO getReturnStat() {
		return this.sqlSession.selectOne("com.group4.erp.dao.MainDAO.selectReturn");
	}
	
	@Override
	public List<Map<String, String>> getBestSellers(){
      List<Map<String, String>> bestSellers = this.sqlSession.selectList(
            "com.group4.erp.dao.MainDAO.getBestSellers"
            );
      return bestSellers;
   }
	
	
	

}

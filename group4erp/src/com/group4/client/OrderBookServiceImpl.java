package com.group4.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderBookServiceImpl implements OrderBookService{

	@Autowired
	OrderBookDAO orderbookDAO;
	
	public int getBookCnt(BookOrderInsertDTO boinsertDTO) {
		
		int bookCnt = this.orderbookDAO.getBookCnt(boinsertDTO);
		
		return bookCnt;
	}
	

	public int getInsertOrderCnt(BookOrderInsertDTO boinsertDTO) {
		
		int insertOrder = this.orderbookDAO.getInsertOrderCnt(boinsertDTO);
		
		return insertOrder;
	}

	public int getInMemberCnt(BookOrderInsertDTO boinsertDTO) {
		
		int insertNoMember = this.orderbookDAO.getInMemberCnt(boinsertDTO);
		
		return insertNoMember;
	}
	
	public int getInsertOrderNoCnt(BookOrderInsertDTO boinsertDTO) {
		
		int insertOrderNo = this.orderbookDAO.getInsertOrderNoCnt(boinsertDTO);
		
		return insertOrderNo;
	}
	
	public int getInsertOrderCorpCnt(BookOrderInsertDTO boinsertDTO) {
		
		int insertOrderCorp = this.orderbookDAO.getInsertOrderCorpCnt(boinsertDTO);
		
		int insertRelease = this.orderbookDAO.getInsertReleaseCorp(boinsertDTO);
		if(insertRelease==0) {
			return -5;
		}
		
		return insertOrderCorp;
	}
}

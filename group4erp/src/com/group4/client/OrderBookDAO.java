package com.group4.client;

public interface OrderBookDAO {
	
	int getBookCnt(BookOrderInsertDTO boinsertDTO);
	
	int getInsertOrderCnt(BookOrderInsertDTO boinsertDTO);
	
	int getInMemberCnt(BookOrderInsertDTO boinsertDTO);
	
	int getInsertOrderNoCnt(BookOrderInsertDTO boinsertDTO);
	
	int getInsertOrderCorpCnt(BookOrderInsertDTO boinsertDTO);
	
	int getInsertReleaseCorp(BookOrderInsertDTO boinsertDTO);
}

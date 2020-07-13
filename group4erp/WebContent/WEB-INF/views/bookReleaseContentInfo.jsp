<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

	function goBack(){
		history.go(-1);
	}
	
	function goUpdateRelease(){
		alert("수정기능 구현중");
	}
	
	function goDeleteRelease(){
		alert("삭제기능 구현중");
	}

</script>

</head>
<body>
<cneter>

	<b>[출고 상세 정보]</b><br>
	<table border=0 width=700>
	 	<tr>
	 	<td align=right>
			<a href="javascript:goBack();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[닫기]</a>
	</table>
	<form name="bookReleaseContentform" method="post" action="/group4erp/joinProc.do">
		<c:if test="${not empty cus_order.all_order_num}">
		<table class="tbcss1" width="600" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>책번호
				<td colspan=2>${cus_order.isbn13}
				<th>고객ID
				<td colspan=2>${cus_order.cus_id}
			<tr>
				<th>책이름
				<td colspan=5>${cus_order.book_name}
			<tr>
				<th>고객 배송지
				<td colspan=5>${cus_order.order_delivery_addr}
			<tr>
				<th>주문일시
				<td>${cus_order.order_dt}요일
				<th>주문 수량
				<td>${cus_order.book_qty}권
				<th>출판사
				<td>${cus_order.publisher}
			<tr>
				<th>책가격
				<td>${cus_order.book_price}원
				<th>총 가격
				<td>${cus_order.all_book_price}원
				<th>담당직원
				<td>${cus_order.emp_name}
		</table>
		</c:if>
		<c:if test="${not empty corp_order.all_order_num}">
			<c:if test="${empty corp_order.branch_name}">
				<table class="tbcss1" width="600" border=1 bordercolor="#000000" cellpadding=5 align=center>
					<tr>
						<th>책번호
						<td colspan=2>${corp_order.isbn13}
						<th>사업자ID
						<td colspan=2>${corp_order.cus_id}
					<tr>
						<th>책이름
						<td colspan=5>${corp_order.book_name}
					<tr>
						<th>사업자 배송지
						<td colspan=5>${corp_order.order_delivery_addr}
					<tr>
						<th>회사명
						<td>${corp_order.corp_name}
						<th>분야
						<td>${corp_order.corp_area}
						<th>대표자명
						<td>${corp_order.ceo_name}
					<tr>
						<th>주문일시
						<td>${corp_order.order_dt}요일
						<th>주문 수량
						<td>${corp_order.book_qty}권
						<th>출판사
						<td>${corp_order.publisher}
					<tr>
						<th>책가격
						<td>${corp_order.book_price}원
						<th>총 가격
						<td>${corp_order.all_book_price}원
						<th>담당직원
						<td>${corp_order.emp_name}
				</table>
			</c:if>
			<c:if test="${not empty corp_order.branch_name}">
				<table class="tbcss1" width="600" border=1 bordercolor="#000000" cellpadding=5 align=center>
					<tr>
						<th>책번호
						<td colspan=2>${corp_order.isbn13}
						<th>담당직원
						<td colspan=2>${corp_order.emp_name}
					<tr>
						<th>책이름
						<td colspan=5>${corp_order.book_name}
					<tr>
						<th>지사 위치
						<td colspan=5>${corp_order.branch_name}
					<tr>
						<th>주문일시
						<td>${corp_order.order_dt}요일
						<th>주문 수량
						<td>${corp_order.book_qty}권
						<th>출판사
						<td>${corp_order.publisher}
				</table>
			</c:if>
		</c:if>
		<br>
		<input type="button" value="  주문정보수정  " onclick="goUpdateRelease();">&nbsp;&nbsp;
		<input type="button" value="  주문 삭제  " onclick="goDeleteRelease();">&nbsp;&nbsp;
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

	function orderBook(){
		alert("주문 기능 구현중");
		//return;
		
		location.href="/group4erp/goOrderBookList.do"
	}

	function returnBook(){
		alert("반품 기능 구현중");
		//return;

		location.href="/group4erp/goReturnLogin.do"
	}
	
</script>

</head>
<body>
<center>
<br><br><br><br><br><br>

<input type="button" value="주문하기" onClick="orderBook();">&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="반품하기" onClick="returnBook();">&nbsp;

</center>
</body>
</html>
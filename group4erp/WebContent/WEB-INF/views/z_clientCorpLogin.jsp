<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

	function goOrderMain(){
		alert("사업자 로그인 기능 구현중");
		return;
		
		
		
	}

</script>

</head>
<body>
<center>
<br>
<b>사업자 로그인</b>
<br><br><br><br><br><br>
<form name="corpLoginForm" method="post" action="/group4erp/cusLoginProc.do">
	<table>
		<tr>
		<th>[사업자번호]
		<td><input type="text" name="cus_id" size="10">
		<tr>
		<th>[비밀번호]
		<td><input type="text" name="cus_pwd" size="10">
	</table>
	<input type="button" value="로그인" onclick="goOrderMain();">
</form>
</center>
</body>
</html></html>
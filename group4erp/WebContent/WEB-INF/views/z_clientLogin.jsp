<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

	function clientLogin(){
		location.href="/group4erp/goCusLogin.do"
	}
	function corporationLogin(){
		location.href="/group4erp/goCorpLogin.do"
	}

</script>

</head>
<body>
<center>
<br><br><br><br><br><br>
<input type="button" name="joinBtn" value="고객로그인" onClick="clientLogin();">&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="joinBtn" value="사업자로그인" onClick="corporationLogin();">&nbsp;

</center>
</body>
</html>
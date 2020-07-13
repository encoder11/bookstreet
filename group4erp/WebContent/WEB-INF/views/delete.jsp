<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>



</script>

</head>
<body>
<cneter>
<form name="delete_form" method="post" action="/group4erp/joinProc.do">
	<b>사원등록화면</b><br>
	<table class="tbcss1" cellpadding=5 cellspacing=0>
		<tr>
			<td>사원아이디</td><td><input type="text" name="emp_id" value="안녕하세요" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="text" name="emp_pwd" value="123" readonly></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="emp_addr"></td>
		</tr>	
	</table>
</form>

<input type="button" name="joinBtn" value="저장" onClick="checkLoginInfo();">&nbsp;

</body>
</html>
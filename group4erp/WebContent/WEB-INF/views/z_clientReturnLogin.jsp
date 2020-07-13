<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

$(document).ready(function(){	
	
	//$('.Main').hide();
	
	$('#memberPageY').hide();
	$('#memberPageN').hide();
	$('#corpMember').hide();
	
	
	
});

	function changeMemberY(){
		$('#memberPageN').hide();
		$('#corpMember').hide();
		$('#memberPageY').show();
		document.cusLoginFormN.reset();
		document.corpLoginForm.reset();
	}
	
	function changeMemberN(){
		$('#memberPageY').hide();
		$('#corpMember').hide();
		$('#memberPageN').show();
		document.cusLoginFormY.reset();
		document.corpLoginForm.reset();
	}

	function changeCorp(){
		$('#memberPageY').hide();
		$('#memberPageN').hide();
		$('#corpMember').show();
		document.cusLoginFormN.reset();
		document.cusLoginFormY.reset();
	}
	
	function goReturnMain(YNC){
		//alert("orderMain 구현중");
		//alert($('[name=cusLoginFormY]').serialize()+"checkMember="+YN);
		//return;
		
		
		if(YNC=='y'){
			$.ajax({
	            url : "/group4erp/ReturnMainLogin.do"
	            , type: "post"
	            , data : $('[name=cusLoginFormY]').serialize()+"&checkMember="+YN
	            , success : function(LoginCnt){
	                	if(LoginCnt==1){
		                      alert("회원 로그인 성공");
		                      location.replace("/group4erp/goOrderMain.do");
		                }
		                else{
		                      alert("서버쪽 DB 연동 실패. 관리자에게 문의");
		                }
	            } 

	            , error : function(){
	               alert("서버 접속 실패");
	            }
	         });
		}
		else if(YNC=='n'){
			
			if( is_empty('[name=cus_phone]') ){
				alert("휴대전화를 입력해주세요.");
				$("[name=cus_phone]").focus();
				return;
			}
			var phone = $('[name=cus_phone]').val();
		    
		    if(phone.indexOf('-')>0){
		       phone = phone.split('-').join('');
		       $('[name=cus_phone]').val(phone);
		    }
		   
		    if( is_valid_pattern("[name=cus_phone]", /^[0-9]{10,11}$/)==false ){
		       alert("전화번호 형식이 틀렸습니다. 다시 입력해주세요");
		       return;
		    }
			
			$.ajax({
	            url : "/group4erp/ReturnMainLogin.do"
	            , type: "post"
	            , data : $('[name=cusLoginFormN]').serialize()+"checkMember="+YN
	            , success : function(LoginCnt){
	                	if(LoginCnt == 1){
		                      alert("비회원 로그인 성공");
		                      location.replace("/group4erp/goOrderMain.do");
		                }
		                else{
		                      alert("서버쪽 DB 연동 실패. 관리자에게 문의");
		                }
	            } 

	            , error : function(){
	               alert("서버 접속 실패");
	            }
	         });
		}else if(YNC=='c'){
			alert("사업자");
			
			if( is_empty('[name=cus_phone]') ){
				alert("휴대전화를 입력해주세요.");
				$("[name=cus_phone]").focus();
				return;
			}
			if( is_valid_pattern("[name=cus_phone]", /^[0-9]{10,11}$/)==false ){
			       alert("전화번호 형식이 틀렸습니다. 다시 입력해주세요");
			       return;
			}
			$.ajax({
	            url : "/group4erp/ReturnMainLogin.do"
	            , type: "post"
	            , data : $('[name=cusLoginFormN]').serialize()+"checkMember="+YN
	            , success : function(LoginCnt){
	                	if(LoginCnt == 1){
		                      alert("비회원 로그인 성공");
		                      location.replace("/group4erp/goOrderMain.do");
		                }
		                else{
		                      alert("서버쪽 DB 연동 실패. 관리자에게 문의");
		                }
	            } 

	            , error : function(){
	               alert("서버 접속 실패");
	            }
	         });
		}
		
		
	}
	
	function goBack(){
		history.go(-1);
	}
	
</script>

</head>
<body>
<center>
<br>
<b>고객 로그인</b>
<br><br><br><br><br><br>
<table width=700>
	<tr>
	<td align=right>
		<a href="javascript:goBack();">[뒤로 가기]</a>
</table>

<table class="Main">
	<tr><td>
	<div id="memberPageY">
		<form name="cusLoginFormY" method="post" action="/group4erp/cusLoginProc.do">
			<table>
				<tr>
				<th>[아이디]
					<td><input type="text" name="cus_id" size="10">
				<tr>
				<th>[비밀번호]
					<td><input type="text" name="cus_pwd" size="10">
				<tr>
				<th>
				<td><input type="button" value="로그인" onclick="goReturnMain('y');">
			</table>
		</form>
	</div>
	<div id="memberPageN">
		<form name="cusLoginFormN" method="post" action="/group4erp/cusLoginProc.do">
			<table>
				<tr>
				<th>[핸드폰번호]
					<td><input type="text" name="cus_phone" size="10">
				<tr>
				<th>[비밀번호]
					<td><input type="text" name="cus_pwd" size="10">
				<tr>
				<th>
				<td><input type="button" value="로그인" onclick="goReturnMain('n');">
			</table>
		</form>
	</div>
	<div id="corpMember">
		<form name="corpLoginForm" method="post" action="/group4erp/cusLoginProc.do">
			<table>
				<tr>
				<th>[사업자번호]
				<td><input type="text" name="corp_no" size="20">
				<tr>
				<th>
				<td><input type="button" value="로그인" onclick="goReturnMain('c');">
			</table>
		</form>
	</div>
	<input type="button" value="회원" onclick="changeMemberY();">
	<input type="button" value="비회원" onclick="changeMemberN();">
	<input type="button" value="사업자" onclick="changeCorp();">
</table>
<input type="hidden" name="checkMember">
</center>
</body>
</html>
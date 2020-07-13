<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		$('.orderInfo tr:eq(1)').show();
		$('.orderInfo tr:eq(2)').show();
		$('.orderInfo tr:eq(6)').show();
		document.cusLoginFormN.reset();
		document.corpLoginForm.reset();
	}
	
	function changeMemberN(){
		$('#memberPageY').hide();
		$('#corpMember').hide();
		$('#memberPageN').show();
		$('.orderInfo tr:eq(1)').show();
		$('.orderInfo tr:eq(2)').show();
		$('.orderInfo tr:eq(6)').show();
		document.cusLoginFormY.reset();
		document.corpLoginForm.reset();
	}

	function changeCorp(){
		$('#memberPageY').hide();
		$('#memberPageN').hide();
		$('#corpMember').show();
		
		$('.orderInfo tr:eq(1)').hide();
		$('.orderInfo tr:eq(2)').hide();
		$('.orderInfo tr:eq(6)').hide();
		
		document.cusLoginFormN.reset();
		document.cusLoginFormY.reset();
	}
	
	function goOrderBook(){
		//alert("주문 기능 구현중");
		//return;
		
		var cus_id = $('[name=cus_id]').val();
		var cus_phone = $('[name=cus_phone]').val();
		var corp_no = $('[name=corp_no]').val();
		
		var addrStr = [];
		addrStr.push($('[name=destination]').val());
		addrStr.push($('[name=details_destination]').val());
		
		$('[name=delivery_addr]').val(addrStr.join(" "));
		
		if( cus_id.length >0 ){

			var memberStr = $('[name=cusLoginFormY]').serialize()+'&'+$('[name=insertOrder]').serialize()
			
			$.ajax({
	            url : "/group4erp/goOrderCus.do"
	            , type: "post"
	            , data : memberStr
	            , success : function(insertCnt){
	                	if(insertCnt==1){
		                      alert("회원 주문 성공");
		                      location.replace("/group4erp/goOrderBookList.do");
		                }else if(insertCnt==-1){
		                	alert("DB서버 오류");
		                }else if(insertCnt==-2){
		                	alert("남은 재고보다 주문량이 많습니다.");
		                }else if(insertCnt==-3){
		                	alert("아이디와 패스워드가 다릅니다");
		                }else if(insertCnt==-4){
		                	alert("재고 업데이트 실패");
		                }else if(insertCnt==-5){
		                	alert("출고 업데이트 실패");
		                }else if(insertCnt==-6){
		                	alert("입금 실패");
		                }
		                else{ alert("서버쪽 DB 연동 실패. 관리자에게 문의"); }
	            } 
	            , error : function(){ alert("서버 접속 실패"); }
	         });
			
		}else if( cus_phone.length >0 ){
			
			alert("비회원");
			
			var NomemberStr = $('[name=cusLoginFormN]').serialize()+'&'+$('[name=insertOrder]').serialize()
			alert(NomemberStr);
			//return;
			
			$.ajax({
	            url : "/group4erp/goOrderNoCus.do"
	            , type: "post"
	            , data : NomemberStr
	            , success : function(insertCnt){
	                	if(insertCnt==1){
		                      alert("비회원 주문 성공");
		                      location.replace("/group4erp/goOrderBookList.do");
		                }else if(insertCnt==-1){
		                	alert("DB서버 오류");
		                }else if(insertCnt==-2){
		                	alert("남은 재고보다 주문량이 많습니다.");
		                }else if(insertCnt==-3){
		                	alert("아이디와 패스워드가 다릅니다");
		                }else if(insertCnt==-4){
		                	alert("재고 업데이트 실패");
		                }else if(insertCnt==-5){
		                	alert("출고 업데이트 실패");
		                }else if(insertCnt==-6){
		                	alert("입금 실패");
		                }
		                else{ alert("서버쪽 DB 연동 실패. 관리자에게 문의"); }
	            } 
	            , error : function(){ alert("서버 접속 실패"); }
	         });
			
		}else if( corp_no.length >0 ){
			
			alert("사업자");
			
			var corpStr = $('[name=corpLoginForm]').serialize()+'&'+$('[name=insertOrder]').serialize()
			alert(corpStr);
			//return;
			
			$.ajax({
	            url : "/group4erp/goOrderCorp.do"
	            , type: "post"
	            , data : corpStr
	            , success : function(insertCnt){
	                	if(insertCnt==1){
		                      alert("사업자 주문 성공");
		                      location.replace("/group4erp/goOrderBookList.do");
		                }else if(insertCnt==-1){
		                	alert("DB서버 오류");
		                }else if(insertCnt==-2){
		                	alert("남은 재고보다 주문량이 많습니다.");
		                }else if(insertCnt==-3){
		                	alert("아이디와 패스워드가 다릅니다");
		                }else if(insertCnt==-4){
		                	alert("입금 실패");
		                }else if(insertCnt==-5){
		                	alert("출고 업데이트 실패");
		                }
		                else{ alert("서버쪽 DB 연동 실패. 관리자에게 문의"); }
	            } 
	            , error : function(){ alert("서버 접속 실패"); }
	         });
			
		}
	}
	
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
	
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
	
				document.getElementById("destination").value = addr;

			}
		}).open();
	}
	
	function goBack(){
		history.go(-1);
	}
	
</script>

</head>
<body>
<center>
<b>주문 상세보기</b>
<br>
<table width=700>
	<tr>
	<td align=right>
		<a href="javascript:goBack();">[뒤로 가기]</a>
</table>
<br><br><br>
<table>
	<tr>
	<th><th>
	<tr>
	<td>
	<form name="insertOrder" method="post" action="/group4erp/goOrderBook.do">
		<input type="hidden" name="isbn13" value="${isbn}">
		<br>
		<table class="orderInfo" border=0>
			<tr>
				<th>수량&nbsp;&nbsp;:&nbsp;&nbsp;
				<td><input type="text" name="book_qty" size="10">
	 		<tr>
				<th>이름&nbsp;&nbsp;:&nbsp;&nbsp;
	 			<td>
				<input type="text" name="cus_name" size="20">
			<tr>
				<th>배송주소&nbsp;&nbsp;:&nbsp;&nbsp;
				<td><input type="text" size="50" id="destination" name="destination" readOnly>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" size="50" name="details_destination">
					<input type="hidden" name="delivery_addr">
			<tr>
				<th>핸드폰&nbsp;&nbsp;:&nbsp;&nbsp;
				<td><input type="text" name="cus_phone_order" size="20">
			<tr>
				<th>일반전화&nbsp;&nbsp;:&nbsp;&nbsp;
				<td><input type="text" name="home_tel" size="20">
			<tr>
				<th>비밀번호&nbsp;&nbsp;:&nbsp;&nbsp;
				<td><input type="text" name="cus_pwd_order" size="20">
			<tr>
				<th>요구사항&nbsp;&nbsp;:&nbsp;&nbsp;
				<td><textarea name="cus_requirement" cols=55 rows=7></textarea>
		</table>
	</form>



	<td>
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
				</table>
			</form>
		</div>
		<div id="corpMember">
			<form name="corpLoginForm" method="post" action="/group4erp/cusLoginProc.do">
				<table>
					<tr>
					<th>[사업자번호]
					<td><input type="text" name="corp_no" size="20">
				</table>
			</form>
		</div>
		<input type="button" value="회원" onclick="changeMemberY();">
		<input type="button" value="비회원" onclick="changeMemberN();">
		<input type="button" value="사업자" onclick="changeCorp();">
	</table>


</table>
	<input type="button" value="주문하기" onclick="goOrderBook();">
</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고신청 페이지</title>
<script>

	$(document).ready(function() {
		showTime();
		$("[name=open_req_dt]").datepicker({
   		 	onSelect: function() { 
   	 		//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
   	    	 var dateObject = $(this).datepicker('getDate');
   	    	 //alert(dateObject.val()); 
   			}
		});
	});

	function reserveAd() {

		if(is_empty("[name = corp_no]")) {
			alert("광고를 신청한 업체 번호를 입력하세요.");
			$("[name = corp_no]").focus();

			return;
		}

		if(is_empty("[name = ad_title]")) {
			alert("광고 타이틀을 입력하세요.");
			$("[name = ad_title]").focus();

			return;
		}

		if(is_empty("[name = open_req_dt]")) {
			alert("노출 요청일을 입력하세요.");
			$("[name = open_req_dt]").focus();

			return;
		}

		if(is_empty("[name = open_req_area_cd]")) {
			alert("노출 요청 위치를 선택하세요.");
			$("[name = open_req_area_cd]").focus();

			return;
		}

		if(is_empty("[name = ad_pay_method]")) {
			alert("결제 수단을 선택하세요.");
			$("[name = ad_pay_method]").focus();

			return;
		}

		if(confirm("정말 저장하겠습니까?")==false) {

			return;
		}
		
		//alert("광고신청접수");
		$.ajax({
			url : "/group4erp/insertAdProc.do"	//접속할 서버쪽 url 주소 지정
			, type : "post"					//전송 방법 설정
			, data : $("[name = insertAdForm]").serialize()	//서버로 보낼 파라미터명과 파라미터값을 설정
			, success : function(insertAdCnt) {	//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정. 매개변수 boardRepleCnt에는 입력된 행의 개수가 들어온다.
														//현재 data 매개변수에는 새 글 등록 개수가 들어온다.
				if(insertAdCnt==1) {			//[게시판 입력 행 적용 개수]가 1개이면(insert가 1회 성공했다는 뜻)
					alert("광고 신청 성공");
					location.replace("/group4erp/viewAdApplyList.do");
					} else if(insertAdCnt==0) {		//글 등록 개수가 0이면 경고
						alert("광고 신청에 실패했습니다. 관리자에게 문의 바랍니다.");
					} else {
						alert("서버 오류 발생! 관리자에게 문의 바람!");
					}				
				}

				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}			
		});
		
	}

</script>

</head>
<body><center>
	<h1>[광고신청 페이지]</h1><br>
	광고번호 : ${adNum}
	<form name="insertAdForm" method="post" action="/group4erp/insertAdProc.do">
		<table class="insertAdTable tbcss1" name="insertAdTable" cellpadding="5" cellspacing="5">
			<tr>
				<td>업체번호</td><td><select name="corp_no">
									<option value="00">본사 자체</option>
									<c:forEach items="${corpList}" var="corpList" varStatus="loopTagStatus">>
										<option value="${corpList.corp_no}">${corpList.corp_name}</option>
									</c:forEach>
									</select></td>
			</tr>
			<tr>
				<td>광고 타이틀</td><td><input type="text" name="ad_title" maxlength="100"></td>
			</tr>
			<tr>
				<td>노출 요청일</td><td><input type="text" name="open_req_dt">
				</td>
			</tr>
			<tr>
				<td>노출 기간</td><td><input type="text" name="ad_term"><br>
				<label>종료 예정일 : </label></td>
			</tr>
			<tr>
				<td>노출 요청 위치(사이트 메인 페이지)</td>
				<td><select name="open_req_area_cd">
										<option value="">------</option>
										<option value="01">상단</option>
										<option value="02">하단</option>
										<option value="03">중앙</option>
										<option value="04">왼쪽</option>
										<option value="05">오른쪽</option>
					</select>
				</td>				
			</tr>
			<tr>
				<td>결제 수단</td><td><select name="ad_pay_method">
										<option value="01">계좌이체</option>
										<option value="02">카드결제</option>
										
					</select></td>
			</tr>
			<tr>
				<td>첨부파일</td><td><input type="file" name="img_doc"></td>
			</tr>
		
		</table>
		<script>
	    	$("[name=open_req_dt]").datepicker({ dateFormat: 'yy-mm-dd' });
	    	
	    </script>
		<br>
		<input type="button" value="광고신청" onClick="reserveAd();">
		<input type="hidden" name="emp_no" value="<%=(String)session.getAttribute("emp_id") %>">
	</form>
</center>
</body>
</html>
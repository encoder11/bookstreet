<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 검색</title>

<script>

	$(document).ready(function() {
		//alert("팝업창 테스트");
		//location.replace("/group4erp/viewSearchCorp.do");
	});

	function selectCorp(corp_no) {
		$('[name=corp_no]').val(corp_no);

		$.ajax({			
			url : "/group4erp/selectCorp.do"	//서버 쪽 호출 url 주소 지정
			, type : "post"					
			, data : $("[name=searchCorpForm]").serialize()	//서버로 보낼 파라미터명과 파라미터값을 설정
														//, data:"admin_id="+admin_id+"&pwd="+pwd 도 가능
														//, data : {'admin_id':admin_id, 'pwd':pwd}	//JSON 형식
			, success : function(selectedCorpCnt) {	//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정. 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
											//현재 data 매개변수에는 아이디, 암호의 존재 개수가 들어온다.
				if(selectedCorpCnt==1) {				//아이디 존재 개수가 1이면 /z_spring/boardList.do로 이동
					location.replace("/group4erp/viewCorpList.do");
					window.close("/WEB-INF/views/searchCorpPopup.jsp");
					
				} else if(selectedCorpCnt==0) {		
					alert("검색한 업체가 존재하지 않습니다.");
				} else {
					alert("서버 오류 발생! 관리자에게 문의 바람!");
				}				
			}
			
			, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				alert("서버 접속 실패!");
			}			
		});
		
		//document.searchCorpForm.submit();
	}
		
</script>

</head>
<body><center>
	<h1>[업체 선택]</h1>
	<form name="searchCorpForm" method="post" action="/group4erp/selectCorp.do">
	<input type="text" name="searchKeyword">&nbsp;<input type="button" value="검색" onClick="searchCorp();">
		<table class="corpListPopup tbcss1" name="corpListPopup" cellpadding="5" cellspacing="5">
			<tr>
				<th>사업자번호</th><th>사업자명</th>
			</tr>
			
			<c:forEach items='${corpList}' var="corpList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="selectCorp('${corpList.corp_no}');">
					<td>${corpList.corp_no}</td>
					<td>${corpList.corp_name}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="corp_no">
	</form>
</body>
</center>
</html>
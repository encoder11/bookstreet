<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>



<!-- 만약에 상세보기할 게시판 글이 없으면 경고하고 이전 화면으로 이동하기 -->
 <c:if test="${empty businessTripDTO}">
	<script>
		alert("게시글이 삭제되어있습니다!");
		location.replace("/group4erp/businessTripList.do");
	</script>
</c:if>

<html>
<head>
<meta charset="UTF-8">
<title>출장내역 상세보기</title>
<script>
	function goBusinessTripUpDelForm(){
		document.businessTripUpDelForm.submit();
	}
</script>
</head>
<body><center><br><br><br>
	
	<!-- [1개의 게시판 내용]을 출력하고 게시판 등록 화면으로 이동하는 form 태그 선언 -->
	<!-- ModelAndView 객체에 boardDTO라는 키값으로 저장된 BoardDTO 객체의 속성변수 안의 데이터를 꺼내어 출력한다. -->
	<!-- 꺼내는 방법은 EL문법으로 달러{boardDTO.속성변수명} 이다. -->
	<form class="businessTripContentsForm" method="post" name="businessTripContentsForm" action="group4erp/businessTripRegProc.do">
		<input type="hidden" name="work_outside_seq" value="${businessTripDTO.work_outside_seq}">
		<b>출장 상세 보기</b><br>
		<table class="tbcss1" width="500" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr align=center>
				<th bgcolor="gray" >사원 번호</th>
				<td >${businessTripDTO.emp_no}</td>
				<th bgcolor="gray" >직급</th>
				<td >${businessTripDTO.jikup}</td>
			</tr>
			<tr align=center>
				<th bgcolor="gray" width=60>사원명</th>
				<td width=150>${businessTripDTO.emp_name}</td>
				<th bgcolor="gray" width=60>부서명</th>
				<td width=150>${businessTripDTO.dep_name}</td>
			</tr>
			<tr align=center>
				<th bgcolor="gray">담당자 명</th>
				<td>${businessTripDTO.mgr_name}</td>
				<th bgcolor="gray">결제</th>
				<td>
					<c:choose>
								<c:when test="${businessTripDTO.travel_payment eq 'Y'}">
									승인
								</c:when>
								<c:when test="${businessTripDTO.travel_payment eq 'N'}">
									반려
								</c:when>
								<c:otherwise>
									대기중
								</c:otherwise>				
					</c:choose>
				</td>
			</tr>
			<tr>
				<th bgcolor="gray">출장날짜</th>
				<td colspan=3>${businessTripDTO.outside_start_time}&nbsp;~&nbsp;${businessTripDTO.outside_end_time}</td>
			</tr>
			<tr>
				<th bgcolor="gray">출장지</th>
				<td colspan=3>${businessTripDTO.destination}</td>
			</tr>
			<tr>
				<th bgcolor="gray">출장 사유</th>
				<td colspan=3>
					<textarea name="content" rows="13" cols="45" style="boder:0" readonly>${businessTripDTO.work_outside_reason}
					</textarea>
				</td>
		</table>
		<table><tr heigth=3><td></table>
		<!-- <input type="button" value="수정/삭제" onclick="goBusinessTripUpDelForm()">&nbsp; -->
		<input type="button" value="목록보기" onclick="location.replace('/group4erp/businessTripList.do')">
	 </form>
	 <%--
	<!-- [게시판목록] 화면으로 이동하는 form 태그 선언 -->
	<!-- form 태그 내부에는 클라이언트가 보낸 파라미터값을 입력양식에 저장하고 있다. -->
	<!-- 파라미터값을 꺼내는 방법은 EL문법을 이용한다. 달러{param.파라미터명} or 
	{paramValues.파라미터명}이다(Values는 배열로서 checkbox가 파라미터값으로 들어올때 사용한다.-->
	<form name="boardListForm" method="post" action="${ctRoot}/boardListForm.do">
	</form>
	--%>
	<!-- 수정/삭제 화면으로 이동하기 위한 form 태그 선언 -->
	<form name="businessTripUpDelForm" method="post" action="/group4erp/businessTripUpDelForm.do">
		<!-- 게시판 상세보기 화면을 구성하는 글의 고유번호를 hidden 태그에 저장 -->
		<!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야하기 때문 -->
		<input type="hidden" name="work_outside_seq" value="${businessTripDTO.work_outside_seq}">
		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
	</form>
	
	<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 지정한 hidden태그 출력하고 [게시판 목록]화면으로 이동하는 form태그 선언 -->
	<%-- <form name="boardRegForm" method="post" action="${ctRoot}/boardRegForm.do">
		<input type="hidden" name="b_no" value="${param.b_no}">
	</form>  --%>
		
</body>
</html>
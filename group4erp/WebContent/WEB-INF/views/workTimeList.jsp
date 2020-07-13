<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 조회</title>
<script>
	$(document).ready(function(){

		setTableTrBgColor(
				"workDayStateList",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);

		
		$('[name=rowCntPerPage]').change(function(){
			goWorkStateListSearch();
		});
		
		$('[name=searchEmpNo]').change(function(){
			goWorkStateListSearch();
		});
		
		$(".pagingNumber").html(
				getPagingNumber(
					"${workDaysListAllCnt}"						//검색 결과 총 행 개수
					,"${myWorkSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${myWorkSearchDTO.rowCntPerPage}"			//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goWorkStateListSearch();"								//페이지 번호 클릭 후 실행할 자스코드
				)
			);
		inputData("[name=selectPageNo]", "${myWorkSearchDTO.selectPageNo}");
		inputData("[name=rowCntPerPage]", "${myWorkSearchDTO.rowCntPerPage}");
		inputData("[name=searchEmpNo]", "${myWorkSearchDTO.searchEmpNo}");
	});
	
	function goWorkStateListSearch(){
		
		document.workStateListSearch.submit();
		/* 
		$.ajax({
			url : "/group4erp/goMyWorkTime.do"
			, type : "post"
			, data : document.mycarebooklist.submit()
		});
		 */
	}

	function reset(){
		document.workStateListSearch.reset();
	}
</script>

</head>
<body><center>
	<h1>[근태 조회]</h1><br>
		<form name="workStateListSearch" method="post"
			action="/group4erp/goMyWorkTime.do">
			<table class="searchTb tab" name="searchTb" cellpadding="5"
				cellspacing="5" border="0" align="center">
				<tr>
					<td>[사번 검색]</td>
					<td><select name="searchEmpNo">
							<option value="0">전체
								<c:forEach items="${requestScope.searchEmpNo}" var="searchEmpNo"
									varStatus="loopTagStatus">
									<option value="${searchEmpNo.emp_no}">${searchEmpNo.emp_no}
								</c:forEach>
					</select></td>
					</td>
				</tr>
			</table>
			<input type="hidden" name="sort"> 
			<input type="hidden" name="selectPageNo">
			
			<table name="outerBorder" width="80%" border="0" cellpadding="0" cellspacing="5">
			<tr>
				<td align="right">[총 개수] :
					${workDaysListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp; <select
					name="rowCntPerPage">
						<option value="10">10
						<option value="15">15
						<option value="20">20
						<option value="25">25
						<option value="30">30
				</select> 행보기
				</td>
			</tr>
		</table>
		</form>
		<br>
	
	<!-- <form name="workDaysMng" method="post" action="/group4erp/workDaysList.do"> -->
		
			<!-- 메인 목록 시작 -->
			<table class="workDayStateList tab" name="workDayStateList" width="80%" cellpadding="5" cellspacing="5">
				<thead>
					<tr>
						<th width="4%">번호
						<c:choose>
							<c:when test="${param.sort=='w.emp_no desc'}">
								<th width="12%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼직원번호
								
							</c:when>
							<c:when test="${param.sort=='w.emp_no asc'}">
								<th width="12%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.emp_no desc'); goWorkStateListSearch();">▲직원번호
							</c:when>
							<c:otherwise>
								<th width="12%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.emp_no asc'); goWorkStateListSearch();">직원번호
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='e.emp_name desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼이름
								
							</c:when>
							<c:when test="${param.sort=='e.emp_name asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('e.emp_name desc'); goWorkStateListSearch();">▲이름
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('e.emp_name asc'); goWorkStateListSearch();">이름
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='d.dep_name desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼부서
								
							</c:when>
							<c:when test="${param.sort=='d.dep_name asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('d.dep_name desc'); goWorkStateListSearch();">▲부서
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('d.dep_name asc'); goWorkStateListSearch();">부서
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='cj.jikup desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼직급
								
							</c:when>
							<c:when test="${param.sort=='cj.jikup asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('cj.jikup desc'); goWorkStateListSearch();">▲직급
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('cj.jikup asc'); goWorkStateListSearch();">직급
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='w.days_attended desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼출근일수
							</c:when>
							<c:when test="${param.sort=='w.days_attended asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_attended desc'); goWorkStateListSearch();">▲출근일수
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_attended asc'); goWorkStateListSearch();">출근일수
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='w.days_absent desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼결근일수
							</c:when>
							<c:when test="${param.sort=='w.days_absent asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_absent desc'); goWorkStateListSearch();">▲결근일수
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_absent asc'); goWorkStateListSearch();">결근일수
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='w.days_leaving_early desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼조퇴일수
							</c:when>
							<c:when test="${param.sort=='w.days_leaving_early asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_leaving_early desc'); goWorkStateListSearch();">▲조퇴일수
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_leaving_early asc'); goWorkStateListSearch();">조퇴일수
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='w.days_outduty desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼외근일수
							</c:when>
							<c:when test="${param.sort=='w.days_outduty  asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_outduty  desc'); goWorkStateListSearch();">▲외근일수
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_outduty  asc'); goWorkStateListSearch();">외근일수
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.sort=='w.days_late desc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goWorkStateListSearch();">▼지각일수
							</c:when>
							<c:when test="${param.sort=='w.days_late asc'}">
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_late desc'); goWorkStateListSearch();">▲지각일수
							</c:when>
							<c:otherwise>
								<th width="8%" style="cursor: pointer"
									onclick="$('[name=sort]').val('w.days_late asc'); goWorkStateListSearch();">지각일수
							</c:otherwise>
						</c:choose>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${requestScope.getWorkDaysList}"
						var="getWorkDaysList" varStatus="loopTagStatus">
						<tr>
							<td align=center>${workDaysListAllCnt-(myWorkSearchDTO.selectPageNo*myWorkSearchDTO.rowCntPerPage-myWorkSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}
							<td align=center>${getWorkDaysList.EMP_NO}
							<td align=center>${getWorkDaysList.emp_name}
							<td align=center>${getWorkDaysList.dep_name}
							<td align=center>${getWorkDaysList.jikup}
							<td align=center>${getWorkDaysList.days_attended}일
							<td align=center>${getWorkDaysList.days_absent}일
							<td align=center>${getWorkDaysList.days_leaving_early}일
							<td align=center>${getWorkDaysList.days_outduty}일
							<td align=center>${getWorkDaysList.days_late}일
						</tr>
					</c:forEach>
				</tbody>
			</table>

				<!-- 메인 목록 끝 -->


		<table><tr height=10><td></table>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	<!-- </form> -->

</center>
</body>
</html>
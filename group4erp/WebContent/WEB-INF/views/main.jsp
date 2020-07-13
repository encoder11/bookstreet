<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<% 
   //String emp_name = (String)session.getAttribute("emp_name"); 
   //String emp_no = (String)session.getAttribute("emp_id");
   //String mgr = (String)session.getAttribute("mgr"); 
   //String dep_no = (String)session.getAttribute("dep_no"); 
 %>
<head>
<meta charset="UTF-8">
<title>BOOKST.ERP 메인 페이지</title>
<style>


</style>
<script>
function showTime() {
    //현재 날짜를 관리하는 Date 객체 생성
    var today = new Date();
    //----------------------------------------
    //Date 객체에서 날짜 관련 각 데이터를 꺼내어 저장하는 변수 선언
    var amPm = "오후";
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    var week = today.getDay();
    var date = today.getDate();
    var hour = today.getHours();
    var minute = today.getMinutes();
    var second = today.getSeconds();

    var week = ["일", "월", "화", "수", "목", "금", "토"][today.getDay()];
    //날짜 관련 각 데이터가 10 미만이면 앞에 0 붙이기
    //오전, 오후 여부 판단해서 저장하기
    
    if(month<10) {
       month = "0"+month;
    }

    if(date<10) {
       date = "0"+date;
    }

    if(hour<12) {
       amPm = "오전";
    }

    if(hour>12) {
       hour=hour-12;
    }

    if(hour<10) {
       hour="0"+hour;
    }

    if(minute<10) {
       minute = "0"+minute;
    }

    if(second<10) {
       second = "0" + second;
    }
    //id="nowTime"가 있는 태그영역 내부에 시간 문자열 삽입

    document.getElementById("nowTime").innerHTML = year+"년 "+month+"월 "+date+"일("+week+") "+amPm+" "+hour+"시 "+minute+"분 "+second+"초 ";
    
 }

	function startTime() {
	showTime();      //1초 딜레이 되어 시간이 표시되는 현상을 제거하기 위해 showTime() 함수를 한 번 호출한다.
	//-----------------------------------
	//1초마다 showTime() 함수를 호출하기
	//-----------------------------------
	window.setInterval("showTime()", 1000);      //window.setInterval(function() { showTime(); }, 1000);
	}
</script>

</head>
<%--<header width=95%><%@ include file ="/WEB-INF/views/headerMenu.jsp" %></header> --%>
<body><center>

<table width="100%" border="0" cellpadding="0" cellspacing="0" >
<%-- 
	<tr>
		<td width="100%"><%@ include file ="/WEB-INF/views/headerMenu.jsp" %></td>
	</tr>
	<tr height="100">
		<td>
		</td>
	</tr> --%>
	<tr class="main" valign="top" height="700px" >
		<td align="center">
		<!-- <section> -->
			<c:if test="${subMenu.equals('mainPage') }">
				<%@ include file="/WEB-INF/views/mainPage.jsp" %>
			</c:if>	

			<c:if test="${subMenu.equals('eventReserve') }">
				<%@ include file="/WEB-INF/views/eventScheduleForm.jsp" %>
			</c:if>
			
			<!-- 출장 리스트 -->
			<c:if test="${subMenu.equals('businessTripList') }">
				<%@ include file="/WEB-INF/views/businessTripList.jsp" %>
			</c:if>
			
			<!-- 출장 신청 -->
			<c:if test="${subMenu.equals('businessTripForm') }">
				<%@ include file="/WEB-INF/views/businessTripForm.jsp" %>
			</c:if>

			<!-- 출장 상세페이지 -->
			<c:if test="${subMenu.equals('businessTripContentsForm') }">
				<%@ include file="/WEB-INF/views/businessTripContentsForm.jsp" %>
			</c:if>
			
			<!-- 출장 상세페이지 -->
			<c:if test="${subMenu.equals('businessTripUpDelForm') }">
				<%@ include file="/WEB-INF/views/businessTripUpDelForm.jsp" %>
			</c:if>
			
			<!-- 문서 결재 -->
			<c:if test="${subMenu.equals('viewApprovalList') }">
				<%@ include file="/WEB-INF/views/approvalList.jsp" %>
			</c:if>

			
			<!-- 휴가 신청 화면 -->
			<c:if test="${subMenu.equals('viewEmpDayOffjoinForm') }">
				<%@ include file="/WEB-INF/views/empDayOffJoin.jsp" %>
			</c:if>
			
			<!-- 재고현황목록 -->
			<c:if test="${subMenu.equals('viewInventoryList') }">
				<%@ include file="/WEB-INF/views/book_inven_search.jsp" %>
			</c:if>
			<!-- 책 등록 화면 -->
			<c:if test="${subMenu.equals('viewSignUpBook') }">
				<%@ include file="/WEB-INF/views/bookSignUpForm.jsp" %>
			</c:if>	
			<!-- 책 상세 정보 화면 -->
			<c:if test="${subMenu.equals('viewBookContentForm') }">
				<%@ include file="/WEB-INF/views/bookContentForm.jsp" %>
			</c:if>
			
			<!-- 출고현황목록 -->
			<c:if test="${subMenu.equals('viewReleaseList') }">
				<%@ include file="/WEB-INF/views/bookReleaseInfo.jsp" %>
			</c:if>
			<!-- 출고 세부정보 조회 -->
			<c:if test="${subMenu.equals('viewReleaseContent') }">
				<%@ include file="/WEB-INF/views/bookReleaseContentInfo.jsp" %>
			</c:if>
		
			<!-- 직원현황조회 -->
			<c:if test="${subMenu.equals('viewEmpList') }">
				<%@ include file="/WEB-INF/views/empListForm.jsp" %>
			</c:if>
			
			<!-- 직원 상세보기 -->
			<c:if test="${subMenu.equals('viewEmpContentInfo') }">
				<%@ include file="/WEB-INF/views/empListContentForm.jsp" %>
			</c:if>
			<!-- 직원 등록화면 -->
			<c:if test="${subMenu.equals('viewEmpJoinMember') }">
				<%@ include file="/WEB-INF/views/empListJoinForm.jsp" %>
			</c:if>
			
			<!-- 급여지급현황(인사팀 조회 & 직원 전체 목록) -->
			<c:if test="${subMenu.equals('viewSalList') }">
				<%@ include file="/WEB-INF/views/salListForm.jsp" %>
			</c:if>
			
			<!-- 급여지급현황(인사팀 조회 & 직원별 상세정보) -->
			<c:if test="${subMenu.equals('viewEmpSalInfo') }">
				<%@ include file="/WEB-INF/views/empSalInfo.jsp" %>
			</c:if>
			
			<!-- 직원 근무 현황 -->
			<c:if test="${subMenu.equals('viewEmpWorkStateList') }">
				<%@ include file="/WEB-INF/views/empWorkStateList.jsp" %>
			</c:if>
			
			<!-- 직원 휴가 현황 -->
			<c:if test="${subMenu.equals('viewDayOffList') }">
				<%@ include file="/WEB-INF/views/empDayOffList.jsp" %>
			</c:if>
			
			
			<!-- 매출정보 조회 -->
			<c:if test="${subMenu.equals('viewSalesReport') }">
				<%@ include file="/WEB-INF/views/salesReportForm.jsp" %>
			</c:if>
			

			<!-- 어음정보 조회 -->
			<c:if test="${subMenu.equals('viewPromiNoteList') }">
				<%@ include file="/WEB-INF/views/promiNoteListForm.jsp" %>
			</c:if>

			<!-- 세금계산서 발급 내역 조회 -->
			<c:if test="${subMenu.equals('viewTaxInvoiceList') }">
				<%@ include file="/WEB-INF/views/taxInvoiceList.jsp" %>
			</c:if>

			<!-- 담당 상품 조회 -->
			<c:if test="${subMenu.equals('viewMyCareBookList') }">
				<%@ include file="/WEB-INF/views/mycarebooklist.jsp" %>
			</c:if>
						
			<!-- 세금계산서 발급화면 -->
			<c:if test="${subMenu.equals('viewTaxInvoiceForm') }">
				<%@ include file="/WEB-INF/views/taxInvoiceForm.jsp" %>
			</c:if>
			
			<!-- 거래처 현황 조회 -->
			<c:if test="${subMenu.equals('viewCorpList') }">
				<%@ include file="/WEB-INF/views/corpList.jsp" %>
			</c:if>
			
			<!-- 거래처 추가 페이지 -->
			<c:if test="${subMenu.equals('goInsertCorpPage') }">
				<%@ include file="/WEB-INF/views/corpInsertPage.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewkeywdAnalysis') }">
				<%@ include file="/WEB-INF/views/bestKeywdAnalysis.jsp" %>
			</c:if>

			<c:if test="${subMenu.equals('mySchedule') }">
				<%@ include file="/WEB-INF/views/mySchedule.jsp" %>
			</c:if>
			
			<%-- <c:if test="${subMenu.equals('workOutReport') }">
				<%@ include file="/WEB-INF/views/workOutReport.jsp" %>
			</c:if> --%>
			
			<c:if test="${subMenu.equals('viewEmpAvgSalChart') }">
				<%@ include file="/WEB-INF/views/chartPage.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewEventList') }">
				<%@ include file="/WEB-INF/views/eventListPage.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewReturnOrderList') }">
				<%@ include file="/WEB-INF/views/returnOrderList.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewAdApplyList') }">
				<%@ include file="/WEB-INF/views/adApplyInfoPage.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewInsertAdApply') }">
				<%@ include file="/WEB-INF/views/adInsertForm.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewMyWorkTime') }">
				<%@ include file="/WEB-INF/views/workTimeList.jsp" %>
			</c:if>

			<!-- 입고 관리 페이지 -->
			<c:if test="${subMenu.equals('viewWarehousingList') }">
				<%@ include file="/WEB-INF/views/warehousing.jsp" %>
			</c:if>

			<c:if test="${subMenu.equals('viewTranSpecList') }">
				<%@ include file="/WEB-INF/views/transactionSpecList.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewTranSpecInfo') }">
				<%@ include file="/WEB-INF/views/tranSpecPage.jsp" %>
			</c:if>

			<c:if test="${subMenu.equals('viewSalesInfoList') }">
				<%@ include file="/WEB-INF/views/salesInfoList.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewTranSpecIssueList') }">
				<%@ include file="/WEB-INF/views/tranSpecList.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewApprovalDoc') }">
				<%@ include file="/WEB-INF/views/approvalDoc.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewOurCompanyReport') }">
				<%@ include file="/WEB-INF/views/ourCompanyAnalysis.jsp" %>
			</c:if>

		</td>
	</tr>

</table>

</center>
</body>
<%--<footer><%@ include file ="/WEB-INF/views/footer.jsp" %></footer> --%>
</html>
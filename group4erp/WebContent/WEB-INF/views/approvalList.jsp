<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <meta http-equiv="Conpatible" content="no-cache"/>
  <title>Dashio - Bootstrap Admin Template</title>

 <!-- Favicons -->
  <link href="${ctRootImg}/favicon.png" rel="icon">
  <link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${ctRootlib}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${ctRootlib}/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <%-- 
  <link href="${ctRootlib}/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${ctRootlib}/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${ctRootlib}/advanced-datatable/css/DT_bootstrap.css" />
  --%>
  <!-- Custom styles for this template -->
  <link href="${ctRootcss}/style.css" rel="stylesheet">
  <link href="${ctRootcss}/style-responsive.css" rel="stylesheet">
  
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<style>

.searchTable{
	border-collapse: 1px collapse !important;
}

.searchTable td{
	height: 32px;
    padding-left: 7;
}

.searchTable th {
	height: 32px;
    padding-right: 7;
    
}

.searchTable-bordered td,
.searchTable-bordered th {
    border: 1px solid #ddd !important;
}

.tableth th{
	text-align: right;
	font-weight: bold;
}

</style>


<script>

	$(document).ready(function() {
		startTime();
		headerSort("approvalResList", 0);
		headerSort("approvalReqList", 0);

		setTableTrBgColor(
				"approvalResList",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);

		setTableTrBgColor(
				"approvalReqList",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);

		inputData("[name=sort]", "${approvalSerachDTO.sort}");

		$(document).on('click','#reApproval', function () {

		    var document_no = $(this).attr("value");
		    
		    reApprovalProc(document_no);
		    	
		});


		$(document).on('click','#removeApproval', function () {

		    var document_no = $('[name=approvalReqList] [name=test]').find('[name=document_no]').val();
		    
		    deleteApproval(document_no);
		    	
		});

	});


	function viewAppResDoc(document_no) {
		//alert("결재 문서 보기 구현 예정");
		//alert(document_no);
		$("[name=document_no]").val(document_no);

		document.approvalResListForm.submit();
		
	}



	function updateApprovalInfo(idx, e_works_no, document_no, approval_state, e_work_comment) {
		
		var thisTr = $(idx);
		var delTr = $('[name=approvalReqList] [name=test]');

		if(delTr.size()>0){
			delTr.remove();
		}

		var htmlCode = "<tr name='test' align=center> <td colspan=7>"
			//htmlCode += "<form name='updateEventForm'>"
			htmlCode += "<table width=99%> <tr> <td width=30%> <td width=40% align=center>"
   			htmlCode += "⏷<br>[처리된 문서]<br>"
    		htmlCode += "<td width=30% align=right>"
    		htmlCode += "<h3 align=right><i class='fa fa-times' onClick='closeThisTr(this);' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3> </table>"
			htmlCode += "<table class='innertable searchTable tableth' name='innertable' align='center'>"

			if(approval_state=='대기중') {
				 htmlCode += "<tr> <td colspan='2' align='center'>아직 회신이 없습니다. </tr>"
			} else {
				htmlCode += "<tr> <td colspan='2' align='center'>결재받은 내용입니다. </tr>"
			}
			
			htmlCode += "<tr> <th>문서 번호</th> <td><label>'"+document_no+"'</label></td></tr>"
		    htmlCode += "<tr> <th>결과</th> <td><label>'"+approval_state+"'</label></td></tr>"

			if(approval_state=='부서장 승인' || approval_state=='최종 승인') {
				htmlCode += "<tr> <th>메시지</th> <td><label>"+e_work_comment+"</label></td></tr>"
			} else {
				htmlCode += "<tr> <th>메시지</th> <td><label>"+e_work_comment+"</label></td></tr>"
			}
		   	
		    htmlCode += "</table>"
		    htmlCode += "<input type='hidden' name='e_work_no' value="+e_works_no+">"
		    htmlCode += "<input type='hidden' name='document_no' value="+document_no+"><br>"

		    if(approval_state == '반려' || approval_state == '대기중') {

				htmlCode += "<button id ='reApproval' name='reApproval' class='btn btn-theme03' value='"+document_no+"'><i class='fa fa-reply'></i>재결재</button>&nbsp;"
				htmlCode += "<button id = 'removeApproval' name='removeApproval' class='btn btn-theme04' value='"+document_no+"'><i class='fa fa-eraser'></i>삭제</button>&nbsp;"

			} 
			//htmlCode += "<input type='button' value='닫기' name='closeTr' onClick='closeThisTr(this);'>&nbsp;"
		    //htmlCode += "</form>"
			htmlCode += "</tr>"
  
		   
	    thisTr.after(htmlCode);
	    
			
			
			$('[name=approvalReqList] [name=test]').hide();
			$('[name=approvalReqList] [name=test]').show(1000);
	}

	function closeThisTr(idx) {
		
		var delTr = $('[name=approvalReqList] [name=test]');
		delTr.hide(1000, function(){
			delTr.remove();
		});
	}

	function reApprovalProc(document_no) {
		//alert("다시 결재 요청합니다. "+document_no);
		if(document_no.indexOf('EV') >= 0) {
			//alert("이벤트 행사 재결재");
			location.replace("/group4erp/eventScheduling.do?evnt_no="+document_no);

		} else if(document_no.indexOf('DO') >= 0) {
			location.replace("/group4erp/goEmpDayOffjoin.do");

		} else if(document_no.indexOf('BT') >= 0) {
			location.replace("/group4erp/businessTripForm.do");
		}

	}


	function deleteApproval(document_no) {
		//alert("삭제 로직 시작=="+document_no);


		if(document_no.indexOf("EV") >= 0) {

		$.ajax({
				url : "/group4erp/deleteEventApprovalProc.do?document_no="+document_no,				//호출할 서버쪽 URL 주소 설정
				type : "post",										//전송 방법 설정
				//data : document_no, //$('[name=approvalReqList] [name=test]').find('[name=document_no]').val(),		//서버로 보낼 파라미터명과 파라미터값을 설정
				
				success : function(delCnt) {
					if(delCnt==1) {
						//alert("이벤트 결재 삭제 성공!");
						
						location.replace("/group4erp/viewApprovalList.do");
					} else if(delCnt==0) {
						alert("이벤트 결재 삭제 실패");

					} else if(delCnt==-1) {	
						//alert("업체가 이미 삭제되었습니다!");
						
						//location.replace("/group4erp/viewApprovalList.do");

					} else {
						alert("서버쪽 DB 연동 실패!");
					}
				}

				//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}	
			});
			
		} else if(document_no.indexOf("DO") >= 0) {
			alert("휴가 신청 삭제");

			$.ajax({
				url : "/group4erp/deleteDayOffApprovalProc.do?document_no="+document_no,				//호출할 서버쪽 URL 주소 설정
				type : "post",										//전송 방법 설정
				//data : document_no, //$('[name=approvalReqList] [name=test]').find('[name=document_no]').val(),		//서버로 보낼 파라미터명과 파라미터값을 설정
				
				success : function(delCnt) {
					if(delCnt==1) {
						//alert("휴가 신청 & 결재 삭제 성공!");
						
						location.replace("/group4erp/viewApprovalList.do");
					} else if(delCnt==0) {
						alert("휴가 신청 & 결재 삭제 실패");

					} else if(delCnt==-1) {	
						//alert("업체가 이미 삭제되었습니다!");
						
						//location.replace("/group4erp/viewApprovalList.do");

					} else {
						alert("서버쪽 DB 연동 실패!");
					}
				}

				//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}	
			});
			

		} else if(document_no.indexOf("BT") >= 0) {
			//alert("출장 신청 삭제");

			$.ajax({
				url : "/group4erp/deleteBTripApprovalProc.do?document_no="+document_no,				//호출할 서버쪽 URL 주소 설정
				type : "post",										//전송 방법 설정
				//data : document_no, //$('[name=approvalReqList] [name=test]').find('[name=document_no]').val(),		//서버로 보낼 파라미터명과 파라미터값을 설정
				
				success : function(delCnt) {
					if(delCnt==1) {
						alert("출장 신청 & 결재 삭제 성공!");
						
						location.replace("/group4erp/viewApprovalList.do");
					} else if(delCnt==0) {
						alert("출장 신청 & 결재 삭제 실패");

					} else if(delCnt==-1) {	
						//alert("업체가 이미 삭제되었습니다!");
						
						//location.replace("/group4erp/viewApprovalList.do");

					} else {
						alert("서버쪽 DB 연동 실패!");
					}
				}

				//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}	
			});
		}

		/* */
		
	}

	function goSearch() {

		document.approvalReqForm.submit();

	}

	function goResSearch() {

		document.approvalResForm.submit();

	}
		
</script>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="/group4erp/goMainTest.do" class="logo"><b>BOOK<span>STREET</span></b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <!-- notification dropdown end -->
          <li><!-- 
            <table>
               <tr>
                  <td align="left"> <font style="color:#D8E8E4;"><h4><span id="nowTime" align="right"></span> </h4></font></td>
               </tr>
            </table> -->
          </li>
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <!-- <li>
            <a class="goBackss" href="javascript:goBack();">뒤로 가기</a>
          </li> -->
          <li>
             <a class="logout" href="/group4erp/logout.do">Logout</a>
          </li>
        </ul>
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <!-- <li>
            <a class="goBackss" href="javascript:goBack();">뒤로 가기</a>
          </li> -->
          <li style="margin-top: 10px; margin-right: 20px;">
             <font style="color:#D8E8E4;"><h4><span id="nowTime" align="right"></span> </h4></font>
          </li>
        </ul>
      </div>
      
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered">
            <a href="/group4erp/goMainTest.do"><img src="/group4erp/resources/image/logo_sidebar.png"  width="80"></a>
          </p>
          <h4 class="centered"><b><font style="color:lightgray">${emp_name} ${jikup}님</font></b></h4>
          <li class="mt">
            <a href="/group4erp/goMainTest.do">
              <i class="fa fa-dashboard"></i>
              <span>메인페이지</span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>업무 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/goMyCareBookList.do"><i class="fa fa-book"></i>담당 도서 조회</a>
              </li>
              <li>
                <a href="/group4erp/businessTripList.do"><i class="fa fa-briefcase"></i>출장 신청</a>
              </li>
              <!-- 
              <li>
                <a href="/group4erp/goMyWorkTime.do"><i class="fa fa-list"></i>근태 조회</a>
              </li>
              -->
              <li class="active">
                <a href="/group4erp/viewApprovalList.do"><i class="fa fa-pencil"></i>문서 결재</a>
              </li>
              <li>
                <a href="/group4erp/goEmpDayOffjoin.do"><i class="fa fa-edit"></i>휴가 신청</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-shopping-cart"></i>
              <span>재고 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/goBookList.do"><i class="fa fa-info-circle"></i>도서정보조회</a>
              </li>
              <li>
                <a href="/group4erp/goReleaseList.do"><i class="fa fa-list"></i>출고현황조회</a>
              </li>
              <li>
                <a href="/group4erp/goWarehousingList.do"><i class="fa fa-list"></i>입고현황조회</a>
              </li>
              <li>
                <a href="/group4erp/goReturnOrderList.do"><i class="fa fa-list"></i>반품현황조회</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-calendar"></i>
              <span>마케팅 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewSalesInfoList.do"><i class="fa fa-money"></i>판매현황</a>
              </li>
              <li>
                <a href="/group4erp/viewEventList.do"><i class="fa fa-gift"></i>이벤트행사 현황</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-users"></i>
              <span>인사 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewEmpList.do"><i class="fa fa-info-circle"></i>직원정보</a>
              </li>
              <li class="active">
              	<a href="/group4erp/viewEmpSalInfo.do"><i class="fa fa-file"></i>급여명세서 조회</a>
              </li>
              <!-- 
              <li>
                <a href="/group4erp/viewEmpWorkStateList.do"><i class="fa fa-list"></i>직원별 근무현황</a>
              </li>
               -->
              <li>
                <a href="/group4erp/viewEmpDayOffList.do"><i class="fa fa-list"></i>직원별 휴가 현황</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-krw"></i>
              <span>회계 관리</span>
              </a>
            <ul class="sub">
              <li class="active">
                <a href="/group4erp/viewTranSpecIssueList.do"><i class="fa fa-list"></i>거래명세서 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewTranSpecList.do"><i class="fa fa-file-text"></i>사업자 거래내역 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewCorpList.do"><i class="fa fa-link"></i>거래처 현황 조회</a>
              </li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class=" fa fa-bar-chart-o"></i>
              <span>전략 분석</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewBestKeywdAnalysis.do"><i class="fa fa-search"></i>키워드 검색 자료 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewOurCompanyReport.do"><i class="fa fa-building-o"></i>회사현황</a>
              </li>
            </ul>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper" style="text-align:left;">
      <table width=99%>
      <tr>
      <td>
        <h3><i class="fa fa-angle-right"></i> 문서 결재</h3> </td>
        </tr>
      </table>
      <table><tr><td height=10></td></tr></table>  
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 결재할 서류 목록 [ ${approvalResCnt} ]</h4>
              <hr>
		<form name="approvalResListForm" method="post" action="/group4erp/viewApprovalDoc.do">
			<!-- <div class="divcss"> -->
			<input type="hidden" name="sort" >
			 <table class="table table-striped table-advance table-hover table-bordered" name="approvalResList" width="90%" border=0 cellspacing=0 cellpadding=5>
             <thead>
				<tr>
		            <c:choose>
		               <c:when test="${param.sort=='6 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goResSearch();  "> ▼ 직급</th>
		               </c:when>
		               <c:when test="${param.sort=='6 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('6 desc'); goResSearch(); "> ▲ 직급</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('6 asc'); goResSearch();  ">직급</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='7 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goResSearch();  "> ▼ 사원 성명</th>
		               </c:when>
		               <c:when test="${param.sort=='7 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('7 desc'); goResSearch(); "> ▲ 사원 성명</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('7 asc'); goResSearch();  ">사원 성명</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='3 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goResSearch();  "> ▼ 문서일련번호</th>
		               </c:when>
		               <c:when test="${param.sort=='3 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('3 desc'); goResSearch(); "> ▲ 문서일련번호</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goResSearch();  ">문서일련번호</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='8 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goResSearch();  "> ▼ 결재요청시간</th>
		               </c:when>
		               <c:when test="${param.sort=='8 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('8 desc'); goResSearch(); "> ▲ 결재요청시간</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('8 asc'); goResSearch();  ">결재요청시간</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='9 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goResSearch();  "> ▼ 상태</th>
		               </c:when>
		               <c:when test="${param.sort=='9 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('9 desc'); goResSearch(); "> ▲ 상태</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('9 asc'); goResSearch();  ">상태</th>
		               </c:otherwise>
		            </c:choose>
		            </tr>
					</thead>
					<tbody>
					 <c:forEach items='${approvalResList}' var="approvalResList" varStatus="loopTagStatus">
			            <tr style="cursor:pointer" onClick="viewAppResDoc('${approvalResList.document_no}');" align="center">
			               <%--<td>${approvalResList.approval_num}</td> --%>
			               <td>${approvalResList.jikup}</td>
			               <td>${approvalResList.emp_name}</td>
			               <td>${approvalResList.document_no}</td>
			               <td>${approvalResList.e_works_req_dt}</td>
			               <td>${approvalResList.approval_state}</td>
			            </tr>   
			         </c:forEach>
					</tbody>
			</table>
			<input type="hidden" name="document_no" value="${document_no}">
			<br>

			</form>
			<c:if test="${approvalResList.size()==0}">
		         <h5>결재할 사항이 없습니다.</h5>
		      </c:if>
            </div>
          </div>
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 결재 요청한 서류 목록 [ ${approvalCnt} ]</h4>
              <hr>
		<form name="approvalReqForm" method="post" action="/group4erp/viewApprovalList.do">
			<!-- <div class="divcss"> -->
			<input type="hidden" name="sort" >
			 <table class="table table-striped table-advance table-hover table-bordered" name="approvalReqList" width="90%" border=0 cellspacing=0 cellpadding=5>
             <thead>
				<tr>
	               <th>순서</th>
	               
	               <c:choose>
	                  <c:when test="${param.sort=='2 desc'}">
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 문서 일련번호</th>
	                  </c:when>
	                  <c:when test="${param.sort=='2 asc'}">
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val('2 desc'); goSearch(); "> ▲ 문서 일련번호</th>
	                  </c:when>         
	                  <c:otherwise>
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val('2 asc'); goSearch();  ">문서 일련번호</th>
	                  </c:otherwise>
	               </c:choose>
	            
	               <c:choose>
	                  <c:when test="${param.sort=='7 desc'}">
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 결재요청시간</th>
	                  </c:when>
	                  <c:when test="${param.sort=='7 asc'}">
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val('7 desc'); goSearch(); "> ▲ 결재요청시간</th>
	                  </c:when>         
	                  <c:otherwise>
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val('7 asc'); goSearch();  ">결재요청시간</th>
	                  </c:otherwise>
	               </c:choose>
	            
	               <c:choose>
	                  <c:when test="${param.sort=='8 desc'}">
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 상태</th>
	                  </c:when>
	                  <c:when test="${param.sort=='8 asc'}">
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val('8 desc'); goSearch(); "> ▲ 상태</th>
	                  </c:when>         
	                  <c:otherwise>
	                     <th style="cursor:pointer" onClick="$('[name=sort]').val('8 asc'); goSearch();  ">상태</th>
	                  </c:otherwise>
	               </c:choose>
	               
	               <th>비고</th>
					</thead>
					<tbody>
					 <c:forEach items='${approvalReqList}' var="approvalReqList" varStatus="loopTagStatus">         
		               <c:choose>
		                  <c:when test="${approvalReqList.approval_state eq '심사중'}">
		                     
		                  </c:when>   
		                  <c:otherwise>
		                     <tr style="cursor:pointer" onClick="updateApprovalInfo(this, '${approvalReqList.e_works_no}', '${approvalReqList.document_no}', '${approvalReqList.approval_state}', '${approvalReqList.e_work_comment}');">
		                  </c:otherwise>
		               </c:choose>
		                  <td align="center">${approvalCnt - (loopTagStatus.index)}</td>
		               
		                  <td>${approvalReqList.document_no}<input type="hidden" name="document_no" value="${approvalReqList.document_no}"></td>
		                  <td>${approvalReqList.e_works_req_dt}</td> 
		                  <td align="center">${approvalReqList.approval_state}</td> 
		                  <td>
		                     <c:if test="${approvalReqList.approval_state eq '대기중' || approvalReqList.approval_state eq '반려'}">
		                        삭제 가능
		                     </c:if>               
		                  </td> 
		               </tr>   
		            </c:forEach>
					</tbody>
			</table>
			<br>
			<c:if test="${approvalReqList.size()==0}">
            <h5>결재를 요청한 내역이 없습니다.</h5>
        	 </c:if>
			</form>
            </div>
          </div>
          <!-- /col-md-12 -->
        </div>
        <br>
        <h3> &lt;주의&gt; </h3>
        <h4><strong>'대기중'</strong>인 결재 문서는 <font color=red><strong>수정 & 삭제</strong></font>가 가능합니다.<br>
        	 <strong>'심사중'</strong>인 결재 문건은 <font color=red><strong>수정 & 삭제</strong></font>가 불가하며, 부득이하게 취소하고자 할 경우에는
        	 <font color=red><strong>담당 부서장과 상의</strong></font>하시기 바랍니다.</h4>
        <!-- /row -->
      </section>
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <!--     <footer class="site-footer">
      <div class="text-center">
        <p>
			KOSMO 자바&빅데이터 과정 팀프로젝트
        </p>
        <div class="credits">
        <font style="font-size:12pt;">
        ⓒ Copyrights <strong>조충래, 김태현, 박현우, 이동하, 임남희, 최민지</strong>
         </font>
        </div>
        <a href="basic_table.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer> -->
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <%-- 
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.js"></script>
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="${ctRootlib}/advanced-datatable/js/DT_bootstrap.js"></script> --%>
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
  
</body>

</html>

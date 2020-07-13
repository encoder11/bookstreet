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
	height: 40px;
    padding-left: 7;
}

.searchTable th {
	height: 40px;
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


<% String emp_nm = (String)session.getAttribute("emp_name"); 
   System.out.println("emp_nm==="+emp_nm);
   
   request.setAttribute("emp_nm", emp_nm);

%>

<script>

   $(document).ready(function(){


	   startTime();
	   
      $("#evnt_start_dt").datepicker({
             onSelect: function() { 
                //var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
                 var dateObject = $(this).datepicker('getDate');
                 //alert(dateObject.val()); 
            }
      });

      $("#evnt_end_dt").datepicker({
          onSelect: function() { 
                //var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
                var dateObject = $(this).datepicker('getDate');
                 //alert(dateObject.val()); 
            }
      });
      
      $(".updateArea").hide();


      $('[name=rowCntPerPageDown]').change(function(){
		   $('[name=rowCntPerPage]').val( $(this).val() );
         goSearch();
         //document.eventSearchRowForm.submit();
      });
   
      $(".pagingNumber").html(
         getPagingNumber(
            "${eventAllCnt}"                  //검색 결과 총 이벤트 개수
            ,"${eventSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
            ,"${eventSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
            ,"10"                              //페이지 당 보여줄 페이지번호 개수
            ,"goSearch();"                  //페이지 번호 클릭 후 실행할 자스코드
         )
      );

      inputData('[name=rowCntPerPageDown]',"${eventSearchDTO.rowCntPerPage}");
      inputData('[name=selectPageNo]',"${eventSearchDTO.selectPageNo}");
      inputData("[name=searchKeyword]", "${eventSearchDTO.searchKeyword}");
      inputData("[name=sort]", "${eventSearchDTO.sort}");   

      <c:forEach items="${eventSearchDTO.evnt_category}" var="evnt_category">
         inputData("[name=evnt_category]", "${evnt_category}");
      </c:forEach>
      <c:forEach items="${eventSearchDTO.evnt_stat}" var="evnt_stat">
         inputData("[name=evnt_stat]", "${evnt_stat}");
      </c:forEach>
      
   });

   function reserveEvent() {
      //alert("이벤트 신청 페이지");
      location.href="/group4erp/eventScheduling.do";
   }

   function goSearch() {
      
      document.searchEvntForm.submit();
   }

   function goSearchAll() {
      document.searchEvntForm.reset();

      $('[name=searchEvntForm] [name=sort]').val("1");
      $('[name=searchEvntForm] [name=selectPageNo]').val("1");
      $('[name=searchEvntForm] [name=rowCntPerPage]').val("10");
      //$("[name=searchEvntForm] [name=sort]").val('');
      
      goSearch();
   }

   function goReset(){
      document.searchEvntForm.reset();
   }

   function updateEventInfo(idx, evnt_no, evnt_title, evnt_start_dt, evnt_end_dt, evnt_comment) {
      
      var thisTr = $(idx).parent().parent();
      var delTr = $('.eventListTable [name=test]');

      if(delTr.size()>0){
         delTr.remove();
      }

      evnt_start_dt = evnt_start_dt.substr(0, 10);
      evnt_end_dt = evnt_end_dt.substr(0, 10);

         //alert(evnt_start_dt +" / "+evnt_end_dt);
         //$('.mycarebookTable tbody tr:eq('+idx+')').append(" <tr> <td>");
         //$('.mycarebookTable tbody tr:eq('+idx+')').after(" <tr align=center> <td colspan=7> </td> </tr>");
         
         //var str = $('.qqq').html();
             
         //var thisTr = $(idx).parent().parent();
         
         
         
         var htmlCode = "<tr name='test' align=center> <td colspan=10>"
    	 htmlCode += "<table width=99%> <tr> <td width=30%> <td width=40% align=center>"
   		htmlCode += "⏷<br>[이벤트 수정]<br>"
    	htmlCode += "<td width=30% align=right>"
    	htmlCode += "<h3 align=right><i class='fa fa-times' onClick='closeThisTr();' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3> </table>"
         htmlCode += "<form name='updateEventForm'>"
         htmlCode += "<table class='searchTable tableth' width=35% align=center>"
         htmlCode += "<tr> <th>이벤트 종류 <td><select class='form-control' name='evnt_cd'>"
        htmlCode +=                            "<option value='1'>매대판매행사</option>"
        htmlCode +=                            "<option value='2'>야외판매</option>"
        htmlCode +=                            "<option value='3'>할인전</option>"
        htmlCode +=                            "<option value='4'>기부행사</option>"
        htmlCode +=                            "<option value='5'>온라인 설문조사</option>"
        htmlCode +=                   "</select> </td></tr>"
         htmlCode += "<tr> <th>이벤트 타이틀</th> <td><input type='text' class='form-control round-form' name='evnt_title' value='"+evnt_title+"'></td></tr>"
         htmlCode += "<tr> <th>시작일</th> <td><input type='text' class='form-control round-form' name='evnt_start_dt' value='"+evnt_start_dt+"'></td></tr>"
           htmlCode += "<tr> <th>종료일</th> <td><input type='text' class='form-control round-form' name='evnt_end_dt' value='"+evnt_end_dt+"'></td></tr>"
           htmlCode += "<tr> <th>메시지</th> <td><textarea class='form-control' name='evnt_comment' rows='5' value='"+evnt_comment+"'>"+evnt_comment+"</textarea></td></tr>"
         htmlCode += "</table>"
         htmlCode += "<input type='hidden' name='evnt_no' value="+evnt_no+"><br>"
         htmlCode += "<button type='button' class='btn btn-theme02' onClick='updateEventProc();'><i class='fa fa-check'></i> 수정</button>&nbsp;"
         htmlCode += "</form>"
        htmlCode += "<script>"
        htmlCode += "$('[name=evnt_start_dt]').datepicker({ dateFormat: 'yy-mm-dd' });"
        htmlCode += "$('[name=evnt_end_dt]').datepicker({ dateFormat: 'yy-mm-dd' });"
        htmlCode += "</script"
        htmlCode += ">"
        
         thisTr.after(htmlCode);
         
         $('.eventListTable [name=test]').hide();
         $('.eventListTable [name=test]').show(1000);
   }

   function closeThisTr() {
      
	   var delTr = $('.eventListTable [name=test]');
	   delTr.hide(1000, function(){
		   delTr.remove();
	   });

   }


   function updateEventProc() {

      $.ajax({
         url : "/group4erp/updateEventProc.do",            //호출할 서버쪽 URL 주소 설정
         type : "post",                              //전송 방법 설정
         data : $('[name=updateEventForm]').serialize(),      //서버로 보낼 파라미터명과 파라미터값을 설정
         
         success : function(upCnt) {
            if(upCnt >= 1) {
               //alert("수정 성공!");
               
               location.replace("/group4erp/viewEventList.do");
            } else if(upCnt==-1) {   
               alert("이벤트가 이미 삭제되었습니다!");
               
               location.replace("/group4erp/viewEventList.do");

            } else {
               alert("서버쪽 DB 연동 실패!");
            }
         }

         //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
         , error : function() {      //서버의 응답을 못받았을 경우 실행할 익명함수 설정
            alert("서버 접속 실패!");
         }   
      });
      
   }
   

   function deleteNotYetEvent() {
      
      var evnt_no = [];
      var cnt=0;

      $("[name=delCheckBox]").each(function() {
      
         var thisObj = $(this);

         if(thisObj.is(":checked")) {
            
            evnt_no.push(thisObj.val());
         }
      });
               
      if(evnt_no.length==0) {
         alert("선택된 이벤트가 없습니다.");

         return;
      }

      $("[name=evnt_no]").val(evnt_no);

      //alert($('[name=deleteCorpForm]').serialize());
      $.ajax({
         url : "/group4erp/deleteEvntProc.do",            //호출할 서버쪽 URL 주소 설정
         type : "post",                              //전송 방법 설정
         data : $('[name=deleteEvntForm]').serialize(),      //서버로 보낼 파라미터명과 파라미터값을 설정
         
         success : function(delCnt) {
            if(delCnt>=1) {
               //alert("삭제 성공!");
               
               location.replace("/group4erp/viewEventList.do");
            } else if(delCnt==-1) {   
               alert("이벤트가 이미 삭제되었습니다!");
               
               location.replace("/group4erp/viewEventList.do");

            } else {
               alert("서버쪽 DB 연동 실패!");
            }
         }

         //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
         , error : function() {      //서버의 응답을 못받았을 경우 실행할 익명함수 설정
            alert("서버 접속 실패!");
         }   
      });
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
            <a href="javascript:;">
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
              <li>
               -->
              <li>
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
            <a class="active" href="javascript:;">
              <i class="fa fa-calendar"></i>
              <span>마케팅 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewSalesInfoList.do"><i class="fa fa-money"></i>판매현황</a>
              </li>
              <li class="active">
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
              <li>
                <a href="/group4erp/viewSalList.do"><i class="fa fa-file"></i>급여명세서 조회</a>
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
        <h3><i class="fa fa-angle-right"></i> 이벤트 현황</h3>
       <td align=right>
       <button type="button" class="btn btn-theme04" onclick="reserveEvent();"><i class="fa fa-edit"></i> 이벤트 신청</button>
      </table>
      <table><tr><td height=10></td></tr></table>  
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
		<form name="searchEvntForm" method="post" action="/group4erp/viewEventList.do">
			<!-- <div class="divcss"> -->
			<table class="searchTable" style="border: 0px;">
				<tr>
					<th width="8%" style="text-align:right;"><b>* 종류&nbsp;</b></th>
					
					<td colspan=2 width="50%" align=left>
					<input type="checkbox" value="01" name="evnt_category">매대판매
                        &nbsp;&nbsp;<input type="checkbox" value="02" name="evnt_category">야외판매
                        &nbsp;&nbsp;<input type="checkbox" value="03" name="evnt_category">할인전
                        &nbsp;&nbsp;<input type="checkbox" value="04" name="evnt_category">기부행사
                        &nbsp;&nbsp;<input type="checkbox" value="05" name="evnt_category">온라인 설문조사
                        &nbsp;&nbsp;<input type="checkbox" value="06" name="evnt_category">저자강연회
                        &nbsp;&nbsp;<input type="checkbox" value="07" name="evnt_category">선착순증정 </td>
						
				<tr>
					<th width="8%" style="text-align:right;"><b>* 상태&nbsp;</b>
					<td colspan=2 width="42%" align=left>
						 &nbsp;&nbsp;<input type="checkbox" value="01" name="evnt_stat">대기중
                         &nbsp;&nbsp;<input type="checkbox" value="03" name="evnt_stat">심사중
                         &nbsp;&nbsp;<input type="checkbox" value="02" name="evnt_stat">진행중
                         &nbsp;&nbsp;<input type="checkbox" value="04" name="evnt_stat">종료
				<tr>
					<th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
					<td width="42%"> <input type="text" name="searchKeyword" size=78>
					<th>
					<td>
					<th>
					<td  width="20%">
						<button type="button" class="btn btn-default" onclick="goSearch();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="15" height="15">검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goSearchAll();"><input type="image" src="/group4erp/resources/image/searchA.png" width="15" height="15">모두검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="15" height="15">초기화</button>
			</table>

			<br>
			<!-- 
			<input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="20" height="20" value="검색" onclick="goSearchBookInven();">  
			<a href="javascript:goSearchBookInven();">검색</a>&nbsp;&nbsp;
			<input type="button" value="모두검색" onclick="goAllSearchBookInven();">&nbsp;&nbsp;
			<input type="button" value="초기화" onclick="goAllReset();">
 			-->
			<!-- </div> -->
			
			<input type="hidden" name="selectPageNo">
			<input type="hidden" name="rowCntPerPage" value="${eventSearchDTO.rowCntPerPage}">
			<!-- header sort를 하기 위한 hidden Tag -->
			<input type="hidden" name="sort">
			</form>
            </div>
          </div>
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
            <div class="adv-table">
            <table border=0 width=98%>
					<tr>
						<td><h4><i class="fa fa-angle-right"></i>검색 결과</h4>
						<td align=right>
						[전체 행사 횟수] : ${eventAllCnt}회
						<select name="rowCntPerPageDown">
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
						</select> 행보기
			</table>
			<table><tr><td height="10"></td></tr></table>
			<form name="eventScheduleForm" method="post" action="/group4erp/reserveEvent.do">

             <table class="eventListTable table table-striped table-advance table-hover table-bordered" width="90%" border=0 cellspacing=0 cellpadding=5>
             <thead>
				<tr>
		            <th></th>
		            <th>번호</th>
		            <c:choose>
		               <c:when test="${param.sort=='1 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 이벤트 번호</th>
		               </c:when>
		               <c:when test="${param.sort=='1 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('1 desc'); goSearch(); "> ▲ 이벤트 번호</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('1 asc'); goSearch();  ">이벤트 번호</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='3 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 이벤트 종류</th>
		               </c:when>
		               <c:when test="${param.sort=='3 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('3 desc'); goSearch(); "> ▲ 이벤트 종류</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goSearch();  ">이벤트 종류</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='4 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 타이틀</th>
		               </c:when>
		               <c:when test="${param.sort=='4 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('4 desc'); goSearch(); "> ▲ 타이틀</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('4 asc'); goSearch();  ">타이틀</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='7 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 시작일</th>
		               </c:when>
		               <c:when test="${param.sort=='7 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('7 desc'); goSearch(); "> ▲ 시작일</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('7 asc'); goSearch();  ">시작일</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='8 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 종료일</th>
		               </c:when>
		               <c:when test="${param.sort=='8 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('8 desc'); goSearch(); "> ▲ 종료일</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('8 asc'); goSearch();  ">종료일</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='9 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 상태</th>
		               </c:when>
		               <c:when test="${param.sort=='9 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('9 desc'); goSearch(); "> ▲ 상태</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('9 asc'); goSearch();  ">상태</th>
		               </c:otherwise>
		            </c:choose>
		            
		            <c:choose>
		               <c:when test="${param.sort=='2 desc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▼ 담당자</th>
		               </c:when>
		               <c:when test="${param.sort=='2 asc'}">
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('2 desc'); goSearch(); "> ▲ 담당자</th>
		               </c:when>         
		               <c:otherwise>
		                  <th style="cursor:pointer" onClick="$('[name=sort]').val('2 asc'); goSearch();  ">담당자</th>
		               </c:otherwise>
		            </c:choose>
		            <th>비고</th>
					</thead>
					<tbody>
					<c:forEach items="${eventList}" var="eventList" varStatus="loopTagStatus">
			            <tr style="cursor:pointer" onClick="viewEventInfoForm(${empList.emp_no});">      
			               <td class="delCheckBox" align=center>
			                  <c:if test="${eventList.evnt_stat eq '대기중'|| eventList.evnt_stat eq '반려' }">
			                     <c:if test="${eventList.emp_name eq emp_nm}">
			                        <input type="checkbox" name="delCheckBox" value="${eventList.evnt_no}">
			                     </c:if>
			                  </c:if>
			               </td>
			               <td align=center>${eventAllCnt -eventList.RNUM+1}</td>
			               <td align=center>${eventList.evnt_no}</td>   <!-- <input type="hidden" value="${dep_no}">  -->
			               <td align=center>${eventList.evnt_category}</td>
			               <td align=center>${eventList.evnt_title}</td>
			               <td align=center>${eventList.evnt_start_dt}</td>
			               <td align=center>${eventList.evnt_end_dt}</td>
			               <td align=center>${eventList.evnt_stat}</td>
			               <td align=center>${eventList.emp_name} </td>
			               <td><c:if test="${eventList.evnt_stat eq '대기중'|| eventList.evnt_stat eq '반려'}">                     
			                        <c:if test="${eventList.emp_name eq emp_nm}">
			                           
			                           <input type="button" name="updateBtn" value="수정" onClick="updateEventInfo(this,'${eventList.evnt_no}', '${eventList.evnt_title}', '${eventList.evnt_start_dt}', '${eventList.evnt_end_dt}', '${eventList.evnt_comment}');">
			                  
			                        </c:if>
			                     
			                  </c:if>
			               </td>
			            </tr>      
			            
			            <%-- <tr class="updateArea" style="cursor:pointer" onClick="viewEventInfoForm(${empList.emp_no});">   
			               <td class="delCheckBox" align=center>
			                  <c:if test="${eventList.evnt_stat eq '대기중' }">
			                     <input type="checkbox" name="delCheckBox" value="${eventList.evnt_no}">
			                  </c:if>
			               </td>
			               <td align=center>${eventList.evnt_no}</td>   <!-- <input type="hidden" value="${dep_no}">  -->
			               <td align=center>${eventList.evnt_category}</td>
			               <td align=center>${eventList.evnt_title}</td>
			               <td align=center>${eventList.evnt_start_dt}</td>
			               <td align=center>${eventList.evnt_end_dt}</td>
			               <td align=center>${eventList.evnt_stat}</td>
			            </tr> --%>       
			               </c:forEach>
			               </tbody>
			            </table>
			               <c:if test="${empty eventList}">
			              		<br>
			                  <h5><center>해당 결과가 없습니다.</center></h5>
			               </c:if>
			   
			         </form>
			         &nbsp;<button type='button' align=left class='btn btn-theme04' onClick='deleteNotYetEvent();'><i class='fa fa-eraser'></i> 선택 삭제</button>
			         <div align=center>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
			
			<br>
			
            </div>
            
          </div>
          <!-- /col-md-12 -->
        </div>
        <br>
        <!-- /row -->
        <form name="deleteEvntForm" method="post" action="/group4erp/deleteEvntProc.do">
		      <input type="hidden" name="evnt_no">
		   </form>
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
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</body>

</html>

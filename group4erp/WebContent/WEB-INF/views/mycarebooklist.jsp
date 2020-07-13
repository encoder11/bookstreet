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


/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

 input[type="date"]::-webkit-calendar-picker-indicator,
 input[type="date"]::-webkit-inner-spin-button {
     display: none;
     appearance: none;
 }
 
 input[type="date"]::-webkit-calendar-picker-indicator {
   color: rgba(0, 0, 0, 0); /* 숨긴다 */
   opacity: 1;
   display: block;
   background: url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png) no-repeat; /* 대체할 아이콘 */
   width: 20px;
   height: 20px;
   border-width: thin;
}

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

<script>

   $(document).ready(function(){   

      //goSearchMyWorkList();

      startTime();
      
      $('[name=rowCntPerPageDown]').change(function(){
		   $('[name=rowCntPerPage]').val( $(this).val() );
		   goSearchMyWorkList();
	   });
      
      $(".pagingNumber").html(
            getPagingNumber(
               "${myWorkListAllCnt}"                  //검색 결과 총 행 개수
               ,"${myWorkSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
               ,"${myWorkSearchDTO.rowCntPerPage}"         //페이지 당 출력행의 개수
               ,"10"                              //페이지 당 보여줄 페이지번호 개수
               ,"goSearchMyWorkList();"               //페이지 번호 클릭 후 실행할 자스코드
            )
         );
      inputData("[name=selectPageNo]", "${myWorkSearchDTO.selectPageNo}");
      inputData("[name=rowCntPerPageDown]", "${myWorkSearchDTO.rowCntPerPage}");
      inputData("[name=search_keyword]", "${myWorkSearchDTO.search_keyword}");
      inputData("[name=searchCategory]", "${myWorkSearchDTO.searchCategory}");
      inputData("[name=is_print]", "${myWorkSearchDTO.is_print}");
      inputData("[name=sort]", "${myWorkSearchDTO.sort}");

      /* 
      <c:forEach items="${myWorkSearchDTO.category}" var="category">
         inputData("[name=category]", "${category}");
      </c:forEach>
       */

      $("[name=is_print]").change(function(){
         if ( $(this).is(":checked") ){
            $(this).siblings().prop("checked", false);
         }
         $(this).siblings().prop("checked", false);
      });
   });
   
   function goSearchMyWorkList(){
      if( is_empty('[name=mycarebooklist] [name=search_keyword]') ){
         $('[name=search_keyword]').val("");
      }
      
      //키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
      
      var search_keyword = $('[name=mycarebooklist] [name=search_keyword]').val();
      search_keyword = $.trim(search_keyword);
      
      $('[name=search_keyword]').val(search_keyword);
      //alert($('[name=mycarebooklist]').serialize());
      document.mycarebooklist.submit();
      
      /*
      $.ajax({
         url : "/group4erp/goMyCareBookList.do"
         , type : "post"
        , data : document.mycarebooklist.submit()
      });
      */
   }
   
   function goAllSearchMyWorkList(){
      
      //name=boardListForm을 가진 form 태그 내부의 모든 입력양식에 value값을 비우거나 체크를 푼다.
      document.mycarebooklist.reset();
      
      $('[name=mycarebooklist] [name=rowCntPerPage]').val('10');
      $('[name=mycarebooklist] [name=selectPageNo]').val('1');
      $("[name=mycarebooklist] [name=sort]").val('');
      goSearchMyWorkList();
   }
   
   function booKInvenFill(idx,isbn) {

      //alert("도서 발주 기능 구현중 "+idx+"/"+isbn);
  
        var thisTr = $(idx).parent().parent();
        var trindex = thisTr.index();
        $(idx).addClass('fillbtu');

      //alert('999');
      var delTr = $('[name=mycarebookTable] [name=test]');
      if(delTr.size()>0){
         delTr.remove();
      }
      
      //alert(trindex);
      //$('.mycarebookTable tbody tr:eq('+idx+')').append(" <tr> <td>");
      //$('.mycarebookTable tbody tr:eq('+idx+')').after(" <tr align=center> <td colspan=7> </td> </tr>");
      //var str = $('.qqq').html();
      //var thisTr = $(idx).parent().parent();
      
      
      var wares = "<tr class='test' name='test' align=center bgcolor=white> <td colspan=8>"
      wares += "<div class='www'>"
      wares += "<table width=99%> <tr> <td width=30%> <td width=40% align=center>"
      wares += "⏷<br>[발주 신청]<br>"
      wares += "<td width=30% align=right>"
      wares += "<h3 align=right><i class='fa fa-times' onclick='closeTr();' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3> </table>"
      wares += "<form name='wareHousingForm'>"
      wares += "<table class='searchTable tableth' width=30% align=center>"
      wares += "<tr> <th style='text-align:right;'>발주수량 <td><input type='text' class='form-control round-form' name='isbn_cnt'>"
      wares += "<tr> <th style='text-align:right;'>입고요청일 <td><input type='text' class='form-control round-form' id='datepicker' name='datepicker'>"
      wares += "<tr> <th style='text-align:right;'>공급률 <td><input tyep='text' class='form-control round-form' name='supply_rate' value='60'>&nbsp;&nbsp;&nbsp;<font color=#EF5F83><strong>*(기본 60%)</strong></font>"
      wares += "</table> </from>"
      wares += "<div style='heigth:100;'></div><br>"
      wares += "<button type='button' class='btn btn-default' onclick='goOrderBook("+isbn+");'><input type='image' src='/group4erp/resources/image/order_book.png' width='13' height='13'>발주 신청</button> &nbsp;&nbsp;"
      wares += " </div>"
    	  
      
      thisTr.after(wares);

      $('[name=mycarebookTable] [name=test]').hide();
      $('[name=mycarebookTable] [name=test]').show(1000);
      
      $("#datepicker").datepicker({ 
              dateFormat: 'yy-mm-dd'
             ,minDate : 'today'
           ,onSelect: function() { 
                var dateObject = $(this).datepicker('getDate');
            }
       });   

      
      //$('.mycarebookTable tbody tr:eq('+idx+')').after(wares);
      //$('.mycarebookTable tbody tr:eq('+(idx+1)+') td:eq(0)').html(wares);
      //var sss =  $('.mycarebookTable tbody tr:eq('+(idx+1)+') td:eq(0)').html();
      //alert(sss);
      //return;
      
      /*
      $('[name=wareHousing]').click(function(){
    	  var wareData = "isbn=" + isbn + "&" + $('[name=wareHousingForm]').serialize();
          
          $.ajax({
               url : "/group4erp/myBookWarehousingProc.do"
               , type: "post"
               , data : wareData
               ,success : function(data){
                     if(data == 1){
                        alert("발주 성공");
                        location.replace("/group4erp/goMyCareBookList.do");
                     }else{ alert("발주 실패"); }
               } 
               , error : function(){ alert("서버 접속 실패"); }
            });
      });
 */
   }
   
   function goOrderBook(isbn){
	   
	   var wareData = "isbn=" + isbn + "&" + $('[name=wareHousingForm]').serialize();
       
       $.ajax({
            url : "/group4erp/myBookWarehousingProc.do"
            , type: "post"
            , data : wareData
            ,success : function(data){
                  if(data == 1){
                     //alert("발주 성공");
                     location.replace("/group4erp/goMyCareBookList.do");
                  }else{ alert("발주 실패"); }
            } 
            , error : function(){ alert("서버 접속 실패"); }
         });
   }
   
   function closeTr(){

	   var delTr = $('[name=mycarebookTable] [name=test]');
	   delTr.hide(1000, function(){
		  delTr.remove(); 
	   });

   }
   
   function goAllReset(){
      document.mycarebooklist.reset();
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
              <li class="active">
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
        <h3><i class="fa fa-angle-right"></i> 담당 도서 조회</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
		<form name="mycarebooklist" method="post" action="/group4erp/goMyCareBookList.do">
			<!-- <div class="divcss"> -->
			<input type="hidden" name="emp_no" value="<%=(String)session.getAttribute("emp_id") %>">
			<table class="searchTable" style="border: 0px;">
				<tr>
	               <th width="8%"style="text-align:right;"><b>* 판매 상황&nbsp;</b></th>
	               <td width="13%" align=left>
	                  <input type="checkbox" name="is_print" value="n">절판
	                  <input type="checkbox" name="is_print" value="y">판매중
					<th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
					<td>
						<select name="searchCategory">
	                     <option value="전체">전체
	                     <option value="책번호">책번호
	                     <option value="책이름">책이름
	                     <option value="카테고리">카테고리
	                     <option value="보유지점">보유지점
	                 	 </select>
					<td width="42%"> <input type="text" name="search_keyword" size=78>
					<th>
					<td>
					<th>
					<td  width="20%">
						<button type="button" class="btn btn-default" onclick="goSearchMyWorkList();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="15" height="15">검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goAllSearchMyWorkList();"><input type="image" src="/group4erp/resources/image/searchA.png" width="15" height="15">모두검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goAllReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="15" height="15">초기화</button>
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
			<input type="hidden" name="rowCntPerPage" value="${myWorkSearchDTO.rowCntPerPage}">
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
						<td align=right>[등록 서적] : ${myWorkListAllCnt} 권
						<select name="rowCntPerPageDown">
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
						</select> 행보기
			</table>
			<table><tr><td height="10"></td></tr></table>
             <table class="table table-striped table-advance table-hover table-bordered" name=mycarebookTable width="90%" border=0 cellspacing=0 cellpadding=5>
             <thead>
				<tr>
		            <th width="4%">No
		            <c:choose>
		               <c:when test="${param.sort=='1 desc'}">
		                  <th width="9%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val(''); goSearchMyWorkList();">▼책번호
		               </c:when>
		               <c:when test="${param.sort=='1 asc'}">
		                  <th width="9%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('1 desc'); goSearchMyWorkList();">▲책번호
		               </c:when>
		               <c:otherwise>
		                  <th width="9%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('1 asc'); goSearchMyWorkList();">책번호
		               </c:otherwise>
		         </c:choose> 
		            <c:choose>
		               <c:when test="${param.sort=='2 desc'}">
		                  <th width="25%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val(''); goSearchMyWorkList();">▼책 이름
		               </c:when>
		               <c:when test="${param.sort=='2 asc'}">
		                  <th width="25%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('2 desc'); goSearchMyWorkList();">▲책 이름
		               </c:when>
		               <c:otherwise>
		                  <th width="25%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('2 asc'); goSearchMyWorkList();">책 이름
		               </c:otherwise>
		         </c:choose>
		            <c:choose>
		               <c:when test="${param.sort=='3 desc'}">
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val(''); goSearchMyWorkList();">▼카테고리
		               </c:when>
		               <c:when test="${param.sort=='3 asc'}">
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('3 desc'); goSearchMyWorkList();">▲카테고리
		               </c:when>
		               <c:otherwise>
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('3 asc'); goSearchMyWorkList();">카테고리
		               </c:otherwise>
		         </c:choose>
		            <c:choose>
		               <c:when test="${param.sort=='4 desc'}">
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val(''); goSearchMyWorkList();">▼가격
		               </c:when>
		               <c:when test="${param.sort=='4 asc'}">
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('4 desc'); goSearchMyWorkList();">▲가격
		               </c:when>
		               <c:otherwise>
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('4 asc'); goSearchMyWorkList();">가격
		               </c:otherwise>
		         </c:choose>
		            <c:choose>
		               <c:when test="${param.sort=='13 desc'}">
		                  <th width="7%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val(''); goSearchMyWorkList();">▼수량
		               </c:when>
		               <c:when test="${param.sort=='13 asc'}">
		                  <th width="7%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('13 desc'); goSearchMyWorkList();">▲수량
		               </c:when>
		               <c:otherwise>
		                  <th width="7%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('13 asc'); goSearchMyWorkList();">수량
		               </c:otherwise>
		         </c:choose>
		         <c:choose>
		               <c:when test="${param.sort=='14 desc'}">
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val(''); goSearchMyWorkList();">▼보유지점
		               </c:when>
		               <c:when test="${param.sort=='14 asc'}">
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('14 desc'); goSearchMyWorkList();">▲보유지점
		               </c:when>
		               <c:otherwise>
		                  <th width="8%" style="cursor: pointer"
		                     onclick="$('[name=sort]').val('14 asc'); goSearchMyWorkList();">보유지점
		               </c:otherwise>
		         </c:choose>
		            <th width="8%">비고
					</thead>
					<tbody>
					<c:forEach items="${requestScope.MyCareBookList}" var="MyCareBookList" varStatus="loopTagStatus">
			         <tr>   
			         <td align=center>${myWorkListAllCnt-(myWorkSearchDTO.selectPageNo*myWorkSearchDTO.rowCntPerPage-myWorkSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}
			            <td align=center>${MyCareBookList.ISBN13}
			            <td align=left>${MyCareBookList.BOOK_NAME}
			            <td align=center>${MyCareBookList.CAT_NAME}
			            <td align=center>${MyCareBookList.BOOK_PRICE}
			            <td align=center>${MyCareBookList.ISBN_CNT}
			            <td align=center>${MyCareBookList.BRANCH_NAME}
			            <td align=center>
			               <c:if test="${MyCareBookList.ISBN_CNT < 100}">
			                  <button type='button' class='btn btn-default' onClick="booKInvenFill(this,'${MyCareBookList.ISBN13}');"><input type='image' src='/group4erp/resources/image/order_book.png' width='12' height='12'>발주</button> 
			               </c:if>
			               <c:if test="${MyCareBookList.ISBN_CNT >= 100}">
			                  --
			               </c:if>  
			         </c:forEach>
					</tbody>
			</table>
			<div align=center>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
			<br>
            </div>
          </div>
          <!-- /col-md-12 -->
        </div>
        <br>
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
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

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
  <link href="${ctRootlib}/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${ctRootlib}/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${ctRootlib}/advanced-datatable/css/DT_bootstrap.css" />
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

	startTime();
	
	$("#datepicker1").datepicker({
		dateFormat: 'yy-mm-dd'
		,onClose: function( selectedDate ) {
			$("#datepicker2").datepicker( "option", "minDate", selectedDate );
		} 
	    ,onSelect: function() { 
	        var dateObject = $(this).datepicker('getDate');
	    }
	});
	$("#datepicker2").datepicker({
		dateFormat: 'yy-mm-dd'
		,onClose: function( selectedDate ) {
	        $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
	    }
	    ,onSelect: function() { 
	        var dateObject = $(this).datepicker('getDate');
	    }
	});
	
	 $('[name=rowCntPerPageDown]').change(function(){
		 $('[name=rowCntPerPage]').val( $(this).val() );
		 goSearchRelease();
	 });
	   
	   
	 $(".pagingNumber").html(
			 getPagingNumber(
					 "${releaseListCnt}"                  //검색 결과 총 행 개수
	            	,"${invenSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
	            	,"${invenSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
	            	,"10"                              //페이지 당 보여줄 페이지번호 개수
	            	,"goSearchRelease();"                  //페이지 번호 클릭 후 실행할 자스코드
	            	)
	         );

	 
	 
	 	inputData('[name=searchPublisher]',"${invenSearchDTO.searchPublisher}");
	 
	 inputData('[name=rowCntPerPageDown]',"${invenSearchDTO.rowCntPerPage}");
	 inputData('[name=selectPageNo]',"${invenSearchDTO.selectPageNo}");
	 inputData('[name=keyword1]',"${invenSearchDTO.keyword1}");
	 inputData('[name=dateFrom]',"${invenSearchDTO.dateFrom}");
	 inputData('[name=dateTill]',"${invenSearchDTO.dateTill}");
	 <c:forEach items="${invenSearchDTO.inventory_loc}" var="loc">
		inputData( "[name=inventory_loc]", "${loc}" );
	 </c:forEach>
});

	function goSearchRelease(){
		//alert("검색 기능 구현중");
		//alert( $("[name=bookReleaseSearch]").serialize() );
		//return;
		
		//alert($('[name=dateFrom]').val());
		//return;
		
		document.bookReleaseSearch.submit();
	}

	function goAllSearchRelease(){
		//alert("모두검색 기능 구현중");
		document.bookReleaseSearch.reset();
		//$("[name=book_inventory_search_form] [name=sort]").val('');
		
		$("[name=bookReleaseSearch] [name=selectPageNo]").val(1);
		$("[name=bookReleaseSearch] [name=rowCntPerPage]").val(10);
		$("[name=bookReleaseSearch] [name=sort]").val('');
		
		goSearchRelease();
	}
	
	function goClose(){
		$('[name=thisTr]').hide(1000);
		
		//$('[name=thisTr]').remove();
		
		//$('[name=thisTr]').show(1000);
	}

	
	function goReleaseContentForm(ele,all_order_no){
		/*
		var str = "all_order_no="+all_order_no;
		location.href="/group4erp/goReleaseContentForm.do?"+str;
		*/
		/*
		alert("all_order_no="+all_order_no+"  ele=>"+ele);
		return;
		*/
		var str = "all_order_no="+all_order_no;
		
		var test = $(ele).parent();
		/*
		alert(test.html());
		return;
		*/
	    var delTr = $('[name=thisTr]');
	    if(delTr.size()>0){
	         delTr.remove();
	    }
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goReleaseContentForm.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : str
			, dataType : "JSON"
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(data){
				if(data!=null){
					if(data.check_order_num=='cus'){
						$("#contecntTable1 td:eq(0)").text(data.isbn13);
						$("#contecntTable1 td:eq(1)").text(data.cus_id);
						$("#contecntTable1 td:eq(2)").text(data.book_name);
						$("#contecntTable1 td:eq(3)").text(data.order_delivery_addr);
						$("#contecntTable1 td:eq(4)").text(data.order_dt);
						$("#contecntTable1 td:eq(5)").text(data.book_qty);
						$("#contecntTable1 td:eq(6)").text(data.publisher);
						$("#contecntTable1 td:eq(7)").text(data.book_price);
						$("#contecntTable1 td:eq(8)").text(data.all_book_price);
						$("#contecntTable1 td:eq(9)").text(data.emp_name);
						var insert = "<tr name='thisTr' bgcolor='white'><td colspan=5>"+$("#allContent #contecnt1").html()+"</td></tr>"
						
						test.after(insert);
						$('[name=thisTr]').hide();
						$('[name=thisTr]').show(1000);
						return;
					}
					if(data.check_order_num=='corp'){
						if(data.branch_name==null){
							$("#contecntTable2 td:eq(0)").text(data.isbn13);
							$("#contecntTable2 td:eq(1)").text(data.cus_id);
							$("#contecntTable2 td:eq(2)").text(data.book_name);
							$("#contecntTable2 td:eq(3)").text(data.order_delivery_addr);
							$("#contecntTable2 td:eq(4)").text(data.corp_name);
							$("#contecntTable2 td:eq(5)").text(data.corp_area);
							$("#contecntTable2 td:eq(6)").text(data.ceo_name);
							$("#contecntTable2 td:eq(7)").text(data.order_dt);
							$("#contecntTable2 td:eq(8)").text(data.book_qty);
							$("#contecntTable2 td:eq(9)").text(data.publisher);
							$("#contecntTable2 td:eq(10)").text(data.book_price);
							$("#contecntTable2 td:eq(11)").text(data.all_book_price);
							$("#contecntTable2 td:eq(12)").text(data.emp_name);
							
							var insert = "<tr name='thisTr' bgcolor='white'><td colspan=5>"+$("#allContent #contecnt2").html()+"</td></tr>"
							
							test.after(insert);
							$('[name=thisTr]').hide();
							$('[name=thisTr]').show(1000);
							return;
						}
						if(data.branch_name!=null){
							$("#contecntTable3 td:eq(0)").text(data.isbn13);
							$("#contecntTable3 td:eq(1)").text(data.emp_name);
							$("#contecntTable3 td:eq(2)").text(data.book_name);
							$("#contecntTable3 td:eq(3)").text(data.branch_name);
							$("#contecntTable3 td:eq(4)").text(data.order_dt);
							$("#contecntTable3 td:eq(5)").text(data.book_qty);
							$("#contecntTable3 td:eq(6)").text(data.publisher);
							
							var insert = "<tr name='thisTr' bgcolor='white'><td colspan=5>"+$("#allContent #contecnt3").html()+"</td></tr>"
							
							test.after(insert);
							$('[name=thisTr]').hide();
							$('[name=thisTr]').show(1000);
							return;
							
						}
					}
					
				}
				
				
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
		
	}
	
	function searchToday(){
		
		$('[name=searchToday]').val('y');
		
		var date = new Date();
		
		var todayY = date.getFullYear();
		var todayM = date.getMonth()+1;
		var todayD = date.getDate();
		
		if(todayM<10) todayM = '0'+todayM;
		if(todayD<10) todayD = '0'+todayD;
		
		var today = todayY+'-'+todayM+'-'+todayD;
		
		
		$('[name=dateFrom]').val(today);
		$('[name=dateTill]').val(today);
		
		goSearchRelease();
	}

	
	function goReleaseUp(all_order_no){
		
		var str = "all_order_no="+all_order_no;
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goReleaseUp.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : str
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(updateCnt){
				if(updateCnt==1){
					//alert("출고 날짜 등록 성공");
					location.replace("/group4erp/goReleaseList.do")
				}else if(updateCnt==0){
					alert("출고 날짜 등록 실패");
				}else if(updateCnt==-1){
					alert("재고가 부족합니다!");
				}else { alert("서버 오류!"); }
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
	}

	function goReset(){
		document.bookReleaseSearch.reset();
		//$('[name=bookReleaseSearch]').reset();
	}
	
	function goCorpTranSpec(){
		location.replace("/group4erp/viewTranSpecList.do");
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
            <a class="active" href="javascript:;">
              <i class="fa fa-shopping-cart"></i>
              <span>재고 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/goBookList.do"><i class="fa fa-info-circle"></i>도서정보조회</a>
              </li>
              <li class="active">
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
        <table width=99%> <tr> <td>

        <h3><i class="fa fa-angle-right"></i> 출고 현황</h3>
       <td align=right>
       <button type="button" class="btn btn-theme03" onclick="goCorpTranSpec();"><i class="fa fa-book"></i> 사업자 거래내역 조회</button>
      </table>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
			<form name="bookReleaseSearch"  method="post" action="/group4erp/goReleaseList.do">
			<!-- <div class="divcss"> -->
			<table class="searchTable" style="border: 0px;">
				<tr>
					<th width="8%" style="text-align:right;"><b>* 지역&nbsp;</b></th>
					
					<td width="42%" align=left>
					<c:forEach items="${requestScope.inventory_loc}" var="inven" varStatus="loopTagStatus">
             			&nbsp;&nbsp;<input type="checkbox" name="inventory_loc" value="${inven.branch_name}">${inven.branch_name}
            		</c:forEach>
            		</td>
            		<th width="8%" style="text-align:right;"><b>* 출판사&nbsp;</b>
					<td align=left>
						<select name="searchPublisher">
								<option value="" >--------</option>
							<c:forEach items="${requestScope.publisher}" var="publisher" varStatus="loopTagStatus">
								<option value="${publisher.publisher}">${publisher.publisher}</option>
							</c:forEach>
						</select>
				<tr>
					<th width="8%" style="text-align:right;"><b>* 일자&nbsp;</b>
					<td colspan=2 width="42%" align=left>
						<input type="text" id="datepicker1" name="dateFrom" size=30>
						&nbsp; ~ &nbsp;
						<input type="text" id="datepicker2" name="dateTill" size=30>&nbsp;&nbsp;
						<button type="button" class="btn btn-default" onclick="searchToday();"><i class="fa fa-calendar-o"></i>금일 검색</button>
				<tr>
					<th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
					<td width="42%"> <input type="text" name="keyword1" size=76>
					<th>
					<td>
					<th>
					<td  width="20%">
						<button type="button" class="btn btn-default" onclick="goSearchRelease();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="15" height="15">검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goAllSearchRelease();"><input type="image" src="/group4erp/resources/image/searchA.png" width="15" height="15">모두검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="15" height="15">초기화</button>
			</table>

			<br>
			<!-- </div> -->
			
			<input type="hidden" name="selectPageNo">
			<input type="hidden" name="rowCntPerPage" value="${invenSearchDTO.rowCntPerPage}">
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
						<td align=right> [검색 수량] : ${releaseListCnt} 개
						<select name="rowCntPerPageDown">
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
						</select> 행보기
			</table>
			<table><tr><td height="10"></td></tr></table>
             <table class="table table-striped table-advance table-hover table-bordered">
             <thead>
				<tr>
				<th width="10%">No
				<c:choose>
							<c:when test="${param.sort=='r.release_no desc'}">
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchRelease();">▼출고번호
							</c:when>
							<c:when test="${param.sort=='r.release_no asc'}">
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val('r.release_no desc'); goSearchRelease();">▲출고번호
								
							</c:when>
							<c:otherwise>
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val('r.release_no asc'); goSearchRelease();">출고번호
							</c:otherwise>
					</c:choose> 
						
					<c:choose>
							<c:when test="${param.sort=='r.release_dt desc'}">
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchRelease();">▼출고일시
								
							</c:when>
							<c:when test="${param.sort=='r.release_dt asc'}">
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val('r.release_dt desc'); goSearchRelease();">▲출고일시
								
							</c:when>
							<c:otherwise>
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val('r.release_dt asc'); goSearchRelease();">출고일시
								
							</c:otherwise>
					</c:choose> 
					
					<c:choose>
							<c:when test="${param.sort=='3 desc'}">
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchRelease();">▼주문번호
							</c:when>
							<c:when test="${param.sort=='3 asc'}">
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val('3 desc'); goSearchRelease();">▲주문번호
							</c:when>
							<c:otherwise>
								<th width="20%" style="cursor: pointer"
									onclick="$('[name=sort]').val('3 asc'); goSearchRelease();">주문번호
							</c:otherwise>
					</c:choose>
				<th width="10%">비고
					</thead>
					<tbody>
					<c:forEach items="${requestScope.releaseList}" var="release" varStatus="loopTagStatus">
			            <tr>
				          	<td style="cursor:pointer" onClick="goReleaseContentForm(this,${release.all_order_no});" align=center>
				          	${releaseListCnt-(invenSearchDTO.selectPageNo*invenSearchDTO.rowCntPerPage-invenSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}
				            <td style="cursor:pointer" onClick="goReleaseContentForm(this,${release.all_order_no});" align=center>${release.release_no}
				            <td style="cursor:pointer" onClick="goReleaseContentForm(this,${release.all_order_no});" align=center>${release.release_dt}
				            <td style="cursor:pointer" onClick="goReleaseContentForm(this,${release.all_order_no});" align=center>${release.all_order_no}
			            	<c:if test="${release.release_dt=='X'}">
			            		<td align=center>
			            		<input type="button" value="출고" onclick="goReleaseUp(${release.all_order_no});">
			            	</c:if>
			            	<c:if test="${release.release_dt.length()>1}">
			            		<td style="cursor:pointer" onClick="goReleaseContentForm(this,${release.all_order_no});" align=center>	
			            		------
			            	</c:if>
		         	</c:forEach>
					</tbody>

			</table>

			<br>
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
    <div id="allContent" style="display:none;">
		<div id="contecnt1" style="dispaly:none;">
			<table width=99%> <tr> <td width=30%> <td width=40% align=center>
	 			⏷<br>[상세 정보]<br>
	 				<td width=30% align=right>
						<h3 align=right><i class='fa fa-times' onclick='goClose();' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3>
			</table>
			<table class="searchTable searchTable-bordered tableth" width="50%" id="contecntTable1"  align=center>

				<tr>
					<th>책번호
					<td colspan=2>
					<th>고객ID
					<td colspan=2>
				<tr>
					<th>책이름
					<td colspan=5>
				<tr>
					<th>고객 배송지
					<td colspan=5>
				<tr>
					<th>주문일시
					<td>555
					<th>주문 수량
					<td>
					<th>출판사
					<td>
				<tr>
					<th>책가격
					<td>
					<th>총 가격
					<td>
					<th>담당직원
					<td>
			</table>
		</div>
		
		<div id="contecnt2" style="dispaly:none;">

			<table width=99%> <tr> <td width=30%> <td width=40% align=center>
	 			⏷<br>[상세 정보]<br>
	 				<td width=30% align=right>
						<h3 align=right><i class='fa fa-times' onclick='goClose();' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3>

			</table>

			<table class="searchTable searchTable-bordered tableth" width="50%" id="contecntTable2" align=center>

				<tr>
					<th>책번호
					<td colspan=2>
					<th>사업자ID
					<td colspan=2>
				<tr>
					<th>책이름
					<td colspan=5>
				<tr>
					<th>사업자 배송지
					<td colspan=5>
				<tr>
					<th>회사명
					<td>
					<th>분야
					<td>
					<th>대표자명
					<td>
				<tr>
					<th>주문일시
					<td>
					<th>주문 수량
					<td>
					<th>출판사
					<td>
				<tr>
					<th>책가격
					<td>
					<th>총 가격
					<td>
					<th>담당직원
					<td>
			</table>
		</div>
		
		<div id="contecnt3" style="dispaly:none;">
			<table width=99%> <tr> <td width=30%> <td width=40% align=center>
	 			⏷<br>[상세 정보]<br>
	 				<td width=30% align=right>
						<h3 align=right><i class='fa fa-times' onclick='goClose();' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3>
			</table>

			<table class="searchTable searchTable-bordered tableth" width="50%" id="contecntTable3" align=center>
				<tr>
					<th>책번호
					<td colspan=2>
					<th>담당직원
					<td colspan=2>
				<tr>
					<th>책이름
					<td colspan=5>
				<tr>
					<th>지사 위치
					<td colspan=5>$
				<tr>
					<th>주문일시
					<td>
					<th>주문 수량
					<td>
					<th>출판사
					<td>
			</table>
		</div>
	</div>
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
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="${ctRootlib}/advanced-datatable/js/DT_bootstrap.js"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</body>

</html>

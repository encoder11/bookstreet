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
	text-align: center;
	font-weight: bold;
}

</style>

<script>
		/* var picker = new Pikaday({ 
			 field: document.getElementById('datepicker'),
			 format: 'yyyy-MM-dd',
			 toString(date, format) {
			   let day = ("0" + date.getDate()).slice(-2);
			   let month = ("0" + (date.getMonth() + 1)).slice(-2);
			   let year = date.getFullYear();
			   return `${year}-${month}-${day}`;
		 }
		}) */;
	
		$(document).ready(function(){

/* 			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			}); */

			startTime();
			
			 $('[name=rowCntPerPageDown]').change(function(){
				 $('[name=rowCntPerPage]').val( $(this).val() );
				 goWhSearch();
			 });

 			setTableTrBgColor(
					"tableColor",			//테이블 class 값
					"${headerColor}",		//헤더 tr 배경색
					"${oddTrColor}",		//홀수행 배경색
					"${evenTrColor}",		//짝수행 배경색
					"${mouseOverColor}"		//마우스 온 시 배경색
			);
			
			var thSibling = $("#thisTable tr:eq(0)").siblings()
			//var thSiblingOdd = thSibling.filter(":odd");
			//var thSiblingEven =	thSibling.filter(":even");
			//thSibling.click(function(){
					//$(this).html(<b></b>);
					//$(this).attr('bgcolor', 'yellow');
					//$(this).siblings().removeAttr("bgcolor");
			//});
			
 			$(".pagingNumber").html(
				getPagingNumber(
					"${warehousingListCnt}"					//검색 결과 총 행 개수
					,"${warehousingSearchDTO.selectPageNo}"		//선택된 현재 페이지 번호
					,"${warehousingSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"									//페이지 당 보여줄 페이지번호 개수
					,"goWhSearch();"							//페이지 번호 클릭 후 실행할 자스 코드
				)
			); 


 			$("#dateFrom").datepicker({
			    onSelect: function() { 
			    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
			        var dateObject = $(this).datepicker('getDate');
			        //alert(dateObject.val()); 
			    }
			});
 			$("#dateTill").datepicker({
			    onSelect: function() { 
			    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
			        var dateObject = $(this).datepicker('getDate');
			        //alert(dateObject.val()); 

			    }     
			});

			inputData( "[name=selectPageNo]", "${warehousingSearchDTO.selectPageNo}" );	
			inputData( "[name=rowCntPerPageDown]", "${warehousingSearchDTO.rowCntPerPage}" );
		    inputData('[name=wh_keyword]',"${warehousingSearchDTO.wh_keyword}");
		    inputData( "[name=dateFrom]", "${warehousingSearchDTO.dateFrom}" );
		    inputData( "[name=dateTill]", "${warehousingSearchDTO.dateTill}" );
		    <c:forEach items="${warehousingSearchDTO.wh_loc}" var="loc">
				inputData( "[name=wh_loc]", "${loc}" );
			</c:forEach>

		});
	
		function goWhSearch(){
			//alert($("[name=datepicker]").val());
			//alert($("[name=InoutListDate]").serialize());
			//var keyword1 = $("[name=InoutListDate] [name=keyword1]").val();
			//keyword1 = $.trim(keyword1);
			//$("[name=InoutListDate] [name=keyword1]").val(keyword1);
			//alert( $('[name=searchToday]').val() );
			//return;
			//alert( $("[name=dateFrom]").val() );
			//alert( $("[name=dateTill]").val() );
			
			//alert( $('[name=warehousingSearchForm]').serialize() );
			//return;
			
			document.warehousingSearchForm.submit();
		}

		function goTodaySearch(){
			$('[name=searchToday]').val('y'); 
			inputData( "[name=dateFrom]", null );
		    inputData( "[name=dateTill]", null );
		    /* alert( $("[name=dateFrom]").val() );
		    alert( $("[name=dateTill]").val() ); */
			goWhSearch();
		}

		function goWhSearchAll(){
			document.warehousingSearchForm.reset();
			$("[name=warehousingSearchForm] [name=selectPageNo]").val(1);
			$("[name=warehousingSearchForm] [name=rowCntPerPage]").val(10);
			$("[name=warehousingSearchForm] [name=sort]").val('');
			goWhSearch();
			
		}

		function goWarehousingContent(ele,order_inven_no ){
			//alert($(ele).parent().html());
			var test = $(ele).parent();

		    var delTr = $('[name=thisTr]');
		    if(delTr.size()>0){
		         delTr.remove();
		    }
			$.ajax({
				//alert( $('[name=warehousingSearchForm]').serialize() );
            	//-----------------------------
                // 호출할 서버쪽 URL 주소 설정
                //-----------------------------
                url : "/group4erp/warehousingContentProc.do"
                //----------------
                // 전송 방법 설정
                //----------------
                , type: "post"
                //--------------------------------------------
                // 서버로 보낼 파라미터명과 파라미터값을 설정       param1=aaaa&param2=zzzz
                //--------------------------------------------
                , data : "order_inven_no="+order_inven_no
                //, dataType:"JSON"
                //-----------------------------------------------------------
                // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
                // 매개변수 upDelCnt 에는 수정/삭제 적용행의 개수가 들어온다
                //-----------------------------------------------------------
                ,success : function(data){
                   	if(data != null){
                       		$("#contentTable td:eq(0)").text(data.emp_name);
                       		$("#contentTable td:eq(1)").text(data.order_dt);
                       		$("#contentTable td:eq(2)").text(data.order_stock_cnt);
                       		$("#contentTable td:eq(3)").text(data.cost);
                       		$("#contentTable td:eq(4)").text(data.supply_rate);
                       		$("#contentTable td:eq(5)").text(data.store_req_dt);
                       		$("#contentTable td:eq(6)").text(data.branch_name);
                       		$("#contentTable td:eq(7)").text(data.isbn);
                       		$("#contentTable td:eq(8)").text(data.book_name);
                       		$("#contentTable td:eq(9)").text(data.book_publisher);
                       		$("#contentTable td:eq(10)").text(data.cat_name);
							//$("#contecnt").css("display", "block");	
							setTableTrBgColor(
									"tableColor",			//테이블 class 값
									"${headerColor}",		//헤더 tr 배경색
									"${oddTrColor}",		//홀수행 배경색
									"${evenTrColor}",		//짝수행 배경색
									"${mouseOverColor}"		//마우스 온 시 배경색
							);
							var insert = "<tr name='thisTr' bgcolor='white'><td colspan=5>"+$("#contecnt").html()+"</td></tr>"
							
							test.after(insert);
							
							$('[name=thisTr]').hide();
							$('[name=thisTr]').show(1000);
							
                   	}
							//$("#thisTable tr:eq(0)").siblings().click(function(){
	                        //}); 
                } 
                //---------------------------------------------------
                // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
                //---------------------------------------------------
                , error : function(){
                   alert("서버 접속 실패");
                }
             });

		}
		
		function closeDiv(close){
			/* $("#contecnt").css("display", "none");	
			$("#thisTable tr").removeAttr("bgcolor"); */
			$('[name=thisTr]').hide(1000);
	    }

	    function goWhConfirm(wh_no){
			alert(wh_no);

			$.ajax({
	            	//-----------------------------
	                // 호출할 서버쪽 URL 주소 설정
	                //-----------------------------
	                url : "/group4erp/whConfirmProc.do"
	                //----------------
	                // 전송 방법 설정
	                //----------------
	                , type: "post"
	                //--------------------------------------------
	                // 서버로 보낼 파라미터명과 파라미터값을 설정
	                //--------------------------------------------
	                , data : "wh_no="+wh_no
	                //-----------------------------------------------------------
	                // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
	                // 매개변수 upDelCnt 에는 수정/삭제 적용행의 개수가 들어온다
	                //-----------------------------------------------------------
	                ,success : function(whConfirmCnt){
		                	if(whConfirmCnt == 1){
			                      alert("입고가 확인되었습니다");
			                      goWhSearch();
			                      
			                }
//		                	else if(upDelCnt==-1){
//		                		alert("게시물이 삭제되어 수정할 수 없습니다.");	
//		                	}
//		                	else if(upDelCnt==-2){
//		                		alert("비밀번호가 잘못 입력되었습니다.");	
//		                	} 
			                else{
			                      alert("서버쪽 DB 연동 실패");
			                }
	                } 
	                //---------------------------------------------------
	                // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
	                //---------------------------------------------------
	                , error : function(){
	                   alert("서버 접속 실패");
	                }
	             });
		}


		function goReset(){
				document.warehousingSearchForm.reset();
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
              <li>
                <a href="/group4erp/goReleaseList.do"><i class="fa fa-list"></i>출고현황조회</a>
              </li>
              <li class="active">
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
        <h3><i class="fa fa-angle-right"></i> 입고 현황</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
			<form name="warehousingSearchForm"  method="post" action="/group4erp/goWarehousingList.do">
			<!-- <div class="divcss"> -->
			<table class="searchTable" style="border: 0px;">
				<tr>
					<th width="8%" style="text-align:right;"><b>* 지역&nbsp;</b></th>
					<td width="42%" align=left>
					<c:forEach items="${requestScope.branch}" var="branch" varStatus="loopTagStatus">
						&nbsp;&nbsp;<input type="checkbox" name="wh_loc" value="${loopTagStatus.index+1}">${branch.branch}
         			</c:forEach>
            		</td>
            		<th width="8%" style="text-align:right;"><b>* 출판사&nbsp;</b>
					<td align=left>
						<select name="searchPublisher">
							<option value="">--------</option>
							<c:forEach items="${requestScope.publisher}" var="publisher" varStatus="loopTagStatus">
								<option value="${publisher.publisher}">${publisher.publisher}</option>
							</c:forEach>
				<tr>
					<th width="8%" style="text-align:right;"><b>* 일자&nbsp;</b>
					<td colspan=2 width="42%" align=left>
						<input type="text" id="dateFrom" name="dateFrom" size=30>
						&nbsp; ~ &nbsp;
						<input type="text" id="dateTill" name="dateTill" size=30>&nbsp;&nbsp;
						<button type="button" class="btn btn-default" onclick="goTodaySearch();"><i class="fa fa-calendar-o"></i>금일 검색</button>
				<tr>
					<th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
					<td width="42%"> <input type="text" name="wh_keyword" size=76>
					<th>
					<td>
					<th>
					<td  width="20%">
						<button type="button" class="btn btn-default" onclick="goWhSearch();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="15" height="15">검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goWhSearchAll();"><input type="image" src="/group4erp/resources/image/searchA.png" width="15" height="15">모두검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="15" height="15">초기화</button>
			</table>

			<br>
	
			<!-- </div> -->
			
			<input type="hidden" name="searchToday">
			<input type="hidden" name="selectPageNo" value="${warehousingSearchDTO.selectPageNo}">
			<input type="hidden" name="rowCntPerPage" value="${warehousingSearchDTO.rowCntPerPage}">
			<!-- header sort를 하기 위한 hidden Tag -->
			<input type="hidden" name="sort">
			<script>
	        $("#dateFrom").datepicker({ dateFormat: 'yy-mm-dd', onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#dateTill").datepicker( "option", "minDate", selectedDate );
            }       });
	        $("#dateTill").datepicker({ dateFormat: 'yy-mm-dd', onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#dateFrom").datepicker( "option", "maxDate", selectedDate );
            }  });
	    	</script>
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
						<td align=right> [검색 수량] : ${warehousingListCnt} 개
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
            <th width="10%">No</th>
            
	           	<c:choose>
					<c:when test="${param.sort=='wh_no desc'}">
						<th width="20%" style="cursor: pointer"
							onclick="$('[name=sort]').val(''); goWhSearch();">▼입고번호
					</c:when>
					<c:when test="${param.sort=='wh_no asc'}">
						<th width="20%" style="cursor: pointer"
							onclick="$('[name=sort]').val('wh_no desc'); goWhSearch();">▲입고번호
						
					</c:when>
					<c:otherwise>
						<th width="20%" style="cursor: pointer"
							onclick="$('[name=sort]').val('wh_no asc'); goWhSearch();">입고번호
					</c:otherwise>
				</c:choose> 
						
				<c:choose>
						<c:when test="${param.sort=='wh_dt desc'}">
							<th width="20%" style="cursor: pointer"
								onclick="$('[name=sort]').val(''); goWhSearch();">▼입고일
							
						</c:when>
						<c:when test="${param.sort=='wh_dt asc'}">
							<th width="20%" style="cursor: pointer"
								onclick="$('[name=sort]').val('wh_dt desc'); goWhSearch();">▲입고일
							
						</c:when>
						<c:otherwise>
							<th width="20%" style="cursor: pointer"
								onclick="$('[name=sort]').val('wh_dt asc'); goWhSearch();">입고일
							
						</c:otherwise>
				</c:choose> 
				
				<c:choose>
						<c:when test="${param.sort=='order_inven_no desc'}">
							<th width="20%" style="cursor: pointer"
								onclick="$('[name=sort]').val(''); goWhSearch();">▼주문발주번호
						</c:when>
						<c:when test="${param.sort=='order_inven_no asc'}">
							<th width="20%" style="cursor: pointer"
								onclick="$('[name=sort]').val('order_inven_no desc'); goWhSearch();">▲주문발주번호
						</c:when>
						<c:otherwise>
							<th width="20%" style="cursor: pointer"
								onclick="$('[name=sort]').val('order_inven_no asc'); goWhSearch();">주문발주번호
						</c:otherwise>
				</c:choose>
            <th width="10%">입고</th>
          </tr>
					</thead>
					<tbody>
					 <c:forEach items="${requestScope.warehousingList}" var="warehousing" varStatus="loopTagStatus">
							<tr class="trcolor" style="cursor:pointer">
								<td align=center onClick="goWarehousingContent(this,${warehousing.order_inven_no});">
								${warehousingListCnt-(warehousingDTO.selectPageNo*warehousingDTO.rowCntPerPage-warehousingDTO.rowCntPerPage+1+loopTagStatus.index)+1}
								</td>
								<td align=center onClick="goWarehousingContent(this,${warehousing.order_inven_no});">${warehousing.wh_no}</td>
								<td align=center onClick="goWarehousingContent(this,${warehousing.order_inven_no});">${warehousing.wh_dt}</td>
								
								<td align=center onClick="goWarehousingContent(this,${warehousing.order_inven_no});">${warehousing.order_inven_no}</td>
								<c:if test="${empty warehousing.wh_dt}">
									<td align=center> <input type="button" value="입고" onclick="goWhConfirm(${warehousing.wh_no});"></td>
								</c:if>
								<c:if test="${!empty warehousing.wh_dt}">
									<td align=center onClick="goWarehousingContent(this,${warehousing.order_inven_no});">&nbsp;</td>
								</c:if>
							</tr>
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
   <div id="contecnt" style="display:none;">
		<table width=99%> <tr> <td width=30%> <td width=40% align=center>
			⏷<br>[상세 정보]<br>
			<td width=30% align=right>
			<h3 align=right><i class='fa fa-times' onclick='closeDiv(this);' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3>
		</table>
		<table class="searchTable searchTable-bordered tableth" width="50%" id="contentTable" align=center>
			<tr>
				<th class="thcolor">주문자</th>  
				<th class="thcolor">발주신청일 </th> 
				<th class="thcolor">발주수량</th> 
				<th class="thcolor">발주금액</th> 
				<th class="thcolor">공급률</th> 
				<th class="thcolor">입고요청일</th> 
			</tr>	
			<tr align=center>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th class="thcolor">지사</th> 
				<th class="thcolor">ISBN</th> 
				<th class="thcolor" colspan=2>책이름</th> 
				<th class="thcolor">출판사</th>
				<th class="thcolor">카테고리</th>
			</tr>
			<tr align=center>
				<td></td>
				<td></td>
				<td colspan=2></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<!-- <div height=3></div> -->
		<!-- <table><tr height=1 border=0><td></td></tr></table> -->
		
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

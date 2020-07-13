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
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="${ctRootImg}/favicon.png" rel="icon">
  <link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${ctRootlib}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${ctRootlib}/font-awesome/css/font-awesome.css" rel="stylesheet" />
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
</style>

<script>

var basePrice = null;
var basePages = null;
var baseCnt = null;

$(document).ready(function(){
	
	startTime();
	
	$("#published_dt").datepicker({
		dateFormat: 'yy-mm-dd'
	    ,onSelect: function() { 
	    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
	        var dateObject = $(this).datepicker('getDate');

	    }
	});
	
	var basePrice = $('[name=book_price]').val();
	var basePages = $('[name=book_pages]').val();
	var baseCnt = $('[name=isbn_cnt]').val();
	
	inputData("[name=size_name]", "${bookInfo.size_name}");
	inputData("[name=branch_name]", "${bookInfo.branch_name}");
	
});
	function goBack(){
		history.go(-1);
	}
	
	function bookInfoUp(){
		//alert( $('[name=bookContentUpB]').serialize() );
		//return;
	
		var bookContentUp = $('[name=bookContentUpA]').serialize()+"&"+$('[name=bookContentUpB]').serialize();
		
		//alert(bookContentUp);
		
		if( is_empty('[name=book_name]') ){
			alert("책 제목을 입력해주세요.");
			$("[name=book_name]").focus();
			return;
		}
		if( is_empty('[name=cat_name]') ){
			alert("카테고리를 입력해주세요.");
			$("[name=cat_name]").focus();
			return;
		}
		if( is_empty('[name=book_price]') ){
			alert("책 가격을 입력해주세요.");
			$("[name=book_price]").focus();
			return;
		}
		if( is_empty('[name=book_pages]') ){
			alert("페이지 수를 입력해주세요.");
			$("[name=book_pages]").focus();
			return;
		}
		if( is_empty('[name=writer]') ){
			alert("저자를 입력해주세요.");
			$("[name=writer]").focus();
			return;
		}
		if( is_empty('[name=publisher]') ){
			alert("출판사를 입력해주세요.");
			$("[name=publisher]").focus();
			return;
		}
		if( is_empty('[name=size_name]') ){
			alert("판형을 선택해주세요.");
			$("[name=size_name]").focus();
			return;
		}
		if( is_empty('[name=is_print]') ){
			alert("판매여부를 선택해주세요.");
			$("[name=is_print]").focus();
			return;
		}
		if( is_empty('[name=emp_name]') ){
			alert("도서 담당직원의 이름을 입력해주세요.");
			$("[name=emp_name]").focus();
			return;
		}
		if( is_empty('[name=published_dt]') ){
			alert("출판일을 입력해주세요.");
			$("[name=published_dt]").focus();
			return;
		}
		if( is_empty('[name=editor]') ){
			alert("출판사 담당직원 이름을 입력해주세요.");
			$("[name=editor]").focus();
			return;
		}
		if( is_empty('[name=branch_name]') ){
			alert("재고 위치를 선택해주세요.");
			$("[name=branch_name]").focus();
			return;
		}
		
		/*
		var checkPirce = $('[name=book_price]').val();
		if(isNaN(checkPirce)==true){
			alert("책 가격은 숫자만 기입해주세요");
			//$('[name=book_price]').val();
			return;
		}
		*/
		var checkPages = $('[name=book_pages]').val();
		if(isNaN(checkPages)==true){
			alert("페이지 수는 숫자만 기입해주세요");
			//$('[name=book_pages]').val(basePages);
			return;
		}
		var checkCnt = $('[name=isbn_cnt]').val();
		if(isNaN(checkCnt)==true){
			alert("재고량은 숫자만 기입해주세요");
			//$('[name=isbn_cnt]').val(baseCnt);
			return;
		}
		
		
		var checkEditor = $('[name=editor]').val();
		if(isFinite(checkEditor)==true){
			alert("출판사 담당 직원은 문자만 기입해주세요");
			//$('[name=isbn_cnt]').val(baseCnt);
			return;
		}
		var checkEmp_name = $('[name=emp_name]').val();
		if(isFinite(checkEmp_name)==true){
			alert("담당직원은 문자만 기입해주세요");
			//$('[name=isbn_cnt]').val(baseCnt);
			return;
		}
		
		/*
		var arrayPirce = [];
		
		arrayPirce = checkPirce.split("");
		
		for(var i=0 ; i<arrayPrice.length ; i++){
			alert("전"+arrayPrice[i]);
			if(arrayPrice[i]==','){
				arrayPrice[i].push('');
			}
			alert("후"+arrayPrice[i]);
		}
		*/
		
		if(confirm("정말 수정하시겠습니까?")==false){return;}
		
		$.ajax({
			url : "/group4erp/goBookInfoUpProc.do"
			, type : "post"
			, data : bookContentUp
			, success : function(upCnt){
				if(upCnt==1){
					//alert('책 수정 성공');
					location.replace("/group4erp/goBookList.do");
					return;
				}else if(upCnt==0){
					alert("책 수정 실패");
					return;
				}else if(upCnt==-2){
					alert("지사 수정 실패"); 
				}else alert("DB 오류");
				
			}
			, error : function(){
				alert("서버 접속 실패");
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
              <li>
                <a href="/group4erp/goMyWorkTime.do"><i class="fa fa-list"></i>근태 조회</a>
              </li>
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
              <li class="active">
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
              <!-- <a href="/group4erp/viewEmpWorkStateList.do"><i class="fa fa-list"></i>직원별 근무현황</a>
              </li> -->  
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
      <section class="wrapper">
      	<table border=0 cellpadding=0 cellspace=0 width="98%">
      	<tr>
      	<td widtj=50%>
      	<h3 align=left><i class="fa fa-angle-right"></i>서적 상세정보</h3>
      	<td widtj=50%>
      	<h3 align=right><i class="fa fa-arrow-left" onclick="goBack();" style="cursor:pointer;"></i></h3>
        </table>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i> 서적 정보 </h4>
              <form name="bookContentUpA" class="form-horizontal style-form" method="get">
                <div class="form-group">
                <!-- 
                  <div class="col-lg-12 col-md-4">
                    <p class="centered">
            			<a href="profile.html"><img src="${ctRootImg}/ui-sam.jpg" class="img-circle" width="80"></a>
         			</p>
                  </div>
                   -->
                  <label class="col-sm-1 col-sm-1 control-label">책 이름</label>
                  <div class="col-sm-7">
                    <input type="text" class="form-control" name="book_name" value="${bookInfo.book_name}">
                  </div>
                </div>
               <div class="form-group">
                  <label class="col-sm-1 col-sm-1 control-label">ISBN13</label>
                  <div class="col-sm-3">
                   <p class="form-control-static">${bookInfo.isbn13}</p>
                   <input type="hidden" name="isbn13" value="${bookInfo.isbn13}">
                  </div>
                  <label class="col-sm-1 col-sm-1 control-label">카테고리</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="cat_name" value="${bookInfo.cat_name}">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-1 col-sm-1 control-label">가격</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="book_price" value="${bookInfo.book_price}">
                  </div>
                  <label class="col-sm-1 col-sm-1 control-label">판매여부</label>
                  <div class="col-sm-3">
                    <c:if test="${bookInfo.is_print=='y'}">
						<input type="radio" name="is_print" value="y" checked>판매중
						<input type="radio" name="is_print" value="n">절판
					</c:if>
					<c:if test="${bookInfo.is_print=='n'}">
						<input type="radio" name="is_print" value="y">판매중
						<input type="radio" name="is_print" value="n" checked>절판
					</c:if>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-1 col-sm-1 control-label">페이지수</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="book_pages" value="${bookInfo.book_pages}">
                  </div>
                  <label class="col-sm-1 col-sm-1 control-label">판형</label>
                  <div class="col-sm-3">
                    <select name="size_name">
						<option value="신국판">신국판
						<option value="국판">국판
						<option value="46판">46판
						<option value="46배판">46배판
						<option value="크라운판">크라운판
						<option value="국배판">국배판
						<option value="타블로이드">타블로이드
						<option value="기타">기타
					</select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-1 col-sm-1 control-label">서적담당자</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="emp_name" value="${bookInfo.emp_name}">
                  </div>
                  <label class="col-sm-1 col-sm-1 control-label">저자</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="writer" value="${bookInfo.writer}">
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- col-lg-12-->
        </div>
        <!-- /row -->
        <!-- INLINE FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i> 서적 외 정보</h4>
               <form name="bookContentUpB" class="form-horizontal style-form" method="get">
                <div class="form-group">
                  <label class="col-sm-1 col-sm-1 control-label">출판사</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="publisher" value="${bookInfo.publisher}">
                  </div>
                  <label class="col-sm-1 col-sm-1 control-label">출판사 직원</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="editor" value="${bookInfo.editor}">
                  </div>
                  <label class="col-sm-1 col-sm-1 control-label">출판일</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" name="published_dt" id="published_dt" value="${bookInfo.published_dt}">
                  </div>
                 </div>
                <div class="form-group">
                  <label class="col-sm-1 col-sm-1 control-label">재고 위치</label>
                  <div class="col-sm-5">
                    <select name="branch_name">
					<c:forEach items="${requestScope.inventory_loc}" var="inven" varStatus="loopTagStatus">
             			<option value="${inven.branch_name}">${inven.branch_name}
             		</c:forEach>
             		</select>
                  </div>
                  <label class="col-sm-1 col-sm-1 control-label">재고 량</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="isbn_cnt" value="${bookInfo.isbn_cnt}">
                  </div>
                 </div>
                </form>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
        </div>
        <!-- /row -->
        <!-- INPUT MESSAGES -->
       <br>
        <button type="button" class="btn btn-theme02" onclick="bookInfoUp();"><i class="fa fa-check"></i> 수정</button>
       
        <!-- /row -->
        <!-- INPUT MESSAGES -->
        <!-- /row -->
      </section>
      <!-- /wrapper -->
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

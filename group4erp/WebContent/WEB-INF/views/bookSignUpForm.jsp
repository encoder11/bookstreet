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
$(document).ready(function(){
	
	startTime();
	
	$("#datepicker").datepicker({
		dateFormat: 'yy-mm-dd'
	    ,onSelect: function() { 
	    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
	        var dateObject = $(this).datepicker('getDate');

	    }
	});
	
	 $('[name=is_print_Y]').click(function(){
    	 $('[name=is_print]').val('y'); 
      });
     $('[name=is_print_N]').click(function(){
     	 $('[name=is_print]').val('n'); 
     });
	
     
     $('[name=isbn13]').val('9791188388905');
     $('[name=book_name]').val('에이트');
	   inputData('[name=cat_cd]',"4");
     $('[name=book_price]').val('17000');
     $('[name=book_pages]').val('308');
     $('[name=writer]').val('이지성');
     $('[name=publisher]').val('차이정원');
     inputData('[name=size_cd]',"8");
	   inputData('[name=is_print]',"y");
     $('[name=emp_name]').val('노은서');
     $('[name=datepicker]').val('2019-10-21');
     $('[name=editor]').val('신애라');
     
     
});

	function bookSignUp(){
		//alert("등록 기능 구현중");
		//alert($('[name=newSignUpBookProc]').serialize());
		
		if( is_empty('[name=isbn13]') ){
			alert("책 번호를 입력해주세요.");
			$("[name=isbn13]").focus();
			return;
		}
		if( is_empty('[name=book_name]') ){
			alert("책 제목을 입력해주세요.");
			$("[name=book_name]").focus();
			return;
		}
		if( is_empty('[name=cat_cd]') ){
			alert("카테고리를 선택해주세요.");
			$("[name=cat_cd]").focus();
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
		if( is_empty('[name=size_cd]') ){
			alert("판형을 선택해주세요.");
			$("[name=size_cd]").focus();
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
		if( is_empty('[name=datepicker]') ){
			alert("출판일을 입력해주세요.");
			$("[name=datepicker]").focus();
			return;
		}
		if( is_empty('[name=editor]') ){
			alert("출판사 담당직원 이름을 입력해주세요.");
			$("[name=editor]").focus();
			return;
		}
		
		var incomisbn13 = $('[name=isbn13]').val();
		if(incomisbn13.indexOf('-')>0){
			var isbn13 = incomisbn13.split('-').join('');
			$('[name=isbn13]').val(isbn13);
		}
		
		if( is_valid_pattern("[name=isbn13]", /^[0-9]{13}$/)==false ){
			alert("ISBN13의 형식이 틀렸습니다. 다시 입력해주세요");
			return;
		}
		
		var checkPirce = $('[name=book_price]').val();
		if(isNaN(checkPirce)==true){
			alert("책 가격은 숫자만 기입해주세요");
			return;
		}
		
		var checkPages = $('[name=book_pages]').val();
		if(isNaN(checkPages)==true){
			alert("페이지 수는 숫자만 기입해주세요");
			return;
		}
		
		if(confirm("정말 등록하시겠습니까?")==false){return;}
		
		//alert( $('[name=newSignUpBookProc]').serialize() );
		//return;
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goSignUpBookProc.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=newSignUpBookProc]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(insertCnt){
				if(insertCnt==1){
					//alert("책 등록 성공");
					location.replace("/group4erp/goBookList.do")
				}else if(insertCnt==0){
					alert("등록 실패");
				}else if(insertCnt==-2){
					alert("재고 등록 실패");
				}else alert("서버 오류!");
				
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
	}
	
	function goBack(){
		history.go(-1);
	}
	
	function goReset(){
		document.newSignUpBookProc.reset();
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
      <section class="wrapper">
        <table border=0 cellpadding=0 cellspace=0 width="98%">
      	<tr>
      	<td widtj=50%>
      	<h3 align=left><i class="fa fa-angle-right"></i>서적 등록</h3>
      	<td widtj=50%>
      	<h3 align=right><i class="fa fa-arrow-left" onclick="goBack();" style="cursor:pointer;"></i></h3>
        </table>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
        	<div class="col-md-3"></div>
          <div class="col-lg-6 col-md-6 col-sm-6" align=center>
            <h4 class="title">상세정보 입력</h4>
            <div id="message"></div>
            <form name="newSignUpBookProc" action="/group4erp/goSignUpBookProc.do" method="POST">

              <div class="form-group">
                <input type="text" name="isbn13" class="form-control" placeholder="ISBN13을 입력하시오." >
              </div>
              <div class="form-group">
                <input type="text" name="book_name" class="form-control" placeholder="서적 제목을 입력하시오.">
              </div>
              <div class="form-group">
              <strong>카테고리 : </strong>
                <c:forEach items="${requestScope.category}" var="cat" varStatus="loopTagStatus">
						&nbsp;<input type="checkbox" name="cat_cd" value="${loopTagStatus.index+1}">${cat.cat_name}
         		</c:forEach>
              </div>
              <div class="form-group">
                <input type="text" name="book_price" class="form-control" placeholder="가격을 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="book_pages" class="form-control" placeholder="페이지 수를 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="writer" class="form-control" placeholder="저자를 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="publisher" class="form-control" placeholder="출판사를 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
              <strong>판형 : </strong>
                <c:forEach items="${requestScope.size}" var="size" varStatus="loopTagStatus">
						&nbsp;<input type="checkbox" name="size_cd" value="${loopTagStatus.index+1}">${size.size_name}
         		</c:forEach>
              </div>
              <div class="form-group">
                <input type="text" name="emp_name" class="form-control" placeholder="담당할 직원 이름을 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="datepicker" class="form-control" id="datepicker" placeholder="출간 날짜를 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="editor" class="form-control" placeholder="출판사 담당 직원을 입력하시오.">
                <div class="validate"></div>
              </div>
              <div style="text-align:left; backgound-color:white; width:100%;broder:1px solid black">
                 <div class="input-group input-large" style="align:left">
                      <span style="border:0px; background-color:#eaeaea; color:#797979" class="input-group-addon"><strong>판매여부 : </strong></span>
                      <button type="button" name="is_print_Y" class="btn btn-default" style="width:50%; color:#797979">판매
                      </button>
                      <button type="button" name="is_print_N" class="btn btn-default" style="width:50%;  color:#797979">절판
                         <input type="hidden" name="is_print">
                      </button>
                   </div>
              </div>
</form>
			  <br>
              <div class="form-send">
                <button type="button" class="btn btn-theme02" onclick="bookSignUp();"><i class="fa fa-check"></i> 등록</button>
                <button type="button" class="btn btn-default" onclick="goReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="15" height="15">초기화</button>
              </div>

            
          </div>
        </div>
        <!-- /row -->


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

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


</body>

</html>

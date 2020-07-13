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

	$(document).ready(function() {

		startTime();
		
		$("[name=corp_business_area]").change(function() {
			
			var cnt = $(this).filter(":checked").length;
			var rank='';

			if(cnt==1) {
				//change 이벤트가 발생한 체크박스의 형제들의 체크를 모두 풀기
				$(this).siblings().prop("checked", false);
				//rank = $(this).filter(":checked").val();
			} 

		});

		
		
	});

	function checkRegForm() {

		//alert("유효성 체크");
		
		if(is_empty("[name = corp_no]")) {
			alert("사업자 번호를 입력해주세요.");
			$("[name = corp_no]").focus();

			return;
			
		} else {

			var corp_no = $("[name=corp_no]").val();
			
			var regExp = new RegExp(/^[0-9]{3}-[0-9]{2}-[0-9]{5}$/);
			var flag = regExp.test(corp_no);

			if(flag==false) {
				alert("사업자 번호 형태는 OOO-OO-OOOOO입니다.");
				$("[name=corp_no]").val("");

				return;
			}
		}

		if(is_empty("[name = corp_name]")) {
			alert("상호명을 입력해주세요.");
			$("[name = corp_name]").focus();

			return;
		}

		if(is_empty("[name = ceo_name]")) {
			alert("사업자명을 입력해주세요.");
			$("[name = ceo_name]").focus();

			return;
		}

		if(is_empty("[name = ceo_name]")) {
			alert("사업자명을 입력해주세요.");
			$("[name = ceo_name]").focus();

			return;
		}

		if(is_empty("[name = corp_business_area]")) {
			alert("사업분야를 입력해주세요.");
			$("[name = corp_business_area]").focus();

			return;
		}

		if(is_empty("[name = corp_addr]")) {
			alert("소재지를 입력해주세요.");
			$("[name = corp_addr]").focus();

			return;
		}

		if(is_empty("[name = corp_tel]")) {
			alert("연락처를 입력해주세요.");
			$("[name = corp_tel]").focus();

			return;
		} else {
			
			var thisObj = $("[name=corp_tel]");
			
			var corp_tel_num = thisObj.val(); 
			
			var regExp = new RegExp(/^[0-9]{7,11}$/);
			var flag = regExp.test(corp_tel_num);

			if(flag==false) {
				alert("연락처는 -를 제외한 숫자 7~11자로 입력하세요.");
				thisObj.val("");

				return;
			}

		}

		if(!is_empty("[name = corp_fax]")) {

			var thisObj = $("[name=corp_fax]");
			
			var corp_fax_num = thisObj.val(); 
			
			var regExp = new RegExp(/^[0-9]{7,11}$/);
			var flag = regExp.test(corp_fax_num);

			if(flag==false) {
				alert("fax번호는 -를 제외한 숫자 7~11자로 입력하세요.");
				thisObj.val("");

				return;
			}
		}

		if(confirm("정말 저장하겠습니까?")==false) {

			return;
		}
		
		$.ajax({
			url : "/group4erp/insertCorpProc.do"	//접속할 서버쪽 url 주소 지정
			, type : "post"					//전송 방법 설정
			, data : $("[name = insertCorpForm]").serialize()	//서버로 보낼 파라미터명과 파라미터값을 설정
			, success : function(insertCorpCnt) {	//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정. 매개변수 boardRepleCnt에는 입력된 행의 개수가 들어온다.
														//현재 data 매개변수에는 새 글 등록 개수가 들어온다.
				if(insertCorpCnt==1) {			//[게시판 입력 행 적용 개수]가 1개이면(insert가 1회 성공했다는 뜻)
					//alert("거래처 등록 성공");
					location.replace("/group4erp/viewCorpList.do");
					} else if(insertCorpCnt==0) {		//글 등록 개수가 0이면 경고
						alert("거래처 등록에 실패했습니다. 관리자에게 문의 바랍니다.");
					} else if(insertCorpCnt==-2) {
						alert("이미 등록되어 있는 업체입니다.");
					} else {
						alert("서버 오류 발생! 관리자에게 문의 바람!");
					}				
				}

				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}			
		});

	}

	function checkCorp_no() {
		//alert("사업자번호 유효성 체크");
	}

	function goBack(){
		history.back();
	}
	
	function goReset(){
		document.insertCorpForm.reset();
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
            <a class="active" href="javascript:;">
              <i class="fa fa-krw"></i>
              <span>회계 관리</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewTranSpecIssueList.do"><i class="fa fa-list"></i>거래명세서 조회</a>
              </li>
              <li>
                <a href="/group4erp/viewTranSpecList.do"><i class="fa fa-file-text"></i>사업자 거래내역 조회</a>
              </li>
              <li class="active">
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
      	<h3 align=left><i class="fa fa-angle-right"></i>거래처 등록</h3>
      	<td widtj=50%>
      	<h3 align=right><i class="fa fa-arrow-left" onclick="goBack();" style="cursor:pointer;"></i></h3>
        </table>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
        	<div class="col-md-3"></div>
          <div class="col-lg-6 col-md-6 col-sm-6" align=center>
            <h4 class="title">상세정보 입력</h4>
            <div id="message"></div>
            <form name="insertCorpForm" method="post" action="/insertCorpProc.do">

              <div class="form-group">
                <input type="text" name="corp_no" class="form-control" placeholder="사업자 번호를 입력하시오." >
              </div>
              <div class="form-group">
                <input type="text" name="corp_name" class="form-control" placeholder="상호명을 입력하시오.">
              </div>
              <div class="form-group">
                <input type="text" name="ceo_name" class="form-control" placeholder="사업자명을 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
              <strong>사업 분야 : </strong>
                <c:forEach items='${business_area}' var="business_area" varStatus="loopTagStatus">
					&nbsp;&nbsp;<input type="checkbox" name="corp_business_area" value="${business_area.bus_area_code}">${business_area.bus_area_name}&nbsp;
				</c:forEach>
              </div>
              <div class="form-group">
                <input type="text" name="corp_addr" class="form-control" placeholder="소재지를 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="corp_tel" class="form-control" placeholder="연락처를 입력하시오.">
                <div class="validate"></div>
                <span align=left class="help-block"><h5>* '-'를 제외한 숫자 7~11자 입력</h5></span>
              </div>
              <div class="form-group">
                <input type="text" name="corp_fax" class="form-control" placeholder="FAX를 입력하시오.">
                <div class="validate"></div>
                <span align=left class="help-block"><h5>* '-'를 제외한 숫자 7~11자 입력</h5></span>
              </div>
	</form>
			  <br>
              <div class="form-send">
                <button type="button" class="btn btn-theme02" onclick="checkRegForm();"><i class="fa fa-check"></i> 등록</button>
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

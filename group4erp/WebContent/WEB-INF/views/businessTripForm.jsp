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
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<% String emp_num = (String)session.getAttribute("emp_id"); %>

<style>

.searchTable{
	border-collapse: 1px collapse !important;
}

.searchTable td{
	height: 50px;
    background-color: #fff !important;
    padding-left: 7;
}

.searchTable th {
	height: 32px;
    background-color: #fff !important;
    padding-right: 7;
    text-align: right;
    
}

.searchTable-bordered td,
.searchTable-bordered th {
    border: 1px solid #ddd !important;
}

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
		
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});

	});

	function goBusinessTripList() {
		location.replace("/group4erp/businessTripList.do");
	}

	function reset() {
		document.businessTripForm.reset();
	}


	function checkBusinessTripRegForm(){
		
		if( is_empty($("#emp_no")) ){
			alert("사원번호를 입력해주세요.");

			$("#emp_no").focus();
			return;
		}

		if (is_empty($("#destination"))) {
			alert("목적지를 입력해주세요.");
			$("#destination").focus();
			return;
		}

		if (is_empty($("#datepicker1"))) {
			alert("출장 희망일을 입력해주세요.");
			$("#datepicker1").focus();
			return;
		}

		if (is_empty($("#datepicker2"))) {
			alert("출장 희망일을 입력해주세요.");
			$("#datepicker2").focus();
			return;
		}
		var startDate = $( "[name=outside_start_time]" ).val();
	    var startDateArr = startDate.split('-');
	    var endDate = $( "[name=outside_end_time]" ).val();
	    var endDateArr = endDate.split('-');
	    var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
	    var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
	          
	    if(startDateCompare.getTime() > endDateCompare.getTime()) {
	              
	        alert("출발날짜와 복귀날짜를 확인해 주세요.");
			$("[name=outside_start_time]").focus();
	         return;
	    }

		if (is_empty($("#work_outside_reason"))) {
			alert("출장사유를 입력해주세요.");
			$("#work_outside_reason").focus();
			return;
		}
		if( is_valid_pattern($("#emp_no"), /^[0-9]{6}$/)==false ){
			alert("사원번호 숫자 4개를 입력해주세요");
			return;
		}
		

		if(confirm("정말 신청하시겠습니까?")==false){return;}
		
		$.ajax({
			url : "/group4erp/businessTripRegProc.do",
			type : "post",
			data : $('[name=businessTrip]').serialize(),
			success : function(businessTripRegCnt) {
				if (businessTripRegCnt == 1) {
					//alert("출장 신청 완료");
					location.replace('/group4erp/businessTripList.do')
				} else {
					alert("출장 신청 실패 관리자에게 문의 바람.");
				}
			},
			error : function() {
				alert("businessTripRegForm 서버 접속 실패");
			}
		});
	}

	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				document.getElementById("destination").value = addr;

			}
		}).open();
	}

	function goBack(){
		history.back();
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
              <li class="active">
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
                <!-- 인사부장만 급여지급대장 조회 메뉴를 볼 수 있다. -->
				<c:if test="${emp_id eq '600001'}">
                	<li>
              			<a href="/group4erp/viewSalList.do"><i class="fa fa-file"></i>급여지급대장 조회</a>
              		</li>	
              		<li>
              			<a href="/group4erp/viewEmpSalInfo.do"><i class="fa fa-file"></i>급여명세서 조회</a>
              		</li>	
				</c:if>
                   
                <c:if test="${emp_id != '600001'}">
                	<li>
              			<a href="/group4erp/viewEmpSalInfo.do"><i class="fa fa-file"></i>급여명세서 조회</a>
              		</li>	
                </c:if>
              	
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
        <table border=0 cellpadding=0 cellspace=0 width="99%">
      	<tr>
      	<td widtj=50%>
      	<h3 align=left><i class="fa fa-angle-right"></i> 출장 신청</h3>
      	<td widtj=50%>
      	<h3 align=right><i class="fa fa-arrow-left" onclick="goBack();" style="cursor:pointer;"></i></h3>
        </table>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
            <table width=100%>
            	<tr>
            	<td width=43%>
            	<td align=left width=27%><h4><i class="fa fa-angle-right"></i><b> 신청서</b></h4>
            	<td width=30%>
            </table>
            	<form name=businessTrip id="businessTrip" method="post" action="/group4erp/businessTripRegProc.do">
				<table align=center class="work_outside_info searchtable" name="work_outside_info" width=65% >
				<tr>
					<th>사원 번호</th>
						<td>
							<input type="text" class="form-control" id="emp_no" name="emp_no" value=<%=emp_num %> readonly>
							<!-- <span class="help-block"> ERP아이디 입니다. </span> -->
						</td>
				</tr>
				<tr>
					<th>출장지</th>
						<td>
							<input type="text" class="form-control" id="destination" name="destination" >
						</td>
						<td><button type="button" class="btn btn-theme" onclick="sample6_execDaumPostcode()"><i class="fa fa-map-marker"></i> 우편번호 찾기</button>	
				</tr>
				<tr>
					<th >출장날짜</th>
						<td>
							<div class="input-group input-large">
                      <input type="text" class="form-control dpd1" name="outside_start_time" id="datepicker1">
                      <span class="input-group-addon">~</span>
                      <input type="text" class="form-control dpd2" name="outside_end_time" id="datepicker2">
                    </div>
						</td>
				</tr>
					<!-- <tr>
						<th>목적지</th>
						<td><input type="text" size="50" id="destination"
							name="destination" readOnly> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
					</tr> -->
				<tr>
					<th >출장 사유</th>
						<td >
						<textarea class="form-control" name="work_outside_reason" id="work_outside_reason" rows="10"></textarea>
						</td>
				</tr>
				</table>
				</form>
				<br>
				<table width=100%>
            	<tr>
            	<td width=40%>
            	<td align=left width=30%>
            		<button type="button" class="btn btn-default" onClick="checkBusinessTripRegForm()"><i class="fa fa-pencil-square-o"></i>결재 신청</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-default" onclick="reset();"><input type="image" src="/group4erp/resources/image/reset.png" width="14" height="14">초기화</button>
				</td>
            	<td width=30%>
           		</table>
				<br>
            </div>
          </div>
          <!-- /col-md-12 -->
        
          <!-- /col-md-12 -->
        </div>
        <!-- row -->
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
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
   	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</body>

</html>

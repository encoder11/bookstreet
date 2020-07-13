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

		var evnt_no = $("#event_no").html();
		//alert(evnt_no);
		inputData("[name=evnt_no]", evnt_no);

			
		$("#evnt_start_dt").datepicker({
			dateFormat : 'yy-mm-dd',
			onClose: function( selectedDate ) {   
        		$("#evnt_end_dt").datepicker( 'option', 'minDate', selectedDate );
			}, 
			onSelect: function(date) { 
   	 			
   	 			 var dateObject = $(this).datepicker('getDate');
   	    		
   			} 
		});
		
		$("#evnt_end_dt").datepicker({
			dateFormat : 'yy-mm-dd',
			onSelect: function() { 
    			//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
				 var dateObject = $(this).datepicker('getDate');
       		 	
   			}
		});


		/*var uploadFile = $('[name=atchd_data]');
		uploadFile.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
		});*/


		$("[name=tot_est_cost]").keyup(function() {
			//class=money를 가진 입력 양식에서 입력한 데이터를 자바스크립트 영역으로 가져와 변수에 저장
			var money = $(this).val();
			//숫자만 골라서 저장할 변수 선언
			var num = "";
			
			//money 변수 안의 데이터중 숫자만 골라 num 변수에 누적 시킴
			for(var i=0; i<money.length; i++) {
				if("0123456789".indexOf(money.charAt(i)) >=0) {
					num = num + money.charAt(i);
				} 
				
				//num 변수 안의 제일 앞의 숫자가 0이면 제거(ex 024~, 00056~ 등등). 
				//단, 0원일때는 지우지 않는다. 즉 0이 1개일때는 삽입 가능
				while(num.charAt(0)=="0" && num.length>1) {
					num = num.substring(1);
				}
			}

			//콤마를 포함한 최종 문자열을 저장할 변수 선언
			var result="";
			
			var cnt=0;

			var arr = num.split("");
			arr=arr.reverse();
			for(var i=0; i<arr.length; i++) {
				//++cnt;
				if((i%3==2)) {	//if((i+1)%3==0) {
					arr[i] = ","+arr[i];
				}
			}
			arr=arr.reverse();
			result = arr.join("");
			//---------------------------------------------------------------

			//맨 앞이 콤마(,)로 시작하면 그 이후 문자를 낚아채 result에 다시 저장
			if(result.charAt(0)==",") {
				result = result.substring(1);
			}

			if(result.indexOf(",")==0) {
				result = result.substring(1);
			}

			$(this).val(result);	//최종 결과값을 텍스트박스에 저장함
		});	
		

		   inputData('[name=evnt_cd]',"5");
		$('[name=evnt_title]').val('믿고 보는 인생작!! 당신의 인생작품을 알려주세요~!');
		$('[name=evnt_start_dt]').val('2020-02-11');
		$('[name=evnt_end_dt]').val('2020-02-22');
		$('[name=tot_est_cost]').val('1000000');
		$('[name=evnt_comment]').val('최근에 본 작품이나 옜날에 봤던 작품중 아직까지 생각이 나는 작품을 적어주세요!');
		
		
	});
	

	function checkForm() {

		//var evnt_no = $("#event_no").html();
		//alert(evnt_no);
		//inputData("[name=evnt_no]", evnt_no);
		inputData("[name=emp_no]", 5);

		if(is_empty("[name = evnt_title]")) {
			alert("이벤트 타이틀을 입력해주세요.");
			$("[name = evnt_title]").focus();

			return;
		}

		if(is_empty("[name=evnt_start_dt]")) {
			alert("이벤트 시작일을 입력해주세요.");
			$("[name = evnt_start_dt]").focus();

			return;
		} else {
			var evnt_start_dt = $("[name=evnt_start_dt]").val();
		
			var regExp = new RegExp(/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/);
			var flag = regExp.test(evnt_start_dt);
			
			if(flag==false) {
				alert("날짜 입력 형식은 숫자로 OOOO-OO-OO 입니다.");
				$("[name=evnt_start_dt]").val("");
				return;
			}
	
		}

		if(is_empty("[name = evnt_end_dt]")) {
			alert("이벤트 종료일을 입력해주세요.");
			$("[name = evnt_end_dt]").focus();
			return;
		
		} else {
			var evnt_end_dt = $("[name=evnt_end_dt]").val();
			//alert(evnt_start_dt)
		
			var regExp = new RegExp(/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/);
			var flag = regExp.test(evnt_start_dt);
			if(flag==false) {
				alert("날짜 입력 형식은 숫자로 OOOO-OO-OO 입니다.");
				$("[name=evnt_end_dt]").val("");
				return;
			}
		}
		
		var stDt = $("[name=evnt_start_dt]").val();
		var edDt = $("[name=evnt_end_dt]").val();

		if( Number(stDt.replace(/-/gi,"")) > Number(edDt.replace(/-/gi,"")) ){
			   alert("시작일이 종료일보다 이전일 수 없습니다. 일정을 다시 확인하세요.");
			   //frm.fromDate.focus();
			   return;
		} 

		  
		if(is_empty("[name=tot_est_cost]")) {
			alert("예상경비를 입력해주세요.");
			$("[name = tot_est_cost]").focus();

			return;
		}
		
		if(confirm("정말 등록하시겠습니까?")==false) {

			return;
		}

		var money = $("[name=tot_est_cost]").val();
		money = money.replace(/,/gi, "");
		inputData("[name=tot_est_cost]", money);
		//inputData("[name=emp_no]", emp_no);
		
		
		//document.eventScheduleForm.submit();
		$.ajax({
			url : "/group4erp/insertEventProc.do"	//접속할 서버쪽 url 주소 지정
			, type : "post"					//전송 방법 설정
			, data : $("[name = eventScheduleForm]").serialize()	//서버로 보낼 파라미터명과 파라미터값을 설정

			, success : function(insertEvntCnt) {	//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정. 매개변수 boardRepleCnt에는 입력된 행의 개수가 들어온다.
														//현재 data 매개변수에는 새 글 등록 개수가 들어온다.
				if(insertEvntCnt==1) {			//[게시판 입력 행 적용 개수]가 1개이면(insert가 1회 성공했다는 뜻)
					//alert("이벤트 등록 성공");
					location.replace("/group4erp/viewEventList.do");
					} else if(insertEvntCnt==0) {		//글 등록 개수가 0이면 경고
						alert("이벤트 등록에 실패했습니다. 관리자에게 문의 바랍니다.");
					} else {
						alert("서버 오류 발생! 관리자에게 문의 바람!");
					}				
				}

				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}			
		});
	}


	//재결재 로직
	function reApprovalProc() {
		alert("재결재 로직 시작");
		//var evnt_no = $("#event_no").html();
		//alert(evnt_no);
		//inputData("[name=evnt_no]", evnt_no);
		inputData("[name=emp_no]", 5);
		if(is_empty("[name = evnt_title]")) {
			alert("이벤트 타이틀을 입력해주세요.");
			$("[name = evnt_title]").focus();
			return;
		}
		if(is_empty("[name = evnt_start_dt]")) {
			alert("이벤트 시작일을 입력해주세요.");
			$("[name = evnt_start_dt]").focus();
			return;
		}
		if(is_empty("[name = evnt_end_dt]")) {
			alert("이벤트 종료일을 입력해주세요.");
			$("[name = evnt_end_dt]").focus();
			return;
		}
		if(is_empty("[name = tot_est_cost]")) {
			alert("예상경비를 입력해주세요.");
			$("[name = tot_est_cost]").focus();
			return;
		}

		
		if(confirm("정말 저장하겠습니까?")==false) {
			return;
		}
		var money = $("[name=tot_est_cost]").val();
		money = money.replace(/,/gi, "");
		inputData("[name=tot_est_cost]", money);
		

		$.ajax({
			url : "/group4erp/updateEventProc.do"	//접속할 서버쪽 url 주소 지정
			, type : "post"					//전송 방법 설정
			, data : $("[name = eventScheduleForm]").serialize()	//서버로 보낼 파라미터명과 파라미터값을 설정
			, success : function(upCnt) {	//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정. 매개변수 boardRepleCnt에는 입력된 행의 개수가 들어온다.
														//현재 data 매개변수에는 새 글 등록 개수가 들어온다.
				if(upCnt==1) {			//[게시판 입력 행 적용 개수]가 1개이면(insert가 1회 성공했다는 뜻)
					//alert("이벤트 재등록 성공");
					location.replace("/group4erp/viewEventList.do");
					} else if(upCnt==0) {		//글 등록 개수가 0이면 경고
						alert("이벤트 재등록에 실패했습니다. 관리자에게 문의 바랍니다.");
					} else {
						alert("서버 오류 발생! 관리자에게 문의 바람!");
					}				
				}
				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}			
		});
	}		

	
	function goReset(){
		document.eventScheduleForm.reset();
	}
	
	function goBack(){
		history.go(-1);
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
      <section class="wrapper">
        <table border=0 cellpadding=0 cellspace=0 width="98%">
      	<tr>
      	<td widtj=50%>
      	<h3 align=left><i class="fa fa-angle-right"></i>이벤트 등록</h3>
      	<td widtj=50%>
      	<h3 align=right><i class="fa fa-arrow-left" onclick="goBack();" style="cursor:pointer;"></i></h3>
        </table>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
        	<div class="col-md-3"></div>
          <div class="col-lg-6 col-md-6 col-sm-6" align=center>
            <h4 class="title">상세정보 입력</h4>
            <div id="message"></div>
            <form name="eventScheduleForm" method="post" enctype="multipart/form-data">

              <div class="form-group">
              <strong>일렬번호 : </strong>
                	<c:if test="${myEventReApproval.evnt_no != null}">
						<span id="event_no">"${myEventReApproval.evnt_no}"</span>
					</c:if>
					<c:if test="${empty myEventReApproval.evnt_no }">
						<span id="event_no">EV00-00${eventNo}</span>
					</c:if>
              </div>
              <div class="form-group">
               <p class="form-control-static"> <strong>담당자 : </strong> ${emp_name}</p>
              </div>
              <div class="form-group">
              <strong>종류 : </strong>
                <select name="evnt_cd">
                	<option value="">------------------------------------------------------</option>
                	<option value="1">매대판매행사</option>
					<option value="2">야외판매</option>
					<option value="3">할인전</option>
					<option value="4">기부행사</option>
					<option value="5">온라인 설문조사</option>
					<option value="6">저자강연회</option>
					<option value="7">선착순증정</option>
				</select>
              </div>
              <div class="form-group">
                <input type="text" name="evnt_title" class="form-control" placeholder="이벤트 명을 입력하시오.">
                <div class="validate"></div>
              </div>
              <div class="form-group">
              	<div class="input-group input-large">
             		 <input type="text" class="form-control dpd1" id="evnt_start_dt" name="evnt_start_dt" placeholder="시작일을 입력하시오">
                      <span class="input-group-addon">~</span>
                      <input type="text" class="form-control dpd2" id="evnt_end_dt" name="evnt_end_dt" placeholder="종료일을 입력하시오">
                 </div>
              </div>
              
              <div class="form-group">
                <input type="text" name="tot_est_cost" class="form-control" placeholder="금액을 입력하시오.">
                <div class="validate"></div>
                <span align=left class="help-block"><h5>* 행사 진행시 필요한 금액을 입력하세요</h5></span>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="evnt_comment" placeholder="기타사항을 입력하시오." rows="5"></textarea>
                <div class="validate"></div>
                <span align=left class="help-block"><h5>* 추가사항이나 주의할 사항 등을 적어주세요</h5></span>
              </div>
              <input type="hidden" name="evnt_no" value="${evnt_no}">
			  <input type="hidden" name="emp_no" value="${emp_no}">

	</form>
			  <br>
              <div class="form-send">
                <button type="button" class="btn btn-theme02" onclick="checkForm();"><i class="fa fa-check"></i> 등록</button>
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

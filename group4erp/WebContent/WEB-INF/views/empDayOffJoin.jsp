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

.searchTable{
	border-collapse: 1px collapse !important;
}

.searchTable td{
	height: 32px;
    background-color: #fff !important;
    padding-left: 7;
}

.searchTable th {
	height: 32px;
    background-color: #fff !important;
    padding-right: 7;
    
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

$(document).ready(function(){

	getMonth();
	getYearMonth();

	startTime();
	
	$('[name=dayoff_cd]').change(function(){
		var dayval = $('[name=dayoff_cd]').val();

		if(dayval==05){
			
			$('[name=empDayOffJoinForm] tr:eq(1) td:eq(2)').children().hide()
			
			$('[name=empDayOffJoinForm] tr:eq(1) td:eq(2) #start_dayoff').show()
			
			$("[name=end_dayoff]").val('');
			
		
		}else{
			
			$('[name=empDayOffJoinForm] tr:eq(1) td:eq(2)').children().show()
			
		}
		
	});
	
	$("#start_dayoff").datepicker({ 
        dateFormat: 'yy-mm-dd'
       ,defaultDate : 'today'
       ,minDate : 'today'
       ,onClose: function( selectedDate ) {   
        //$("#dateTill").datepicker({minDate:selectedDate});
          $("#end_dayoff").datepicker( "option", "minDate", selectedDate );
     }       
     ,onSelect: function() { 
        var dateObject = $(this).datepicker('getDate');
        dateS = $("[name=start_dayoff]").val();
        dateE = $("[name=end_dayoff]").val();
        remainD = $("[name=remain_dayoff]").val();
        var dayval = $('[name=dayoff_cd]').val();
          
        var realDy = finalDayoff(dateS, dateE); 
        //alert("realDy => "+realDy);

        if(dayval==3 || dayval==4 || dayval==6){
       	 $("[name=using_dayoff]").val(realDy);
    		return;
    	}
        
        if(realDy > remainD){
           alert( realDy + " => 사용 가능한 휴가일을 초과하였습니다.");
           return;
        }
        if(realDy > 5){
           alert( realDy + " => 1회 최대 휴가 사용 가능일 수는 5일입니다.");
           return;
        } 

        $("[name=using_dayoff]").val(realDy);
        //alert("updatedata => " + updatedata);
      }
      ,beforeShowDay:$.datepicker.noWeekends 
	});

	$("#end_dayoff").datepicker({ 
       dateFormat: 'yy-mm-dd'
       ,defaultDate : 'today'
       ,minDate : 'today'
       /*,onClose: function( selectedDate ) {
            //$("#dateFrom").datepicker({maxDate:selectedDate});
           $("#start_dayoff").datepicker( "option", "minDate", selectedDate );
        }*/
     	,onSelect: function() { 
          var dateObject = $(this).datepicker('getDate');
        dateS = $("[name=start_dayoff]").val();
        dateE = $("[name=end_dayoff]").val();
        remainD = $("[name=remain_dayoff]").val();
        var dayval = $('[name=dayoff_cd]').val();
          
        var realDy = finalDayoff(dateS, dateE); 
        //alert("realDy => "+realDy);
        
        if(dayval==3 || dayval==4 || dayval==6){
       	 $("[name=using_dayoff]").val(realDy);
    		return;
    	}
        
         if(realDy > remainD){
           alert( realDy + " => 사용 가능한 휴가일을 초과하였습니다.");
           $("[name=end_dayoff]").val("");
           return;
        }
        if(realDy > 5){
           alert( realDy + " => 1회 최대 휴가 사용 가능일 수는 5일입니다.");
           $("[name=end_dayoff]").val("");
           return;
        } 

        $("[name=using_dayoff]").val(realDy);
        //alert("updatedata => " + updatedata);
          //alert($(this).val()); 
      } 
      ,beforeShowDay:$.datepicker.noWeekends

	});
	
});

	function empDayOffJoin(){
		
		//alert(realDy);
		//alert($('[name=empDayOffJoinForm]').serialize());
		//alert("휴가 신청 기능 구현중");
		
		//alert($('[name=empDayOffJoinForm]').serialize());
		//return;

		//날짜 차이 구하기
		
		if( $('[name=dayoff_cd]').val()==05 ){
			$('#end_dayoff').val($('#start_dayoff').val());
			$('[name=using_dayoff]').val(1);
			$('[name=harf_dayoff]').val(0.5);
		}
		
		if( $('[name=harf_dayoff]').val()==null || $('[name=harf_dayoff]').val().length<=0 ){
			$('[name=harf_dayoff]').val(1);
		}
		
		/*
		alert($('[name=empDayOffJoinForm]').serialize());
		return;
		*/
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goDayOffProc.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=empDayOffJoinForm]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(insertCnt){
				if(insertCnt==1){
					//alert("휴가 신청 성공");
					location.replace("/group4erp/viewEmpDayOffList.do")
				}else if(insertCnt==0){
					alert("휴가 신청 실패");
				}else if(insertCnt==-2){
					alert("휴가 정보 수정 실패");
				}else if(insertCnt==-3){
					alert("중복 신청 금지! 휴가는 한달에 한번만 나갈수 있습니다");
				}else alert("서버 오류!");
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
		
	}


	var cd = null;
	var dateS = null;
	var dateE = null;
	var empNo = null;
	var remainD = null;
	var realDy = null;
	var updatedata = null;

	var holidays = [
	   [2020,01,01,'신정'],
	      [2020,1,24,'설날휴일'],
	      [2020,1,25,'설날'],
	      [2020,1,26,'설날휴일'],
	      [2020,1,27,'대체휴일'],
	      [2020,3,1,'3.1절'],
	      [2020,4,15,'국회의원선거'],
	      [2020,4,30,'부처님오신날'],
	      [2020,5,5,'어린이날'],
	      [2020,6,6,'현충일'],
	      [2020,8,15,'광복절'],
	      [2020,9,30,'추석연휴'],
	      [2020,10,1,'추석'],
	      [2020,10,2,'추석연휴'],
	      [2020,10,3,'개천절'],
	      [2020,10,9,'한글날'],
	      [2020,12,25,'크리스마스']
	]

	function dateObj(date){
	   var dyarr = [];
	   for( var i=0; i<date.length; i++ ){
	      var pushdy = new Date(date[i][0],date[i][1]-1,date[i][2]);
	      dyarr.push(pushdy);
	   }

	   if(dyarr.length > 0){
	      return dyarr;
	   }
	   else{
	      alert('데이터가 날짜로 변경되지 않았습니다.');
	      return;
	   }
	}

	function finalDayoff(dateS, dateE){
	   //alert("remainD => " + remainD);
	        var cnt = 0;
	        var arrS = dateS.split("-");
	        var arrE = dateE.split("-");
	        var startD = new Date(arrS[0], arrS[1]-1, arrS[2]);
	        var endD = new Date(arrE[0], arrE[1]-1, arrE[2]);
	        var count = (endD.getTime() - startD.getTime())/1000/(60*60*24);

	        var hldys = dateObj(holidays);
	        //alert((parseInt(arrS[2],10)+1));
	        
	        var applyhldys = [];
	        
	      for(var i=0; i <= count; i++){
	         applyhldys.push(new Date(arrS[0],arrS[1]-1,(parseInt(arrS[2],10))+i));
	      if( (applyhldys[i].getDay() == 0) || (applyhldys[i].getDay() == 6) ){
	         cnt++;
	         //alert( applyhldys[i] + " || " + applyhldys[i].getDay());
	      }
	      else{
	         for(var k=0; k < hldys.length; k++){
	            if( (applyhldys[i].getTime() == hldys[k].getTime()) ){
	               cnt++;
	               //alert( "This is hldys[k]" + hldys[k]);
	            }
	         }
	      }

	         
	            //alert( applyhldys[i] );

	       } 
	       //alert("This is cnt =>" + cnt);
	       realDy = count-cnt+1;
	       //alert("This is realDy =>" + realDy);
	       return realDy;
	}
	
	function getYearMonth(){
		var today = new Date();

		var YearM = "1. " + today.getFullYear() + "년 " + (today.getMonth()+1) + "월 휴가 신청 입니다";

		document.getElementById('YM').innerHTML=YearM;
		
		//return document.getElementById('YM').innerHTML=YearM;
	}
	
	function getMonth(){
		var today = new Date();
		
		var notMonth = today.getMonth()+1;
		
		if(notMonth<10){
			realMonth = "0"+notMonth;
		}
		
		var month = "[" + realMonth + "월 휴가 신청]";
		
		document.getElementById('getNoticeMonth').innerHTML=month;
	}
	
	function goAllReset(){
		$('[name=empDayOffJoinForm] td:eq(1)').children().show()
		document.empDayOffJoinForm.reset();
	}

	function goAllSerach(){
		document.empDayOffJoinForm.reset();
		document.empDayOffJoinForm.submit();
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
              <li>
               -->
              <li>
                <a href="/group4erp/viewApprovalList.do"><i class="fa fa-pencil"></i>문서 결재</a>
              </li>
              <li class="active">
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
      <section class="wrapper">
        <h3 align=left><i class="fa fa-angle-right"></i> 휴가 신청</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4 align=center><i class="fa fa-angle-right"></i><b><span id="getNoticeMonth"> </span></b></h4>
				<table name="noticeTable" class="searchTable">
					<tr>
						<td width=30%>
						<td width=40%><span id="YM"> </span>
						<td width=30%>
					<tr>
						<td width=30%>
						<td width=40%>2. 올해 ${emp_name}님의 남은 연가는 ${remain.remain_dayoff}일 입니다.
						<td width=30%>
					<tr>
						<td width=30%>
						<td width=40%>3. 이번달 휴가 신청자는 ${empDayoffTot}명 입니다.(휴가자 포함)
						<td width=30%>
					<tr>
						<td width=30%>
						<td width=40%>4. 한달에 나갈수 있는 휴가 일수는 4일이 최대이며 4일 초과시 부서장의 승인이 있어야합니다.
						<td width=30%>
				</table>
            </div>
          </div>
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
              <form name="empDayOffJoinForm" method="post" action="/group4erp/empDayOffJoinProc.do">
				<input type="hidden" name="emp_no" class="emp_no" value='${emp_nos}'>
				<table name="formTable" class="table" style="bordered: 0px;">
					<tr>
						<td width=30%></td>
						<td width=10% style="text-align:right;">휴가 종류</td>
						<td width=60%>
							<select name="dayoff_cd">
								<option value="">---------
								<option value="01">연차
								<option value="02">월차
								<option value="03">생리
								<option value="04">출산
								<option value="05">반차
								<option value="06">보상
							</select>
						</td>
					<tr>
						<td width=30%></td>
						<td width=10% style="text-align:right;">휴가 기간</td>
						<td width=60%>
							<input type="text" id="start_dayoff" name="start_dayoff" size="20" maxlength=20>&nbsp;<font> ~ </font>&nbsp;
							<input type="text" id="end_dayoff" name="end_dayoff" size="20" maxlength=20>
						</td>
					<tr>
						<td colspan=3 align=center>
						
						<!-- <td width=15% align=right> -->
						<button type="button" class="btn btn-theme02" onclick="empDayOffJoin();"><i class="fa fa-pencil-square-o"></i>신청</button>
						&nbsp;&nbsp;
						<!-- <td width=55% align=left> -->
						<button type="button" class="btn btn-default" onclick="goAllReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="13" height="13">초기화</button>
				</table>
							<input type="hidden" name="using_dayoff" class="using_dayoff">
							<input type="hidden" name="remain_dayoff" class="remain_dayoff" value="${remain.remain_dayoff}">
							<input type="hidden" name="harf_dayoff" >
			</form>
			
            </div>
          </div>
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

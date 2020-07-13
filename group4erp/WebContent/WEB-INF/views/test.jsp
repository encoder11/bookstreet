<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<script src = "https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
<!DOCTYPE html>
<html lang="ko">

<head>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,200,300,350,400,500,600,700,800,900&display=swap" rel="stylesheet">
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
  <link rel="stylesheet" type="text/css" href="${ctRootcss}/zabuto_calendar.css">
  <!-- Custom styles for this template -->
  <link href="${ctRootcss}/style.css" rel="stylesheet">
  <link href="${ctRootcss}/style-responsive.css" rel="stylesheet">
  <script src="${ctRootlib}/chart-master/Chart.js"></script>
  
  <script src = "https://www.google.com/jsapi"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>



  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
<%--   <script src="${ctRootlib}/common-scripts.js"></script>
  <link href="${ctRootcss}/style-responsive.css" rel="stylesheet"> --%>
  
  <!--script for this page-->
  
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
<script type="text/javascript">

   google.charts.load('current', {'packages' : ['corechart'] } );

   //google.charts.setOnLoadCallback(drawChart);
   google.charts.setOnLoadCallback(drawChartSellingStat);

   function drawChartSellingStat(){
	   var sellingStat_data = google.visualization.arrayToDataTable([
				['Month', '판매부수']
		  	  	,["${mainChartsDTO.sellingStat[0].title}", ${mainChartsDTO.sellingStat[0].cnt}]
		  	  	,["${mainChartsDTO.sellingStat[1].title}", Number(${mainChartsDTO.sellingStat[1].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[2].title}", Number(${mainChartsDTO.sellingStat[2].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[3].title}", Number(${mainChartsDTO.sellingStat[3].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[4].title}", Number(${mainChartsDTO.sellingStat[4].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[5].title}", Number(${mainChartsDTO.sellingStat[5].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[6].title}", Number(${mainChartsDTO.sellingStat[6].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[7].title}", Number(${mainChartsDTO.sellingStat[7].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[8].title}", Number(${mainChartsDTO.sellingStat[8].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[9].title}", Number(${mainChartsDTO.sellingStat[9].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[10].title}", Number(${mainChartsDTO.sellingStat[10].cnt})]
		  	  	,["${mainChartsDTO.sellingStat[11].title}", Number(${mainChartsDTO.sellingStat[11].cnt})]
			]);
	
			var sellingStat_option = {
					//title: '월별 도서 판매 부수',
			         //width :700, 
			         height: 400,
			         colors:['#fba14c','#fba14c', 'opacity: 0.2'],
			         /* colors:['#99CCFF','#99CCFF', 'opacity: 0.2'], */
			         /* colors:['#e68f8f','#e68f8f'], */
			         animation:{
			              startup: true,
			              duration: 1000,
			              easing: 'out',
			        },
			        /* annotations: {
			        	boxStyle: {
			        	      // Color of the box outline.
			        	      stroke: '#888',
			        	      // Thickness of the box outline.
			        	      strokeWidth: 1,
			        	      // x-radius of the corner curvature.
			        	      rx: 50,
			        	      // y-radius of the corner curvature.
			        	      ry: 50
			        	}
					}
					 */backgroundColor: {
			             fill: '#eaeaea',
			             fillOpacity: 0
			           },
					chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */},
		               legend: {'position': 'right', textStyle: {fontSize:13, color: '#797979', fontName:'Noto Sans KR'}},

			            hAxis: {
			               textStyle:{color: '#797979'},
			               gridlines: {
			                   color: "white"
			               },
			        	   baselineColor: 'white'/*, 
			        	    ticks: []*/
			        	 }, 
			        	 vAxis: {
			        		 textStyle:{color: '#797979'},
				             /* gridlines: {
				                   color: "white"
				             }, */
				        	 baselineColor: 'lightgray',
			                 titleTextStyle: {
			                   color: '#797979'
			                 }
			        	 }
			        	
			};

			var sellingStat_chart = new google.visualization.ColumnChart(document.getElementById('sellingStat'));
  			sellingStat_chart.draw(sellingStat_data, sellingStat_option);
	
	}


   /* function drawChart() {
      var monthlyBookReg_data = google.visualization.arrayToDataTable(${monthlyBook_reg_chart_data});
      //var data2 = google.visualization.arrayToDataTable(${corpOrder_chart_data});
      //var data3 = google.visualization.arrayToDataTable(${dailyOrder_chart_data});

      var monthlyBookReg_data_options = {   
         //title: '월별 도서 계약 건수',
         //width :, 
         //height: 300,
         colors:['#fdfdfd','#fdfdfd'],
         lineWidth: 4,
         backgroundColor: {
             fill: '#FF0000',
             fillOpacity: 0
           },
            hAxis: {
            	textStyle:{color: '#fdfdfd'},
        	   baselineColor: 'none',
        	   ticks: []
        	 }, 
        	 vAxis: {
        	   baselineColor: 'none',
        	   ticks: [],
        	   textStyle: {
                   color: 'red'
               },
               titleTextStyle: {
                   color: 'red'
               }
        	 },
        	 legend: {
        	        textStyle: {
        	            color: 'white'
        	        }
        	    },
         animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            }
      };

      var monthlyBookReg_chart = new google.visualization.LineChart(document.getElementById('monthlyBookRegChart'));

      monthlyBookReg_chart.draw(monthlyBookReg_data, monthlyBookReg_data_options);

   } */



   


</script>
<style>
:root {
  --blue : #1B9DD9;
  --grey : #F5F6FA;
  --light-grey : #707070;
  --dark-grey : #5F5F5F;
  --border-radius : 20px;
  --green : #BCCF11;
  --red : #E20D18;
  --yellow : #eab71b;
  --silver : #C1C1C1;
  --bronze : #AC7D18;
}

html, body {
  margin: 0;
  font-family: 'Montserrat', sans-serif;
  /* background-color : var(--grey); */
}

#app {
  height : 80em;
  width : 10vw;
  /* margin-top : 1em; */
  display : grid;
}

.slider-container {
  border-radius : 10px;
  display : flex;
  width : 15em;
  margin-left: auto;
  margin-right: auto;
  background-color : white;
  color : var(--dark-grey);
}

.slider-container .option {
  border-radius : 10px;
  width : 5em;
  margin : 0em;
  padding : 1em;
  text-align : center;
}

.slider-container .option.highlighted {
  background-color : var(--red);
  color : white;
}

.podium-places-container {
  display: flex;
  width : 50%;
  margin-left: auto;
  margin-right : auto;
  justify-content : center;
}

.podium {
  display : grid;
  grid-template-columns: 1fr 3fr;
  width : 15em;
  background-color : white;
  margin : 2.5em;
  border-radius : 20px;
  color : white;
}

.podium .position {
  border-right-style: solid;
  border-color: var(--grey);
  border-width : .4em;

}

.podium .position {
  width : 3em;
  position : relative;
}

.podium.gold .position {
  width : 5em;
}

.podium .class-information {
 padding : .5em;
}

.podium.bronze, .podium.silver {
  width : 13.5em;
  height : 7em;
  margin-top : 5em;
}

.podium.silver .position div,
.podium.bronze .position div {
  position : absolute;
  top : .2em;
  left : .1em;
  font-size : 4em;
}

.podium.gold .position div {
  position : absolute;
  top : .1em;
  left : .1em;
  font-size : 6em;
}



.podium.bronze .class-information .title, .podium.silver .class-information .title {
  margin-top : .1em;
  font-size : 1.1em;
}

.podium.bronze .class-information .steps, .podium.silver .class-information .steps {
  margin-top : .1em;
  font-size : 1.1em;
}

.podium.gold .class-information .title {
  margin-top : .1em;
  font-size : 1.4em;
}

.podium.gold .class-information .steps {
  margin-top : .1em;
  font-size : 1.4em;
}



.podium.bronze {
  background-color : var(--bronze);
}

.podium.silver {
  background-color : var(--silver);
}

.podium.gold {
  background-color : var(--yellow);
  height : 9em;
  width : 20em;
}


.list-item {

  width : 80%;
 margin-left: auto;
  margin-right: auto;
  background-color : white;
  margin-bottom : 1em;
  border-radius : 20px;
  height : 3em;
  position : relative;

}

.list-item .position {
  position : absolute;
  left : 3em;
}


.list-item .position {
  position : absolute;
  left : 1.5em;
  top : .4em;
  font-size : 2.5em;
  color : var(--red);
}

.list-item .class-information {
  
  position : absolute;
  left : 15em;
  top : .5em;
}

.list-item .steps {
  position : absolute;
  right : 2em;
  top : .4em;
  font-size : 2.5em;
  color : var(--red);
}

.list-item .class-information .title {
  font-size : 1.5em;
  color : var(--red);
}

.list-item .class-information .year {
  margin-top : .25em;
}

.leaderboards-container{
	height:30%
}

.nullDiv{
	margin-top:0;
	margin-bottom:0;
	padding-top:0;
	padding-bottom:0;
	
}

.year-group{
	color : black;
}

.title{
	font-weight:bold;
}

.steps{
	text-align:right;
}


.list-item.highlighted, 
.list-item.highlighted .class-information .year,
.list-item.highlighted .class-information .title,
.list-item.highlighted .steps,
{
  background-color : var(--red);
  color : white !important;
}
</style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>


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
            <a class="active" href="/group4erp/goMainTest.do">
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
              <li>
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
              <li>
                <a href="/group4erp/goMyChart.do"><i class="fa fa-bar-chart-o"></i>시장 분석 자료</a>
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
        <div class="row">
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>월별 판매 부수(온/오프라인 합산)</h3>
            </div>
            <!-- <div id="sellingStat" style="background-color:white"> -->
            <div id="sellingStat" style="background-color:#eaeaea">
            	
            </div>
            <!-- <div class="custom-bar-chart" id="sellingStatDiv">
              <ul class="y-axis">
                <li><span>10.000</span></li>
                <li><span>8.000</span></li>
                <li><span>6.000</span></li>
                <li><span>4.000</span></li>
                <li><span>2.000</span></li>
                <li><span>0</span></li>
              </ul>
              <div class="bar">
                <div class="title">JAN</div>
                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar ">
                <div class="title">FEB</div>
                <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div>
              </div>
              <div class="bar ">
                <div class="title">MAR</div>
                <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div>
              </div>
              <div class="bar ">
                <div class="title">APR</div>
                <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div>
              </div>
              <div class="bar">
                <div class="title">MAY</div>
                <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div>
              </div>
              <div class="bar ">
                <div class="title">JUN</div>
                <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div>
              </div>
              <div class="bar">
                <div class="title">JUL</div>
                <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top">75%</div>
              </div>
            </div> -->
            <!--custom chart end-->
            <div class="row mt">
              
              
              <!-- DIRECT MESSAGE PANEL -->
               <div class="col-md-8 mb">
                <div class="message-p pn">
                  <div class="message-header" style="margin-bottom:0px; background-color:#444c57">
                    <h4><font style="color:white;">Bestsellers</font></h4>
                  </div>
                  <div class="row">
                   
                    <div class="col-md-12">
						<%-- <%@ include file="/WEB-INF/views/manyCharts2.jsp" %> --%>
						<div id="app" style='height:20%; padding-top:0; margin-top:0;'></div>

						<script src='https://cdnjs.cloudflare.com/ajax/libs/react/0.13.0/react.min.js'></script>
						<script id="rendered-js">
						let title = 'Blackbirds';
						let yearGroup = 'Year 3';
						let steps = '1,345';
						
						let app =
						React.createElement("div", { className: "leaderboards-container" },
						/*
						React.createElement("div", { className: "slider-container" },
						React.createElement("div", { className: "option" }, "Daily"),
						
						React.createElement("div", { className: "option highlighted" }, "Momth")),
						
						React.createElement("div", { className: "option" }, "Termly")),
						*/
						
						React.createElement("div", { className: "podium-places-container" },
						React.createElement("div", null,
						React.createElement("div", { className: "podium silver" },
						React.createElement("div", { className: "position" },
						React.createElement("div", null, "2")),
						
						
						
						React.createElement("div", { className: "class-information" },
						React.createElement("div", { className: "title" },
						'${bestSellers[1].book_name}'),
						
						React.createElement("div", { className: "year-group" },
						'${bestSellers[1].cat_name}'),
						
						React.createElement("div", { className: "steps" },
						'${bestSellers[1].soldcnt}'+'권')))),
						
						React.createElement("div", null,
						React.createElement("div", { className: "podium gold" },
						React.createElement("div", { className: "position" },
						React.createElement("div", null, "1")),
						
						
						
						React.createElement("div", { className: "class-information" },
						React.createElement("div", { className: "title" },
						'${bestSellers[0].book_name}'),
						
						React.createElement("div", { className: "year-group" },
						      '${bestSellers[0].cat_name}'),
						
						React.createElement("div", { className: "steps" },
						      '${bestSellers[0].soldcnt}'+'권')))),
						
						
						React.createElement("div", null,
						React.createElement("div", { className: "podium bronze" },
						React.createElement("div", { className: "position" },
						React.createElement("div", null, "3")),
						
						
						
						React.createElement("div", { className: "class-information" },
						React.createElement("div", { className: "title" },
						      '${bestSellers[2].book_name}'),
						
						React.createElement("div", { className: "year-group" },
						      '${bestSellers[2].cat_name}'),
						
						React.createElement("div", { className: "steps" },
						      '${bestSellers[2].soldcnt}'+'권'))))));
						
						
						
						/* React.createElement("div", { className: "places-list-container" },
						React.createElement("div", { className: "list-item" },
						React.createElement("div", { className: "position" }, "4"),
						
						
						React.createElement("div", { className: "class-information" },
						React.createElement("div", { className: "title" },
								'${bestSellers[3].book_name}'),
						
						React.createElement("div", { className: "year" },
								'${bestSellers[3].cat_name}')),
						
						
						React.createElement("div", { className: "steps" },
								'${bestSellers[3].soldcnt}'+'권')),
						
						
						
						React.createElement("div", { className: "list-item" },
						React.createElement("div", { className: "position" }, "5"),
						
						
						React.createElement("div", { className: "class-information" },
						React.createElement("div", { className: "title" },
								'${bestSellers[4].book_name}'),
						
						React.createElement("div", { className: "year" },
								'${bestSellers[4].cat_name}')),
						
						
						React.createElement("div", { className: "steps" },
								'${bestSellers[4].soldcnt}'+'권')))); */
						
						React.render(app, document.getElementById('app'));
						//# sourceURL=pen.js
						    </script>
                      <!-- <p>
                        <name>Dan Rogers</name>
                        sent you a message.
                      </p>
                      <p class="small">3 hours ago</p>
                      <p class="message">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p> -->
                   
                    </div>
                  </div>
                </div>
                <!-- /Message Panel-->
              </div>
              <!-- /col-md-8  -->
              
              
              <!-- SERVER STATUS PANELS -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="grey-panel pn donut-chart" style="color:#fff;">
                  <div class="grey-header">
                    <h5><b>${orderStat.title} 계획대비 실적 현황</b></h5>
                  </div>
                  <table width="95%">
                  	<tr><td>&nbsp;</td></tr>
                  	<tr>
                  		<td width="10%"></td>
                  		<td>
                  			
	                  	<!-- <div class="task-info">
		                    <div class="desc">Dashio Admin Panel</div>
		                    <div class="percent">40%</div>
		                  </div> -->

		                  
		                  
		                  <c:if test="${empty orderStat}">
		                  	판매율
		                  	<table>
		                  		<tr>
		                  			<td width="100%">
		                  				<div class="progress progress-striped">
				                  		<font style="font-size:8pt; color:#ef6242;">&nbsp;※판매 건수가 없습니다.</font>
				                   			<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
				                     			<span class="sr-only">0%</span>
				                    		</div>
				                  		</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td width="20%"><div class="percent">0%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if> 
		                  
		                  <c:if test="${!empty orderStat and orderStat.cnt<=50}">
		                   	판매율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                   	<table>
		                  		<tr>
		                  			<td width="100%">
		                  				<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="${orderStat.cnt}" aria-valuemin="0" aria-valuemax="100" style="width:${orderStat.cnt}%">
					                      		<span class="sr-only">${orderStat.cnt}</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${orderStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
		                  
		                  
		                  <c:if test="${!empty orderStat and orderStat.cnt>50 and orderStat.cnt<=70}">
		                  	판매율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                   	<table>
		                  		<tr>
		                  			<td width="100%">
		                  				<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="${orderStat.cnt}" aria-valuemin="0" aria-valuemax="100" style="width:${orderStat.cnt}%">
					                      		<span class="sr-only">${orderStat.cnt}</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${orderStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
		                  
		                  
		                  <c:if test="${!empty orderStat and orderStat.cnt>70 and orderStat.cnt<=100}">
		                   	판매율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                  	<table>
		                  		<tr>
		                  			<td width="100%">
					                  	<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${orderStat.cnt}" aria-valuemin="0" aria-valuemax="100" style="width:${orderStat.cnt}%">
					                      		<span class="sr-only">${orderStat.cnt}</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${orderStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
		                  
		                  
		                  <c:if test="${!empty orderStat and orderStat.cnt>=100}">
		                   	판매율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                  	<table>
		                  		<tr>
		                  			<td width="100%">
					                  	<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
					                      		<span class="sr-only">100</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${orderStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
		                  
		                                    
                  	<!-- <div width="100%" id="monthlyBookRegChart"></div> -->
                  	</td></tr>

                  	<tr height="50%"><td>&nbsp;</td></tr>
                  	<tr>
                  		<td width="10%"></td>
                  		<td>
                  			
	                  	<!-- <div class="task-info">
		                    <div class="desc">Dashio Admin Panel</div>
		                    <div class="percent">40%</div>
		                  </div> -->
		                  <c:if test="${empty returnStat}">
		                  	반품율
		                  	<table>
		                  		<tr>
		                  			<td width="100%">
		                  				<div class="progress progress-striped">
				                  		<font style="font-size:8pt; color:#ef6242;">&nbsp;※반품 건수가 없습니다.</font>
				                   			<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
				                     			<span class="sr-only">0%</span>
				                    		</div>
				                  		</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">0%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if> 
		                  
		                  
		                  <c:if test="${!empty returnStat and returnStat.cnt<=30}">
		                   	반품율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                   	<table>
		                  		<tr>
		                  			<td width="100%">
		                  				<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${returnStat.cnt}" aria-valuemin="0" aria-valuemax="100" style="width:${returnStat.cnt}%">
					                      		<span class="sr-only">${returnStat.cnt}</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${returnStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
		                  
		                  
		                  <c:if test="${!empty returnStat and returnStat.cnt>30 and returnStat.cnt<=60}">
		                  	반품율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                   	<table>
		                  		<tr>
		                  			<td width="100%">
		                  				<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="${returnStat.cnt}" aria-valuemin="0" aria-valuemax="100" style="width:${returnStat.cnt}%">
					                      		<span class="sr-only">${returnStat.cnt}</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${returnStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
		                  
		                  
		                  <c:if test="${!empty returnStat and returnStat.cnt>60 and returnStat.cnt<=100}">
		                   	반품율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                  	<table>
		                  		<tr>
		                  			<td width="100%">
					                  	<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="${returnStat.cnt}" aria-valuemin="0" aria-valuemax="100" style="width:${returnStat.cnt}%">
					                      		<span class="sr-only">${returnStat.cnt}</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${returnStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
		                  
		                  <c:if test="${!empty returnStat and returnStat.cnt>100}">
		                   	반품율<!-- <font style="font-size:8pt;">(단위:100%=30,000건)</font> --> 
		                  	<table>
		                  		<tr>
		                  			<td width="100%">
					                  	<div class="progress progress-striped">
					                    	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
					                      		<span class="sr-only">100</span>
					                    	</div>
					                  	</div>
		                  			</td>
		                  			<td>&nbsp;&nbsp;</td>
		                  			<td valign="top" width="20%"><div class="percent">${returnStat.cnt}%</div></td>
		                  		</tr>
		                  	</table>
		                  </c:if>
                  	<!-- <div width="100%" id="monthlyBookRegChart"></div> -->
                  	</td></tr>
                  </table>
                  <!-- <div class="chart mt">
                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
                  </div> -->
                  <div id="event_text" align="left" style="padding-left:20; padding-top:10;">
                 <!--  <p><b>$ 17,980</b><br/>Month Income</p> -->
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
            </div>
            
            
            
            
            
            
            
            
            
            
            
            
            <!-- <div style="width:30%; height:15%; background-color:#FEC107; border-radius : 25px;">
            	test
            </div> -->
            
            
            
            
            <!-- /row -->
            <div class="row">
              <!-- SERVER STATUS PANELS -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="grey-panel pn donut-chart" style="color:#fff;">
                  <div class="grey-header">
                    <h5><b><!-- <i class="fa fa-bell-o"></i> -->Yesterday summary</b></h5>
                  </div>
                  <table id="yesterdaySum">
	                    		<tr>
	                    			<td rowspan="4" width="30%"></td>
	                    			<td>
	                    				<h4><i class="fa fa-pencil-square"></i>&nbsp;</h4> 
	                    			</td>
	                    			<td>
	                    				어제 도서계약 건수 :&nbsp;<font style='font-weight:bold; font-size:15pt;color:#424141;'>${mainChartsDTO.reg_cnt}</font>건
	                    			</td>
	                    		</tr>
	                    		<tr>
	                    			<td>
	                    				<h4><i class="fa fa-shopping-cart"></i>&nbsp;</h4> 
	                    			</td>
	                    			<td>
	                    				어제 주문 건수 :&nbsp;<font style='font-weight:bold; font-size:15pt;color:#424141;'>${mainChartsDTO.order_cnt}</font>건
	                    			</td>
	                    		</tr>
	                    		<!-- <tr height="20"></tr> -->
	                    		<tr>
	                    			<td>
	                    				<h4><i class="fa fa-building-o"></i>&nbsp;</h4> 
	                    			</td>
	                    			<td>
	                    				어제 기업 주문 건수 :&nbsp;<font style='font-weight:bold; font-size:15pt;color:#424141;'>${mainChartsDTO.corp_order_cnt}</font>건
	                    			</td>
	                    			<!-- <td width="30%"></td> -->
	                    		</tr>
	                    		<tr>
	                    			<td>
	                    				<h4><i class="fa fa-reply"></i>&nbsp;</h4> 
	                    			</td>
	                    			<td>
	                    				어제 반품 건수 :&nbsp;<font style='font-weight:bold; font-size:15pt;color:#424141;'>${mainChartsDTO.return_cnt}</font>건
	                    			</td>
	                    		</tr>
	                    	</table>
	                    	</td>
	                    	</tr>
	                    </table>


                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4-->
              
              <!-- /col-md-4-->
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn donut-chart">
                  <div class="darkblue-header">
                    <h5><b>회원  성비</b></h5>
                  </div>
                  <canvas id="genderStatCanvas" height="120" width="120"></canvas>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                    <br>
                      <p>여자 / 남자 : </p>
                    </div>
                    <div class="col-sm-6 col-xs-6" id="genderText">
                    	<script>
	                    	var genderData = [{
	                  		    value: ${mainChartsDTO.genderStat[0].cnt},
	                  		    color: "#FF6B6B"
	                  		  },
	                  		  {
	                  		    value: ${mainChartsDTO.genderStat[1].cnt},
	                  		    color: "#1c9ca7"
	                  		  }
	                  		];
	
	                  		var genderText = "<h2><font style='font-size:20pt'>"+${mainChartsDTO.genderStat[0].cnt}+"%</font>";
	                  		genderText += "<font style='font-size:20pt; color:darkgray;'>/</font>";
	                  		genderText += "<font style='font-size:20pt; color:#1c9ca7;'>"+${mainChartsDTO.genderStat[1].cnt}+"%</font></h2>"; 
	                  		$("#genderText").append(genderText);
	                  		
	                  		var myDoughnut = new Chart(document.getElementById("genderStatCanvas").getContext("2d")).Doughnut(genderData);
                    	</script>
                      <!-- <h2><font style="font-size:20pt">21%</font>
                      	  <font style="font-size:20pt; color:darkgray;">/</font> 
                      	  <font style="font-size:20pt; color:#1c9ca7;">21%</font>
                      </h2> -->
                    </div>
                  </div>
                </div>
              
              
<!--                 <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>회원 남녀 비율</h5>
                  </div>
                  <canvas id="genderStatCanvas" height="120" width="120"></canvas>
                  <p>April 17, 2014</p>
                  
                </div> -->
                <!--  /darkblue panel -->
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <!-- REVENUE PANEL -->
                <div class="green-panel pn" style="background-color:#4a493f;">
                  <div class="green-header" style="background-color:#675b5e;">
                    <h5><b>2019 이벤트 분포 현황</b></h5>
                  </div>
                  <canvas id="ageStatCanvas" height="120" width="120"></canvas>
                  <div class="row">
                    <!-- <div class="col-sm-6 col-xs-6 goleft" id="text1"> -->
                    <div class="col-sm-12 col-xs-12 goleft" id="text1">
                    </div>
                    <div class="col-sm-12 col-xs-12" id="text">
                    	<br>
                    	<script>
                  		var evntData = [{
	                  		    value: ${mainChartsDTO.eventStat[0].cnt},
	                  		    color: '#b97df0'
	                  		}
	                  		,{
	                  		    value: ${mainChartsDTO.eventStat[1].cnt},
	                  		    color: '#5cb0fa'
	                  		}
	                  		,{
	                  		    value: ${mainChartsDTO.eventStat[2].cnt},
	                  		    color: '#fdfdfd'
	                  		}
	                  		,{
	                  		    value: ${mainChartsDTO.eventStat[3].cnt},
	                  		    color: '#baf07d'
	                  		}
	                  		,{
	                  		    value: ${mainChartsDTO.eventStat[4].cnt},
	                  		    color: '#f07d7d'
	                  		}
                  		];

                  		var lastyearEvnt = "<font style='color:#d0c2c2;'>${mainChartsDTO.eventStat[0].title}</font>"+"&nbsp;:&nbsp;";
                  		lastyearEvnt += "<font style='color:#d2bff5;font-weight:bold;font-size:14pt'>"+${mainChartsDTO.eventStat[0].cnt}+"%</font>&nbsp;&nbsp;&nbsp;&nbsp;" 
                  		lastyearEvnt +=  "<font style='color:#d0c2c2;'>${mainChartsDTO.eventStat[1].title}</font>"+"&nbsp;:&nbsp;"
                  		lastyearEvnt += "<font style='color:#bfdcf5;font-weight:bold;font-size:14pt'>"+${mainChartsDTO.eventStat[1].cnt}+"%</font>&nbsp;&nbsp;&nbsp;&nbsp;"
                  		lastyearEvnt +=  "<font style='color:#d0c2c2;'>${mainChartsDTO.eventStat[2].title}</font>"+"&nbsp;:&nbsp;"
                  		lastyearEvnt += "<font style='color:#fdfdfd;font-weight:bold;font-size:14pt'>"+${mainChartsDTO.eventStat[2].cnt}+"%</font><br>"
                  		lastyearEvnt +=  "<font style='color:#d0c2c2;'>${mainChartsDTO.eventStat[3].title}</font>"+"&nbsp;:&nbsp;"
                  		lastyearEvnt += "<font style='color:#baf07d;font-weight:bold;font-size:14pt'>"+${mainChartsDTO.eventStat[3].cnt}+"%</font>&nbsp;&nbsp;&nbsp;&nbsp;"
                  		lastyearEvnt += "<font style='color:#d0c2c2;'>${mainChartsDTO.eventStat[4].title}</font>"+"&nbsp;:&nbsp;"
                  		lastyearEvnt += "<font style='color:#f07d7d;font-weight:bold;font-size:14pt'>"+${mainChartsDTO.eventStat[4].cnt}+"%</font>&nbsp;&nbsp;&nbsp;&nbsp;"
                  		$("#text").append(lastyearEvnt);
                          	  
                  		var myDoughnut = new Chart(document.getElementById("ageStatCanvas").getContext("2d")).Doughnut(evntData);

                							
                    	</script>
                      <!-- <h2><font style="font-size:20pt">21%</font>
                      	  <font style="font-size:20pt; color:darkgray;">/</font> 
                      	  <font style="font-size:20pt; color:#1c9ca7;">21%</font>
                      </h2> -->
                    </div>
                  </div>
                  
                </div>
              </div>
              <!-- /col-md-4 -->
              
              
              
              
              <%-- 
            </div>
            <div class="row">
              <!-- TWITTER PANEL -->
              <div class="col-md-4 mb">
                <div class="twitter-panel pn">
                  <i class="fa fa-twitter fa-4x"></i>
                  <p>Dashio is here! Take a look and enjoy this new Bootstrap Dashboard theme.</p>
                  <p class="user">@Alvrz_is</p>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <div class="white-panel pn">
                  <div class="white-header">
                    <h5>TOP USER</h5>
                  </div>
                  <p><img src="${ctRootImg}/ui-zac.jpg" class="img-circle" width="50"></p>
                  <p><b>Zac Snider</b></p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="small mt">MEMBER SINCE</p>
                      <p>2012</p>
                    </div>
                    <div class="col-md-6">
                      <p class="small mt">TOTAL SPEND</p>
                      <p>$ 47,60</p>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 mb">
                <!-- INSTAGRAM PANEL -->
                <div class="instagram-panel pn">
                  <i class="fa fa-instagram fa-4x"></i>
                  <p>@THISISYOU<br/> 5 min. ago
                  </p>
                  <p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
            <div class="row">
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="product-panel-2 pn">
                  <div class="badge badge-hot">HOT</div>
                  <img src="${ctRootImg}/product.jpg" width="200" alt="">
                  <h5 class="mt">Flat Pack Heritage</h5>
                  <h6>TOTAL SALES: 1388</h6>
                  <button class="btn btn-small btn-theme04">FULL REPORT</button>
                </div>
              </div>
              <!-- /col-md-4 -->
              <!--  PROFILE 02 PANEL -->
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="profile-02">
                    <div class="user">
                      <img src="${ctRootImg}/friends/fr-06.jpg" class="img-circle" width="80">
                      <h4>DJ SHERMAN</h4>
                    </div>
                  </div>
                  <div class="pr2-social centered">
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-dribbble"></i></a>
                  </div>
                </div>
                <!-- /panel -->
              </div>
              <!--/ col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>DISK SPACE</h5>
                  </div>
                  <canvas id="serverstatus03" height="120" width="120"></canvas> 
                  <script>
                    var doughnutData = [{
                        value: 60,
                        color: "#2b2b2b"
                      },
                      {
                        value: 40,
                        color: "#fffffd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <h3>60% USED</h3>
                </div>
              </div> --%>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          <div class="col-lg-3 ds" style="height:1020">
            <!--COMPLETED ACTIONS DONUTS CHART-->
            <!-- <div class="donut-main">
              <h4>COMPLETED ACTIONS & PROGRESS</h4>
              <canvas id="newchart" height="130" width="130"></canvas>
              <script>
                var doughnutData = [{
                    value: 70,
                    color: "#4ECDC4"
                  },
                  {
                    value: 30,
                    color: "#fdfdfd"
                  }
                ];
                var myDoughnut = new Chart(document.getElementById("newchart").getContext("2d")).Doughnut(doughnutData);
              </script>
            </div>
            NEW EARNING STATS
            <div class="panel terques-chart">
              <div class="panel-body">
                <div class="chart">
                  <div class="centered">
                    <span>TODAY EARNINGS</span>
                    <strong>$ 890,00 | 15%</strong>
                  </div>
                  <br>
                  <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>
                </div>
              </div>
            </div> -->
            <!--new earning end-->
            <!-- RECENT ACTIVITIES SECTION -->
            <h4 class="centered mt"><font style="font-size:12pt;">이번달 이벤트</font></h4>
            	<c:if test="${!empty requestScope.monthEvnt}">
            		<c:forEach items='${requestScope.monthEvnt}' var="monthEvnt" varStatus="loopTagStatus">
		             <div class="desc">
		              <div class="thumb">
		                <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
		              </div>
		             <div class="details" style="width:80%;">
		                <p>
		                  <muted><font style="font-size:11pt;">${monthEvnt.evnt_start_dt} - ${monthEvnt.evnt_end_dt}</font></muted>
		                  <br/>
		                  <a href="#"><font style="font-size:11pt;">${monthEvnt.event_type}&nbsp;&nbsp;</font></a><font style="font-size:11pt;">${monthEvnt.evnt_title}</font><br/>
		                </p>
		              </div>
		             </div>
	             </c:forEach> 
            	</c:if>
            	<c:if test="${empty requestScope.monthEvnt}">
            		<div align="center" style="height:30%; color:orange; vertical-align:center;">진행중인 이벤트가 없습니다.</div>
	            </c:if>
            
           
            
            <!-- CALENDAR-->
            <div id="calendar" class="mb">
              <div class="panel green-panel no-margin">
                <div class="panel-body">
                  <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                    <div class="arrow"></div>
                    <h3 class="popover-title" style="disadding: none;"></h3>
                    <div id="date-popover-content" class="popover-content"></div>
                  </div>
                  <div id="my-calendar"></div>
                </div>
              </div>
            </div>
            <!-- / calendar -->
          </div>
          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
      </section>
    </section>
  
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>

  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="${ctRootlib}/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
  <script src="${ctRootlib}/sparkline-chart.js"></script>
  <script src="${ctRootlib}/zabuto_calendar.js"></script>
  <script src="${ctRootlib}/morris/morris.min.js"></script>
  <script src="${ctRootlib}/raphael/raphael.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
        
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });

      
    });//--------------document ready 끝

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
    
  </script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<script src = "https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>회사 현황</title>
<!-- Favicons -->
<link href="${ctRootImg}/favicon.png" rel="icon">
<link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link href="${ctRootlib}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--external css-->
<link href="${ctRootlib}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
<!-- Custom styles for this template -->
<link href="${ctRootcss}/style.css" rel="stylesheet">
<link href="${ctRootcss}/style-responsive.css" rel="stylesheet">
<script type="text/javascript">

   $(document).ready(function() {
      
      
      startTime();
      
      
   });
   
   

   google.charts.load('current', {'packages' : ['corechart'] } );

   //google.charts.setOnLoadCallback(drawChart);
   //google.charts.setOnLoadCallback(drawBarChart);
   google.charts.setOnLoadCallback(drawEmployeeCntChart);
   google.charts.setOnLoadCallback(drawHireOrResignChart);
   //google.charts.setOnLoadCallback(drawCategoryChart);
   google.charts.setOnLoadCallback(drawDeptEmpCntChart);
   google.charts.setOnLoadCallback(drawDayoffChart);
   google.charts.setOnLoadCallback(drawPieCategoryChart);


   function drawHireOrResignChart() {
      var hireOrResign_chart_data = google.visualization.arrayToDataTable(${empHireOrResign_data});
      var hireOrResign_chart_options = {
         /* title: '직원 변동 현황', */
         width :1500, 
         height: 400,
         lineWidth: 4,
         legend: {'position': 'right', textStyle: {fontSize:15, color: '#797979', fontName:'Noto Sans KR'}},
         colors:['#f0ad4e', '#ed5564', '#4eccc4'],
         /* '#4eccc4','#4eccc4' */

         animation:{
            "startup": true,
              duration: 2000,
              easing: 'out',
            },
         chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */},
               hAxis: {
                  textStyle:{fontSize:23, color: '#797979', fontName:'Noto Sans KR'},
                  gridlines: { color: "white" },
                  baselineColor: 'white' }, 
               	  vAxis: { textStyle:{fontSize:23, color: '#797979', fontName:'Noto Sans KR'},
                  baselineColor: 'lightgray',
                    titleTextStyle: { color: '#797979' }
               }   
      };
      var hireOrResign_chart = new google.visualization.LineChart(document.getElementById('empHireOrResignChart'));
                         
      hireOrResign_chart.draw(hireOrResign_chart_data, hireOrResign_chart_options);


   }

   function drawEmployeeCntChart() {
      var employee_chart_data = google.visualization.arrayToDataTable(${employee_chart_data});
      var employee_chart_options = {
         /* title: '직원 현황(직급별)', */
         width :1500, 
         height: 400,
         legend: {'position': 'right', textStyle: {fontSize:18,color: '#797979', fontName:'Noto Sans KR'}},
         colors:['#f5cf46','#f5cf46'],
         opacity: 0.5,
         animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            },
            chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */},

            hAxis: {
               textStyle:{fontSize:23, color: '#797979', fontName:'Noto Sans KR'},
               gridlines: {
                   color: "white"
               },
              baselineColor: 'white'/*, 
               ticks: []*/
            }, 
            vAxis: {
               textStyle:{fontSize:23, color: '#797979', fontName:'Noto Sans KR'},
                /* gridlines: {
                      color: "white"
                }, */
               baselineColor: 'lightgray',
                 titleTextStyle: {
                   color: '#797979'
                 }
            }   
            /* backgroundColor: {
                fill: '#eaeaea',
                fillOpacity: 0
              } */
      };

      var employee_chart = new google.visualization.ColumnChart(document.getElementById('employeeChart'));

      employee_chart.draw(employee_chart_data, employee_chart_options);
   }
   
   function drawDeptEmpCntChart() {
         var employee_chart_data = google.visualization.arrayToDataTable([
            ['부서명', '인원수']
            <c:forEach items="${requestScope.deptEmpCnt}" var="deptEmpCnt" varStatus="loopTagStatus">
               ,[ '${deptEmpCnt.dep_name}', ${deptEmpCnt.depCnt} ]
             </c:forEach>
         ]);
         //#ac92ec
         var employee_chart_options = {
                /* title: '직원 현황(부서별)', */
                width :800, 
                height: 400,
                legend: {'position': 'right', textStyle: {fontSize:15,color: '#797979', fontName:'Noto Sans KR'}},
                colors:['#aebeef','#aebeef'],
                opacity: 0.5,
                animation:{
                   "startup": true,
                     duration: 1000,
                     easing: 'out',
                   },

                   hAxis: {
                      textStyle:{fontSize:20, color: '#797979', fontName:'Noto Sans KR'},
                      gridlines: {
                          color: "white"
                      },
                     baselineColor: 'white'/*, 
                      ticks: []*/
                   }, 
                   vAxis: {
                      textStyle:{fontSize:20, color: '#797979', fontName:'Noto Sans KR'},
                       /* gridlines: {
                             color: "white"
                       }, */
                      baselineColor: 'lightgray',
                        titleTextStyle: {
                          color: '#797979'
                        }
                   }   
             };
         
         var employee_chart = new google.visualization.ColumnChart(document.getElementById('employeeChartDept'));
         
         employee_chart.draw(employee_chart_data, employee_chart_options);
   }
   
   function drawDayoffChart(){
      var data5 = google.visualization.arrayToDataTable([
          ['카테고리', '비율']
          ,['비휴직', ${perLeave.leaveF}]
          ,['휴직', ${perLeave.leaveT}]
       ]);
      
      var options5 = {
         width :700,
         chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */},
         legend: {'position': 'right', textStyle: {fontSize:25,color: '#222222', fontName:'Noto Sans KR'}},
         colors:['#ec8a8a','#86ea93'],
         height: 400,
         is3D: true
       };
      
      var chart5 = new google.visualization.PieChart(document.getElementById('drawDayoffChart'));
      
      chart5.draw(data5, options5);
   }
   
   
   function drawPieCategoryChart(){
      
      var data = google.visualization.arrayToDataTable([
          ['카테고리', '비율']
          <c:forEach items="${requestScope.perBookCat}" var="bookcat" varStatus="loopTagStatus">
              ,['${bookcat.cat_name}', ${bookcat.perNum}]
            </c:forEach>
       ]);
       var data2 = google.visualization.arrayToDataTable([
          ['카테고리', '비율']
          <c:forEach items="${requestScope.perCorpArea}" var="corparea" varStatus="loopTagStatus">
              ,['${corparea.business_area_name}', ${corparea.perCorp}]
            </c:forEach>
       ]);
       
       var options = {
            /* title: '분야 별 도서 비율', */
            width :700,
         height: 400,
         legend: {'position': 'right', textStyle: {fontSize:25,color: '#222222', fontName:'Noto Sans KR'}},
         colors:['#87a0ec','#ec8790','#70e8b6','#e8a770','#f9e03d','#97dddd','#9896a4','#ea4c4c','#b18f6a','#94e672','#b073e8'],
         chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */}, 
         is3D: true
          };
          var options2 = {
            /* title: '거래처 분야 비율', */
            width :700,
         height: 400,
         legend: {'position': 'right', textStyle: {fontSize:25,color: '#222222', fontName:'Noto Sans KR'}},
         /* colors:['#e8a770','#ea4c4c','#91a8d1','#034f83','#f9e03d','#97dddd','#9896a4','#dd4132','#b18f6a','#78c752','#ff1199'], */
         colors:['#87a0ec','#ec8790','#e8a770','#cea3e8', '#ea4c4c','#97dddd','#9896a4','#f9e03d','#b18f6a','#94e672','#70e8b6'],
         chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */},
         is3D: true
          };
          
          var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
         
        
        chart.draw(data, options);
        chart2.draw(data2, options2);
   }
   
/*
   function drawBarChart() {
      var category_reg_chart_data = google.visualization.arrayToDataTable(${bookCategory_reg_chart_data});
      var category_data_options = {
         title: '분야별 도서 계약 건수',
         width :700, 
         height: 300,
         colors:['#82F9B7','#82F9B7'],
         animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            }
      };

      var categoryReg_chart = new google.visualization.ColumnChart(document.getElementById('categoryRegChart'));

      categoryReg_chart.draw(category_reg_chart_data, category_data_options);
   
   }

   function drawCategoryChart() {
      var category_reg_chart_data = google.visualization.arrayToDataTable(${bookCategory_reg_chart_data});
      var category_data_options = {
         title: '분야별 도서 계약 건수',
         width :700, 
         height: 300,
         colors:['#00A5FF','#00A5FF'],
         
         animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            }
      };

      var categoryReg_chart = new google.visualization.ColumnChart(document.getElementById('categoryRegChart'));

      categoryReg_chart.draw(category_reg_chart_data, category_data_options);
   }


   function drawChart() {
      var monthlyBookReg_data = google.visualization.arrayToDataTable(${monthlyBook_reg_chart_data});
      //var data2 = google.visualization.arrayToDataTable(${corpOrder_chart_data});
      //var data3 = google.visualization.arrayToDataTable(${dailyOrder_chart_data});

      var monthlyBookReg_data_options = {   
         title: '월별 도서 계약 건수',
         width :700, 
         height: 300,
         colors:['#ac92ec','#ac92ec'],
         lineWidth: 4,
         animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            }
      };

      var monthlyBookReg_chart = new google.visualization.LineChart(document.getElementById('monthlyBookRegChart'));

      monthlyBookReg_chart.draw(monthlyBookReg_data, monthlyBookReg_data_options);

   }

   function goSearch(cat_cd) {
      
      $("[name=cat_cd]").val(cat_cd);
      //alert($("[name=category]").filter(":checked").val());
      $.ajax({
         url : "/group4erp/viewCategoryChart.do",            //호출할 서버쪽 URL 주소 설정
         type : "post",                              //전송 방법 설정
         data : $("[name=categoryBookChart]").serialize(),   //서버로 보낼 파라미터명과 파라미터값을 설정         
         success : function(data) {
            alert("성공!");
            if(data != null) {
               alert("성공!");
               google.charts.setOnLoadCallback(drawCateogoryChart);
               //drawBarChart(data);
               
            } else {
               alert("서버쪽 DB 연동 실패!");
            }
         }

         //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
         , error : function() {      //서버의 응답을 못받았을 경우 실행할 익명함수 설정
            alert("서버 접속 실패!");
         }   
      });

   }
*/

/*google.charts.load('current', {'packages' : ['corechart'] } );

google.charts.setOnLoadCallback(drawLineChart);

function drawLineChart() {

   var data3 = google.visualization.arrayToDataTable(${dailyOrder_chart_data});
   var data4 = google.visualization.arrayToDataTable(${dailyCorpOrder_chart_data});

   var options3 = {
         title: '일반고객 주문 건수(일자별)',
         width: 600,
         height:300
   };

   var options4 = {
         title: '사업자고객 주문 건수(일자별)',
         width: 600,
         height:300
   };

   var chart3 = new google.visualization.LineChart(document.getElementById('dailyOrderChart'));
   var chart4 = new google.visualization.LineChart(document.getElementById('dailyCorpOrderChart'));

   chart3.draw(data3, options3);
   chart4.draw(data4, options4);
}*/

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
            <a class="active"  href="javascript:;">
              <i class=" fa fa-bar-chart-o"></i>
              <span>전략 분석</span>
              </a>
            <ul class="sub">
              <li>
                <a href="/group4erp/viewBestKeywdAnalysis.do"><i class="fa fa-search"></i>키워드 검색 자료 조회</a>
              </li>
              <li class="active" >
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
      <section class="wrapper site-min-height">
        <h1><i class="fa fa-angle-right"></i> 회사현황</h1>
        <!-- page start-->
        <form name="categoryBookChart" method="post" action="/group4erp/viewCategoryChart.do">
         <div id="morris">
         
          <div class="row mt">
              <div class="content-panel">
                 <div style="height:15;"></div>
                <h3><i class="fa fa-angle-right"></i> 기간별 총원 변동 현황</h3>
                   <div id="empHireOrResignChart"> </div>
                   <div style="height:50;"></div>
              </div>
          </div>
         
         <div class="row mt">
              <div class="content-panel">
                <div style="height:15;"></div>
                <h3><i class="fa fa-angle-right" ></i> 직급별 직원현황</h3>
                  <div id="employeeChart"> </div>
                  <div style="height:50;"></div>
              </div>
              
         </div>
         
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h3><i class="fa fa-angle-right"></i> 부서별 직원현황</h3>
                <div class="panel-body">
                   <div id="employeeChartDept"></div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h3><i class="fa fa-angle-right" ></i> 휴직자 비율</h3>
                <div class="panel-body">
               <div id="drawDayoffChart" ></div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h3><i class="fa fa-angle-right"></i> 분야 별 도서 현황</h3>
                <div class="panel-body">
                   <div id="piechart"></div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h3><i class="fa fa-angle-right"></i> 분야 별 거래처 현황</h3>
                <div class="panel-body">
               <div id="piechart2"></div>
                </div>
              </div>
            </div>
          </div>
          
        </div>
        <input type="hidden" name="cat_cd">
   </form>
        <!-- page end-->
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
<script src="${ctRootlib}/raphael/raphael.min.js"></script>
<%-- <script src="${ctRootlib}/morris/morris.min.js"></script> --%>
<!--common script for all pages-->
<script src="${ctRootlib}/common-scripts.js"></script>
<!--script for this page-->
<%-- <script src="${ctRootlib}/morris-conf.js"></script> --%>


</body>
</html>
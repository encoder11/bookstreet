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
  <meta http-equiv="Conpatible" content="no-cache"/>
  <title>Dashio - Bootstrap Admin Template</title>

 <!-- Favicons -->
  <link href="${ctRootImg}/favicon.png" rel="icon">
  <link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${ctRootlib}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${ctRootlib}/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <%-- 
  <link href="${ctRootlib}/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${ctRootlib}/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${ctRootlib}/advanced-datatable/css/DT_bootstrap.css" />
  --%>
  <!-- Custom styles for this template -->
  <link href="${ctRootcss}/style.css" rel="stylesheet">
  <link href="${ctRootcss}/style-responsive.css" rel="stylesheet">
  <script src = "/www.google.com/jsapi"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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

</style>


<script type="text/javascript">

   $(document).ready(function() {
   
      startTime();
      
      $("#orderListTable").hide();

      headerSort("onLineSaleTable", 0);

      setTableTrBgColor(
         "onLineSaleTable",   //테이블 class 값
         "${headerColor}",         //헤더 tr 배경색
         "${oddTrColor}",      //홀수행 배경색
         "${evenTrColor}",   //짝수행 배경색
         "${mouseOverColor}"         //마우스 온 시 배경색
      );
   
      $('[name=rowSearch] [name=rowCntPerPage]').change(function(){
         goSearch();
      });

      /*
      $(".pagingNumber").html(
         getPagingNumber(
            "${onlineOrderCnt}"                  //검색 결과 총 행 개수
            ,"${salesSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
            ,"${salesSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
            ,"10"                              //페이지 당 보여줄 페이지번호 개수
            ,"goSearch();"                  //페이지 번호 클릭 후 실행할 자스코드
         )
      );
      */
   
      /*
      inputData('[name=rowCntPerPage]',"${salesSearchDTO.rowCntPerPage}");
      inputData('[name=selectPageNo]',"${salesSearchDTO.selectPageNo}");
      inputData('[name=sort]').val("${salesSearchDTO.sort}");
      */
      
      //$('[name=sort]').val("${corpSearchDTO.sort}");
   });

   //google.charts.load('current', {'packages' : ['bar'] } );
   //google.charts.setOnLoadCallback(drawChart);
   //function drawChart() {
      //var data1 = google.visualization.arrayToDataTable(${sales_chart_data});
      //var data2 = google.visualization.arrayToDataTable(${corpOrder_chart_data});
      //var data3 = google.visualization.arrayToDataTable(${dailyOrder_chart_data});
      //var options2 = {
      //      title: '기업고객 주문 건수(분야별)',
      //      width: 700,
      //      height:300,
      //      animation: { duration: 1000, }
      //};
      //var chart2 = new google.charts.Bar(document.getElementById('corpOrderInfoChart'));
      //var chart3 = new google.visualization.LineChart(document.getElementById('dailyOrderChart'));
      //var chart1 = new google.visualization.BarChart(document.getElementById('orderInfoChart'));
      //var chart2 = new google.visualization.ColumnChart(document.getElementById('corpOrderInfoChart'));
      //chart2.draw(data2, options2);
      //chart3.draw(data3, options3);
   //}


   google.charts.load('current', {'packages' : ['corechart'] } );
   google.charts.setOnLoadCallback(drawLineChart);
   function drawLineChart() {

           // 분야별 누적 주문 건수 차트 시작
         var orderByCat = google.visualization.arrayToDataTable(${sales_chart_data});
        var orderByCatOptions = {
                  width: 1500,
                  height:600,
                  lineWidth: 6,
                  colors:['#7c96e4', '#dee47c'],
                  chartArea: {'width': '70%', 'height': '80%'/* , 'right':10 */},
                  legend: {'position': 'right', textStyle: {fontSize:18, color: '#797979', fontName:'Noto Sans KR'}},
                  animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                          startup: true,
                          duration: 500,
                          easing: 'linear' 
                  },
                   hAxis: {
                       textStyle:{fontSize:20, color: '#797979'},
                    }, 
                    vAxis: {
                       textStyle:{fontSize:20, color: '#797979'},
                     baselineColor: 'lightgray',
                         titleTextStyle: {
                           color: '#797979'
                         }
                    }
           };

           var orderByCatchart = new google.visualization.ColumnChart(document.getElementById('orderInfoChart'));
           orderByCatchart.draw(orderByCat, orderByCatOptions);
           // 분야별 누적 주문 건수 차트 끝
           
           
           
   
      var data3 = google.visualization.arrayToDataTable(${dailyOrder_chart_data});
      //var data4 = google.visualization.arrayToDataTable(${dailyCorpOrder_chart_data});
      var offline_data = google.visualization.arrayToDataTable(${offline_chart_data});
   
      var options3 = {
            //title: '일반고객 주문 건수(일자별)',
            width: 1500,
            height:600,
            lineWidth: 4,
            colors:['#f59cac'],
            chartArea: {'width': '80%', 'height': '50%'/* , 'right':10 */},
            legend: {'position': 'right', textStyle: {fontSize:20, color: '#797979', fontName:'Noto Sans KR'}},
            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                    startup: true,
                    duration: 500,
                    easing: 'linear' 
               },
             hAxis: {
                 textStyle:{fontSize:21, color: '#797979'},
              }, 
              vAxis: {
                 textStyle:{fontSize:21, color: '#797979'},
               baselineColor: 'lightgray',
                   titleTextStyle: {
                     color: '#797979'
                   }
              }
      };
/*
      var options4 = {
            title: '사업자고객 주문 건수(일자별)',
            width: 1200,
            height:500,
            chartArea: {'width': '80%', 'height': '80%'}, // , 'right':10
            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                    startup: true,
                    duration: 1000,
                    easing: 'linear' 
               }
      };
*/

      var offline_option = {
            //title: '온/오프라인매장 판매 건수(일자별)',
            width: 1500,
            height:550,
            lineWidth: 7,
            colors:['#f0ad4e', '#4eccc4'],
            legend: {'position': 'right', textStyle: {fontSize:20, color: '#797979', fontName:'Noto Sans KR'}},
            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                    startup: true,
                    duration: 500,
                    easing: 'linear' 
               },
             hAxis: {
                 textStyle:{fontSize:23, color: '#797979'},
              }, 
              vAxis: {
                 textStyle:{fontSize:23, color: '#797979'},
               baselineColor: 'lightgray',
                   titleTextStyle: {
                     color: '#797979'
                   }
              }
            

      };
   
      var chart3 = new google.visualization.LineChart(document.getElementById('dailyOrderChart'));
      //var chart4 = new google.visualization.LineChart(document.getElementById('dailyCorpOrderChart'));
      var offline_chart = new google.visualization.LineChart(document.getElementById('dailyOfflineChart'));
      
      //var chart1 = new google.visualization.BarChart(document.getElementById('orderInfoChart'));
      //var chart2 = new google.visualization.ColumnChart(document.getElementById('corpOrderInfoChart'));
   
      chart3.draw(data3, options3);
      //chart4.draw(data4, options4);
      offline_chart.draw(offline_data, offline_option);
   
   }
   
      
   function goSearch() {

      var keyword = $("[name=saleSearchForm] [name=searchKeyword]").val();
      keyword = $.trim(keyword);
      $("[name=saleSearchForm] [name=searchKeyword]").val(keyword);
      
      document.saleSearchForm.submit();
      //alert($('[name=saleSearchForm]').serialize());
      /*$.ajax({
         url : "/group4erp/viewSalesInfoList.do",            //호출할 서버쪽 URL 주소 설정
         type : "post",                              //전송 방법 설정
         //dataType :"json",
         data : $('[name=saleSearchForm]').serialize(),      //서버로 보낼 파라미터명과 파라미터값을 설정
         
         success : function(data) {
            
            //console.log("data==="+data.onlineOrderCnt);
               
               var salesSearchDTO = data.salesSearchDTO;
               var onlineOrderCnt = data.onlineOrderCnt;
               var onlineOrderList = data.onlineOrderList;
               var corpOrderCnt = data.corpOrderCnt;
               var corpTotRevenue = data.corpTotRevenue;
               var tot_revenue = data.tot_revenue;
               var sales_chart_data = data.sales_chart_data;
               //alert("onlineOrderCnt=="+onlineOrderCnt);
               
               //location.replace("/group4erp/viewSalesInfoList.do");
         }

         //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
         , error : function() {      //서버의 응답을 못받았을 경우 실행할 익명함수 설정
            alert("서버 접속 실패!");
         }   
      }); */
   }

   function goSearchAll() {
      document.saleSearchForm.reset();

      $('[name=saleSearchForm] [name=selectPageNo]').val("1");
      $('[name=saleSearchForm] [name=rowCntPerPage]').val("15");
      
      goSearch();
   }
   
   
   function showOrderList() {
      $("#orderListTable").show();
   }

   function hideOrderList() {
      $("#orderListTable").hide();
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
              <li class="active">
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
      <section class="wrapper site-min-height">
        <h3 align=left><i class="fa fa-angle-right"></i> [주문 & 판매현황]</h3>
        <!-- page start-->
        <div class="content-panel">
        <table><tr><td height="10"></td></tr></table>
        <table cellpadding="10" cellspacing="5" align="center" border=0 style="font-size:14pt; width:90%; border-color:#eaeaea" >
               <tr>
                  <td colspan="2" height=90 align="center"><h3><u>일반 고객 판매 현황</u></h3></td>
               </tr>
               <tr>
                  <td bgcolor="#313333" height=50 align="center" style="color:#beedff"><u><i class="fa fa-bar-chart-o">&nbsp;오프라인 판매량&nbsp;</i></u></td>
                  <td bgcolor="#313333" height=50 align="center" style="color:#beedff"><u><i class="fa fa-bar-chart-o">&nbsp;온라인 주문량&nbsp;</i></u></td>
               </tr>
               <tr>
                     <td bgcolor="#eaeaea" height=50 align="center"><font style="font-size:17pt; font-weight:bold; color:#de6c6c;">${dailyOfflineSalesTotCnt.tot_cnt}</font>건</td>
                  <td bgcolor="#eaeaea" height=50 align="center"><font style="font-size:17pt; font-weight:bold; color:#de6c6c;">${onlineOrderCnt}</font>건</td>
                  
               </tr>
               <tr>
                     <td bgcolor="#eaeaea" height=50 style="padding-left:10;" align="center">총 예상 수입액  : 
                     <font style="font-size:17pt; font-weight:bold; color:#3acc88;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dailyOfflineSalesTotCnt.tot_revenue}" /></font>원
                     </td>
                  <td bgcolor="#eaeaea" height=50 style="padding-left:10;" align="center">총 예상 수입액 : 
                  <font style="font-size:17pt; font-weight:bold; color:#3acc88;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${tot_revenue}" /></font>원
                  </td>
               </tr>
            </table>
            <table><tr><td height="45"></td></tr></table>
         </div>
         <div style="height:20;"></div>
        <div class="content-panel">
          <div style="height:20;"></div>
          <h3><i class="fa fa-angle-right"></i> 온/오프라인 매장 판매 건수(전월)</h3>
          <!-- <div class="panel-body"> -->
            <div id="dailyOfflineChart"> </div>
            <table border=0 style="width:100%; height:100;"><tr><td width="90%"></td><td><font style="font-size:15pt;">단위:1건</font></td></tr></table>
            
          <!-- </div> -->
        </div>
        <div style="height:20;"></div>
       <div class="content-panel">
       <div style="height:20;"></div>
             <h3><i class="fa fa-angle-right"></i> 분야별 누적 주문 건수</h3>
             <div id="orderInfoChart"> </div>
             <table border=0 style="width:100%; height:80;"><tr><td width="90%"></td><td><font style="font-size:15pt;"></font></td></tr></table>
          <!-- <div class="panel-body"> -->
           <!-- style="width: 1100px; height: 300px;" -->
          <!-- </div> -->
        </div>
        <div style="height:20;"></div>
        <div class="content-panel">
          <div style="height:20;"></div>
          <h3><i class="fa fa-angle-right"></i>  일반고객 주문 건수(2019년)</h3>
          <!-- <div class="panel-body"> -->
            <div id="dailyOrderChart"> </div>
            <table border=0 style="width:100%; height:80;"><tr><td width="90%"></td><td><font style="font-size:15pt;"></font></td></tr></table>
          <!-- </div> -->
        </div>
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
  <%-- 
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.js"></script>
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="${ctRootlib}/advanced-datatable/js/DT_bootstrap.js"></script> --%>
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
  
</body>

</html>
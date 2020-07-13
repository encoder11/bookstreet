<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html lang="en">

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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(allOnlineOrder);
google.charts.setOnLoadCallback(allOfflineOrder);
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawMoneyChart);

$(document).ready( function() {
    
   
   startTime();
   
   
     $('[name=month_choice]').change(function(){
        //alert($(this).val());
       drwaOnlineChartAjax($(this).val()); 
       
       drwaOfflineChartAjax($(this).val()); 
       
       $('[name=month_choice]').val($(this).val());
     });
     
});
function showTime() {
    //현재 날짜를 관리하는 Date 객체 생성
    var today = new Date();
    //----------------------------------------
    //Date 객체에서 날짜 관련 각 데이터를 꺼내어 저장하는 변수 선언
    var amPm = "오후";
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    var week = today.getDay();
    var date = today.getDate();
    var hour = today.getHours();
    var minute = today.getMinutes();
    var second = today.getSeconds();

    var week = ["일", "월", "화", "수", "목", "금", "토"][today.getDay()];
    //날짜 관련 각 데이터가 10 미만이면 앞에 0 붙이기
    //오전, 오후 여부 판단해서 저장하기
    
    if(month<10) {
       month = "0"+month;
    }

    if(date<10) {
       date = "0"+date;
    }

    if(hour<12) {
       amPm = "오전";
    }

    if(hour>12) {
       hour=hour-12;
    }

    if(hour<10) {
       hour="0"+hour;
    }

    if(minute<10) {
       minute = "0"+minute;
    }

    if(second<10) {
       second = "0" + second;
    }
    //id="nowTime"가 있는 태그영역 내부에 시간 문자열 삽입

    document.getElementById("nowTime").innerHTML = year+"년 "+month+"월 "+date+"일("+week+") "+amPm+" "+hour+"시 "+minute+"분 "+second+"초 ";
    
 }

   function startTime() {
   showTime();      //1초 딜레이 되어 시간이 표시되는 현상을 제거하기 위해 showTime() 함수를 한 번 호출한다.
   //-----------------------------------
   //1초마다 showTime() 함수를 호출하기
   //-----------------------------------
   window.setInterval("showTime()", 1000);      //window.setInterval(function() { showTime(); }, 1000);
   }

function drwaOnlineChartAjax(thisVal){
     
     var checkVal = "month_choice="+thisVal;
     
     if(thisVal==""){
        $("#onlineOrder").children().remove();
        $("#onlineOrder").append("<div id='piechart8' align='center'></div>");
        allOnlineOrder();
        return;
     }
     
     $.ajax({
            url : "/group4erp/goOnlineOrderProc.do"
            , type : "post"
            , data : checkVal
            , success : function(manyDTO){
              
               //chartDataOnline.push([ "['카테고리', '비율']" ]);

               if(thisVal!=null){
                  
                  var cat_online_ajax = [];
                   var per_online_ajax = [];
                  for(var i=0; i<=10 ; i++){
                      //alert(manyDTO[i].cat_name_online);
                      //chartDataOnline.push("['" + manyDTO[i].cat_name_online + "'," + manyDTO[i].peronlineorder + "]");
                      //alert(chartDataOnline[i]);
                     cat_online_ajax.push(manyDTO[i].cat_name_online);
                     per_online_ajax.push(manyDTO[i].peronlineorder)
                 }

                  $("#onlineOrder").children().remove();
                  $("#onlineOrder").append("<div id='onlineChart' align='center'></div>");
                   
                  //google.charts.setOnLoadCallback(drawOnlineChart);
                  drawOnlineChart(cat_online_ajax, per_online_ajax);
               }
            }
            , error : function(){
               alert("서버 접속 실패");
            }
         });
     
}

function drwaOfflineChartAjax(thisVal){
     
     var checkVal = "month_choice="+thisVal;
     
     if(thisVal==""){
        $("#offlineOrder").children().remove();
        $("#offlineOrder").append("<div id='piechart10' align='center'></div>");
        allOfflineOrder();
        return;
     }
     
     $.ajax({
            url : "/group4erp/goOfflineOrderProc.do"
            , type : "post"
            , data : checkVal
            , success : function(manyDTO){
              
               //alert(manyDTO[0].cat_name_online);
               
               //chartDataOnline.push([ "['카테고리', '비율']" ]);

               if(thisVal!=null){
                  
                  var cat_offline_ajax = [];
                   var per_offline_ajax = [];
                  for(var i=0; i<=10 ; i++){
                      //alert(manyDTO[i].cat_name_online);
                      //chartDataOnline.push("['" + manyDTO[i].cat_name_online + "'," + manyDTO[i].peronlineorder + "]");
                      //alert(chartDataOnline[i]);
                     cat_offline_ajax.push(manyDTO[i].cat_name_offline);
                     per_offline_ajax.push(manyDTO[i].perofflineorder)
                 }

                  $("#offlineOrder").children().remove();
                  $("#offlineOrder").append("<div id='offChart' align='center'></div>");
                   
                  //google.charts.setOnLoadCallback(drawOnlineChart);
                  drawOfflineChart(cat_offline_ajax, per_offline_ajax);
               }
            }
            , error : function(){
               alert("서버 접속 실패");
            }
         });
     
}

function drawOnlineChart(cat_offline_ajax, per_offline_ajax){
     
     //alert(cat_online_ajax[0]+'');
     //alert(per_online_ajax);
     /*
     chartDataOnline += "['카테고리', '비율']";
     
     for(var i=0 ; i<=10 ; i++){
        chartDataOnline += ",['";
        chartDataOnline += cat_online_ajax[i];
        chartDataOnline += "',";
        chartDataOnline += Number(per_online_ajax[i]);
        chartDataOnline += "]"
     }*/
     
     var online_data = google.visualization.arrayToDataTable([
        //chartDataOnline
        
        ['카테고리', '비율'],
        [cat_offline_ajax[0]+'', Number(per_offline_ajax[0])],
        [cat_offline_ajax[1]+'', Number(per_offline_ajax[1])],
        [cat_offline_ajax[2]+'', Number(per_offline_ajax[2])],
        [cat_offline_ajax[3]+'', Number(per_offline_ajax[3])],
        [cat_offline_ajax[4]+'', Number(per_offline_ajax[4])],
        [cat_offline_ajax[5]+'', Number(per_offline_ajax[5])],
        [cat_offline_ajax[6]+'', Number(per_offline_ajax[6])],
        [cat_offline_ajax[7]+'', Number(per_offline_ajax[7])],
        [cat_offline_ajax[8]+'', Number(per_offline_ajax[8])],
        [cat_offline_ajax[9]+'', Number(per_offline_ajax[9])],
        [cat_offline_ajax[10]+'', Number(per_offline_ajax[10])]
        
    ]);
     
     //alert(online_data);
     
     var online_options8 = {
         /* title: '온라인 주문 분야 비율 (월)', */
         width :700,
         height: 450,
         is3D: true,
         chartArea: {'width': '100%', 'height': '100%'/* , 'right':10 */},
         legend: {'position': 'right', textStyle: {fontSize:25, color: '#797979', fontName:'Noto Sans KR'}},
         colors:['#87a0ec','#ec8790','#70e8b6','#e8a770','#f9e03d','#97dddd','#9896a4','#ea4c4c','#b18f6a','#94e672','#b073e8']
       };
     
     var onlineChart = new google.visualization.PieChart(document.getElementById('onlineChart'));

     onlineChart.draw(online_data, online_options8);
     
}

   function drawOfflineChart(cat_online_ajax, per_online_ajax){

     var offline_data = google.visualization.arrayToDataTable([
        //chartDataOnline
        
        ['카테고리', '비율'],
        [cat_online_ajax[0]+'', Number(per_online_ajax[0])],
        [cat_online_ajax[1]+'', Number(per_online_ajax[1])],
        [cat_online_ajax[2]+'', Number(per_online_ajax[2])],
        [cat_online_ajax[3]+'', Number(per_online_ajax[3])],
        [cat_online_ajax[4]+'', Number(per_online_ajax[4])],
        [cat_online_ajax[5]+'', Number(per_online_ajax[5])],
        [cat_online_ajax[6]+'', Number(per_online_ajax[6])],
        [cat_online_ajax[7]+'', Number(per_online_ajax[7])],
        [cat_online_ajax[8]+'', Number(per_online_ajax[8])],
        [cat_online_ajax[9]+'', Number(per_online_ajax[9])],
        [cat_online_ajax[10]+'', Number(per_online_ajax[10])]
        
    ]);
     
     
     var offline_options8 = {
         /* title: '오프라인 주문 분야 비율 (월)', */
         width :700,
         height: 450,
         is3D: true,
         chartArea: {'width': '100%', 'height': '100%'/* , 'right':10 */},
         legend: {'position': 'right', textStyle: {fontSize:25, color: '#797979', fontName:'Noto Sans KR'}},
         colors:['#87a0ec','#ec8790','#70e8b6','#e8a770','#f9e03d','#97dddd','#9896a4','#ea4c4c','#b18f6a','#94e672','#b073e8']
       };
     
     var offlineChart = new google.visualization.PieChart(document.getElementById('offChart'));

     offlineChart.draw(offline_data, offline_options8);
     
}



function allOfflineOrder(){
     var data10 = google.visualization.arrayToDataTable([
          ['카테고리', '비율']
          <c:forEach items="${requestScope.perOffOrder}" var="offorder" varStatus="loopTagStatus">
              ,['${offorder.cat_name_off}', ${offorder.perofforder}]
          </c:forEach>
       ]);
     
     var options10 = {
            /* title: '오프라인 주문 분야 비율', */
            width :700,
            height: 450,
            is3D: true,
            chartArea: {'width': '100%', 'height': '100%'/* , 'right':10 */},
            legend: {'position': 'right', textStyle: {fontSize:25, color: '#000000', fontName:'Noto Sans KR'}},
            colors:['#87a0ec','#ec8790','#70e8b6','#e8a770','#f9e03d','#97dddd','#9896a4','#ea4c4c','#b18f6a','#94e672','#b073e8']
          };

       var chart10 = new google.visualization.PieChart(document.getElementById('piechart10'));

       chart10.draw(data10, options10);
}
function allOnlineOrder(){
    var data8 = google.visualization.arrayToDataTable([
         ['카테고리', '비율']
         <c:forEach items="${requestScope.perOnlineOrder}" var="onlineorder" varStatus="loopTagStatus">
             ,['${onlineorder.cat_name_online}', ${onlineorder.peronlineorder}]
         </c:forEach>
      ]);
    var options8 = {
           /* title: '온라인 주문 분야 비율', */
           width :700,
           height: 450,
           is3D: true,
           chartArea: {'width': '100%', 'height': '100%'/* , 'right':10 */},
           legend: {'position': 'right', textStyle: {fontSize:25, color: '#000000', fontName:'Noto Sans KR'}},
           colors:['#87a0ec','#ec8790','#70e8b6','#e8a770','#f9e03d','#97dddd','#9896a4','#ea4c4c','#b18f6a','#94e672','#b073e8']
         };

      var chart8 = new google.visualization.PieChart(document.getElementById('piechart8'));

      chart8.draw(data8, options8);
}

function drawChart() {
   
   var data3 = google.visualization.arrayToDataTable([
       ['카테고리', '비율']
       ,['온라인', ${perLine.on_line}]
       ,['오프라인', ${perLine.off_line}]
    ]);
    var data4 = google.visualization.arrayToDataTable([
       ['카테고리', '비율']
       ,['회원', ${perMember.memberY}]
       ,['비회원', ${perMember.memberN}]
    ]);
    var options3 = {
      /* title: '온/오프라인 주문 비율', */
      width :700,
      height: 450,
      is3D: true,
      chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */},
      legend: {'position': 'right', textStyle: {fontSize:25, color: '#797979', fontName:'Noto Sans KR'}},
      colors:['#557c96','#efde74']
    };
    var options4 = {
      /* title: '회원/비회원 주문 비율', */
      width :700,
      height: 450,
      is3D: true,
      chartArea: {'width': '80%', 'height': '80%'/* , 'right':10 */},
      legend: {'position': 'right', textStyle: {fontSize:25, color: '#797979', fontName:'Noto Sans KR'}},
      colors:['#879ad4','#de7d7d']
    };
    
    var chart3 = new google.visualization.PieChart(document.getElementById('piechart3'));
    var chart4 = new google.visualization.PieChart(document.getElementById('piechart4'));
    
    chart3.draw(data3, options3);
    chart4.draw(data4, options4);
}

function drawMoneyChart() {
    var online_chart_data = google.visualization.arrayToDataTable([
       ['날짜', '금액']
       <c:forEach items="${requestScope.monthTotMoney}" var="monthTotMoney" varStatus="loopTagStatus">
            ,['${monthTotMoney.monthsort}', ${monthTotMoney.totmoneyM}]
          </c:forEach>
    ]);
    var offline_chart_data = google.visualization.arrayToDataTable([
       ['날짜', '금액']
       <c:forEach items="${requestScope.offMonthTotMoney}" var="offMonthTotMoney" varStatus="loopTagStatus">
            ,['${offMonthTotMoney.offmonthsort}', ${offMonthTotMoney.offtotmoney}]
          </c:forEach>
    ]);
    var credit_data = google.visualization.arrayToDataTable([
       ['날짜', '금액']
       <c:forEach items="${requestScope.creditTot}" var="creditTot" varStatus="loopTagStatus">
            ,['${creditTot.creditmonth}', ${creditTot.credittot}]
          </c:forEach>
    ]);
    var debit_data = google.visualization.arrayToDataTable([
       ['날짜', '금액']
       <c:forEach items="${requestScope.debitTot}" var="debitTot" varStatus="loopTagStatus">
            ,['${debitTot.debitmonth}', ${debitTot.debittot}]
          </c:forEach>
    ]);
    var onlinemonthTotMoney_chart_options = {
          /* title: "온라인 월별 총 매출 액", */
          width :1600,
          height: 500,
          colors:['#f19595','#f19595', 'opacity: 0.2'],
        animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
              color: '#b97df0'
            },
         chartArea: {'width': '70%', 'height': '60%'/* , 'right':10 */},
         legend: {'position': 'right', textStyle: {fontSize:23, color: '#797979', fontName:'Noto Sans KR'}},

          hAxis: {
             textStyle:{color: '#797979', fontSize:23},
             gridlines: {
                 color: "white"
             },
            baselineColor: 'white'/*, 
             ticks: []*/
          }, 
          vAxis: {
             textStyle:{color: '#797979', fontSize:23},
                /* gridlines: {
                      color: "white"
                }, */
               baselineColor: 'lightgray',
               titleTextStyle: {
                 color: '#797979'
               }
          }
    };
    var offlinemonthTotMoney_chart_options = {
          /* title: "오프라인 월별 총 매출 액", */
          width :1600,
          height: 500,
          colors:['#70b9b9','#70b9b9', 'opacity: 0.2'],   /* 막대 그래프 색. 하나는 주석 색, 하나는 막대 색 */
        animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            },
           chartArea: {'width': '70%', 'height': '60%'/* , 'right':10 */},
         legend: {'position': 'right', textStyle: {fontSize:25, color: '#797979', fontName:'Noto Sans KR'}},

          hAxis: {
             textStyle:{color: '#797979', fontSize:25},
             gridlines: {
                 color: "white"
             },
            baselineColor: 'white'/*, 
             ticks: []*/
          }, 
          vAxis: {
             textStyle:{color: '#797979', fontSize:25},
                /* gridlines: {
                      color: "white"
                }, */
               baselineColor: 'lightgray',
               titleTextStyle: {
                 color: '#000000'
               }
          }
    };
    var creditMonth_options = {
          /* title: "월별 총 매출 액", */
          width :1600,
          height: 500,
          colors:['#e4c378','#e4c378', 'opacity: 0.2'],
        animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            },
           chartArea: {'width': '70%', 'height': '60%'/* , 'right':10 */},
         legend: {'position': 'right', textStyle: {fontSize:23, color: '#797979', fontName:'Noto Sans KR'}},

          hAxis: {
             textStyle:{color: '#797979', fontSize:23},
             gridlines: {
                 color: "white"
             },
            baselineColor: 'white'/*, 
             ticks: []*/
          }, 
          vAxis: {
             textStyle:{color: '#797979', fontSize:23},
                /* gridlines: {
                      color: "white"
                }, */
               baselineColor: 'lightgray',
               titleTextStyle: {
                 color: '#797979'
               }
          }
    };
    var debitMonth_options = {
          /* title: "월별 총 지출 액", */
          width :1600,
          height: 500,
          colors:['#b38bd8','#b38bd8', 'opacity: 0.2'],
        animation:{
            "startup": true,
              duration: 1000,
              easing: 'out',
            },
           chartArea: {'width': '70%', 'height': '60%'/* , 'right':10 */},
         legend: {'position': 'right', textStyle: {fontSize:23, color: '#797979', fontName:'Noto Sans KR'}},

          hAxis: {
             textStyle:{color: '#797979', fontSize:23},
             gridlines: {
                 color: "white"
             },
            baselineColor: 'white'/*, 
             ticks: []*/
          }, 
          vAxis: {
             textStyle:{color: '#797979', fontSize:23},
                /* gridlines: {
                      color: "white"
                }, */
               baselineColor: 'lightgray',
               titleTextStyle: {
                 color: '#797979'
               }
          }
    };

    var onlinemonthTotMoney_chart = new google.visualization.ColumnChart(document.getElementById('onlinemonthTotMoneyChart'));
    var offlinemonthTotMoney_chart = new google.visualization.ColumnChart(document.getElementById('offlinemonthTotMoneyChart'));
    var creditTotChart = new google.visualization.ColumnChart(document.getElementById('creditTotChart'));
    var debitTotChart = new google.visualization.ColumnChart(document.getElementById('debitTotChart'));

    onlinemonthTotMoney_chart.draw(online_chart_data, onlinemonthTotMoney_chart_options);
    offlinemonthTotMoney_chart.draw(offline_chart_data, offlinemonthTotMoney_chart_options);
    creditTotChart.draw(credit_data, creditMonth_options);
    debitTotChart.draw(debit_data, debitMonth_options);
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
            <a class="active" href="javascript:;">
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
              <li class="active">
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
        <h3><i class="fa fa-angle-right"></i> 시장 분석 자료</h3>
        <!-- page start-->
        <div id="morris">
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 온라인 주문 분야 별 비율</h2>
                <div class="panel-body">
                <select name=month_choice>
               <option value="">전체</option>
               <option value="01">1월</option>
               <option value="02">2월</option>
               <option value="03">3월</option>
               <option value="04">4월</option>
               <option value="05">5월</option>
               <option value="06">6월</option>
               <option value="07">7월</option>
               <option value="08">8월</option>
               <option value="09">9월</option>
               <option value="10">10월</option>
               <option value="11">11월</option>
               <option value="12">12월</option>
            </select>
                  <div id="onlineOrder">
               <div id="piechart8" align=center>
               </div>
               </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 오프라인 판매 분야 별 비율</h2>
                <div class="panel-body">
                <select name=month_choice>
               <option value="">전체</option>
               <option value="01">1월</option>
               <option value="02">2월</option>
               <option value="03">3월</option>
               <option value="04">4월</option>
               <option value="05">5월</option>
               <option value="06">6월</option>
               <option value="07">7월</option>
               <option value="08">8월</option>
               <option value="09">9월</option>
               <option value="10">10월</option>
               <option value="11">11월</option>
               <option value="12">12월</option>
            </select>
                  <div id="offlineOrder">
               <div id="piechart10" align=center>
               </div>
               </div>
                </div>
              </div>
            </div>
          </div>
          
          <div style="height:30"></div>
          
          <div class="content-panel">
          <!-- <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel"> -->
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 온라인 월별 총 매출</h2>
               <!--  <div class="panel-body"> -->
                  <div id="onlinemonthTotMoneyChart" align=center></div>
<!--                 </div>
              </div>
            </div> -->
          <div style="height:30"></div>
          </div>
          
          <div style="height:30"></div>
          <div class="content-panel">
          <!-- <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel"> -->
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 오프라인 월별 총 매출</h2>
                <!-- <div class="panel-body"> -->
                  <div id="offlinemonthTotMoneyChart" align=center></div>
                <!-- </div>
              </div>
            </div> -->
          <div style="height:30"></div>
          </div>
          
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 온/오프라인 주문 비율</h2>
                <div class="panel-body">
                  <div id="piechart3" align=center></div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 회원/비회원 주문 비율</h2>
                <div class="panel-body">
                  <div id="piechart4" align=center></div>
                </div>
              </div>
            </div>
          </div>
          
          <div style="height:30"></div>
          <div class="content-panel">
          <!-- <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel"> -->
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 월별 총 매출</h2>
                <!-- <div class="panel-body"> -->
                  <div id="creditTotChart" align=center></div>
                <!-- </div>
              </div>
            </div> -->
          <div style="height:30"></div>
          </div>
          
          
          <div style="height:30"></div>
          <div class="content-panel">
          <!-- <div class="row mt">
             <div class="col-lg-6">
              <div class="content-panel"> -->
                <h2>&nbsp;&nbsp;<i class="fa fa-angle-right"></i> 월별 총 지출</h2>
                <!-- <div class="panel-body"> -->
                  <div id="debitTotChart" align=center></div>
                <!-- </div>
              </div>
            </div> -->
          </div>
          <div style="height:30"></div>
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
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="${ctRootlib}/raphael/raphael.min.js"></script>
  <script src="${ctRootlib}/morris/morris.min.js"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
  <script src="${ctRootlib}/morris-conf.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<script src = "https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src = "/www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>전략 분석 자료</title>
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
   $("#bestKwdAnalysis").hide();
   
   $("[name=rank]").change(function() {
      
      var cnt = $(this).filter(":checked").length;
      var rank='';

      if(cnt==1) {
         //change 이벤트가 발생한 체크박스의 형제들의 체크를 모두 풀기
         $(this).siblings().prop("checked", false);
         rank = $(this).filter(":checked").val();
      } 

      goSearch(rank);

   });

   /* setTableTrBgColor(
         "bestKeywdTable",   //테이블 class 값
         "white",         //헤더 tr 배경색
         "${oddTrColor}",      //홀수행 배경색
         "${evenTrColor}",   //짝수행 배경색
         "${mouseOverColor}"         //마우스 온 시 배경색
      ); */

   $(".pagingNumber").html(
         getPagingNumber(
            "${corpListCnt}"                  //검색 결과 총 행 개수
            ,"${corpSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
            ,"${corpSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
            ,"10"                              //페이지 당 보여줄 페이지번호 개수
            ,"goSearch();"                  //페이지 번호 클릭 후 실행할 자스코드
         )
      );

   //inputData('[name=rowCntPerPage]',"${corpSearchDTO.rowCntPerPage}");
   inputData('[name=selectPageNo]',"${corpSearchDTO.selectPageNo}");
   
});

google.charts.load('current', {'packages' : ['corechart'] } );

google.charts.setOnLoadCallback(drawChart);


function drawChart() {
   var data = google.visualization.arrayToDataTable(${bestKwd_chart_data});

   var options = {
        /*  title: '일별 키워드 검색 건수', */
         width :1200, 
         height: 500,
         chartArea: {'width': '80%', 'height': '70%'/* , 'right':10 */},
         colors:['#4ECDC4','#4ECDC4'],
         legend: {'position': 'right', textStyle: {fontSize:17,color: '#797979', fontName:'Noto Sans KR'}},
         lineWidth: 4,
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
            baselineColor: 'white'
          }, 
          vAxis: {
             textStyle:{fontSize:20, color: '#797979', fontName:'Noto Sans KR'},

             baselineColor: 'lightgray',
               titleTextStyle: {
                 color: '#797979'
               }
          }   
   };

   var chart = new google.visualization.LineChart(document.getElementById('bestKwdCntChart'));

   chart.draw(data, options);
}

function goSearch(rank) {
   //alert(rank);
   $.ajax({
        url : "/group4erp/searchBestKwd.do"
        , type: "post"
        , data : "rank="+rank
        , dataType:"JSON"
        ,success : function(data){
              if(data != null){
                 var len = $(".bestKeywdTable tr").length-1;
          
                  for(var i=1; i<=data.length; i++) {
               $(".bestKeywdTable tr:eq("+i+")").find("td:eq(0)").html(data[i-1].rank);
               $(".bestKeywdTable tr:eq("+i+")").find("td:eq(1)").html(data[i-1].srch_kwd);
               $(".bestKeywdTable tr:eq("+i+")").find("td:eq(2)").html(data[i-1].kwd_cnt);                  
                }

            if(data.length < len) {
               for(var i=len; i>data.length; i--) {
                  $(".bestKeywdTable tr:eq("+i+")").remove();
               }
            } else if(data.length >= len){
               //alert("len=="+len+" / "+data.length);
               for(var i=len; i<=data.length; i++ ) {
                  $(".bestKeywdTable tr:eq("+(i)+")").after("<tr onClick='viewKwdDailyCnt("+data[i].srch_kwd+");'>"+
                  								"<td align='center' style='font-size:15pt;'>"+data[i].rank+"</td>"+
                                                "<td align='center' style='font-size:15pt;'>"+data[i].srch_kwd+"</td>"+
                                                "<td align='center' style='font-size:15pt;'>"+data[i].kwd_cnt+"</td></tr>");
                  
               }
            }
              }
        } 
        , error : function() {
           alert("서버 접속 실패");
        }
     });
}

function viewKwdDailyCnt(searchKeyword) {
   alert("test");
}

function viewKwdDailyCnt() {
   alert("test2");
}

function openBestKwdData() {
   $("#bestKwdAnalysis").show();
}
   


</script>


</head>
<body><%-- <center>
=======
<%-- <center>
>>>>>>> refs/remotes/b_kth/b_kth
   <h1>[키워드 검색 분석 자료]</h1><br>
   
   <form name="keywordSearchForm" method="post" action="/group4erp/searchKeywordInfo.do">
      <table border="0" cellpadding="5" cellspacing="5" >
         
         <tr>
            <td align="left">[상위순]</td><td><input type="checkbox" name="rank" class="rank" value="10">Best 10 &nbsp;
                                 <input type="checkbox" name="rank" class="rank" value="15">Best 15 &nbsp;
                                 <input type="checkbox" name="rank" class="rank" value="20">Best 20 &nbsp;</td>
         </tr>
      </table>
      <input type="hidden" name="selectPageNo">
        
   </form>
   
   <table name="outerBorderTb" border="0" cellpadding="5" cellspacing="5" height="100%">
      <tr>
         <td valign="top">
            <div id="bestKwdCntChart" style="width: 800px; height: 500px;"> </div>
         </td>
            
         <td valign="top">
            <table class="bestKeywdTable tab" name="bestKeywdTable tab" cellpadding="5" cellspacing="5">
               <th style="cursor:pointer">순위</th><th style="cursor:pointer">키워드</th><th style="cursor:pointer">검색 횟수</th>
                  <c:forEach items='${bestKwdDTOList}' var="bestKwdDTOList" varStatus="loopTagStatus">
                     <tr onClick="viewKwdDailyCnt('${bestKwdDTOList.srch_kwd}');">
                        <td align="center">${bestKwdDTOList.rank}</td>
                        <td align="center">${bestKwdDTOList.srch_kwd}</td>
                        <td align="center">${bestKwdDTOList.kwd_cnt}</td>            
                     </tr>            
                  </c:forEach>
            </table>
         </td>
      </tr>      
   </table>

</div>


   
</center> --%>


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
            <a class="active"  href="javascript:;">
              <i class=" fa fa-bar-chart-o"></i>
              <span>전략 분석</span>
              </a>
            <ul class="sub">
              <li class="active" >
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
      <section class="wrapper site-min-height">
        <div align="left"><h3><i class="fa fa-angle-right"></i>키워드 검색 분석 자료</h3></div>
        <!-- page start-->
        <div class="content-panel">
          <div align="left"><h3>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right"></i>  일별 키워드 검색 건수</h3></div>
          [상위순]&nbsp; <input type="checkbox" name="rank" class="rank" value="10"><font style="font-size:17pt;">Best 10 &nbsp;</font>
            <input type="checkbox" name="rank" class="rank" value="15"><font style="font-size:17pt;">Best 15 &nbsp;</font>
            <input type="checkbox" name="rank" class="rank" value="20"><font style="font-size:17pt;">Best 20 &nbsp;</font>
                <input type="hidden" name="selectPageNo">
          <div class="panel-body">
             <table name="outerBorderTb" border="0" cellpadding="5" cellspacing="5" height="100%" width='100%' border="1">
            <tr>
               <td valign="top" width='65%'>
                  <div id="bestKwdCntChart"> </div>
               </td>
               <td width='5%'></td>
                  
               <td valign="top" width='25%'>
                  <table><tr><td height="50"></td></tr></table>
                  <table class="bestKeywdTable table table-bordered table-striped table-condensed" name="bestKeywdTable tab" cellpadding="5" cellspacing="5" width="80%" align="left">
                     
                     <tr><th width="10%" style="cursor:pointer; text-align:center; font-size:15pt;"><b>순위</b></th>
                     	 <th width="10%" style="cursor:pointer; text-align:center; font-size:15pt;"><b>키워드</b></th>
                     	 <th width="15%" style="cursor:pointer; text-align:center; font-size:15pt;"><b>검색 횟수</b></th>
                     </tr>
                        <c:forEach items='${bestKwdDTOList}' var="bestKwdDTOList" varStatus="loopTagStatus">
                           <tr onClick="viewKwdDailyCnt('${bestKwdDTOList.srch_kwd}');">
                              <td align="center" style="font-size:15pt;">${bestKwdDTOList.rank}</td>
                              <td align="center" style="font-size:15pt;">${bestKwdDTOList.srch_kwd}</td>
                              <td align="center" style="font-size:15pt;">${bestKwdDTOList.kwd_cnt}</td>            
                           </tr>            
                        </c:forEach>
                  </table>
               </td>
               <td width='5%'><td>
            </tr>      
         </table>
            <!-- <figure class="demo-xchart" id="chart"></figure> -->
          </div>
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
<%-- <script src="${ctRootlib}/morris/morris.min.js"></script> --%>
<!--common script for all pages-->
<script src="${ctRootlib}/common-scripts.js"></script>
<!--script for this page-->
<%-- <script src="${ctRootlib}/morris-conf.js"></script> --%>


</body>
</html>
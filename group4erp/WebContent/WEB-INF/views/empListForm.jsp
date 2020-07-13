<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <meta http-equiv="Conpatible" content="no-cache"/>
  <title>직원 리스트</title>

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

<script>
$(document).ready(function(){   
   
   //headerSort("empListTable", 0);

   startTime();
   
   $('[name=rowCntPerPageDown]').change(function(){
      $('[name=rowCntPerPage]').val( $(this).val() );
      goSearch();
   });
   
   $(".pagingNumber").html(
         getPagingNumber(
            "${getEmpBoardListCnt}"                  //검색 결과 총 행 개수
            ,"${hrListSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
            ,"${hrListSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
            ,"10"                              //페이지 당 보여줄 페이지번호 개수
            ,"goSearch();"                  //페이지 번호 클릭 후 실행할 자스코드
         )
      );
   
   inputData('[name=rowCntPerPageDown]',"${hrListSearchDTO.rowCntPerPage}");
   inputData('[name=selectPageNo]',"${hrListSearchDTO.selectPageNo}");
   inputData('[name=searchKeyword]',"${hrListSearchDTO.searchKeyword}");
   inputData('[name=sort]',"${hrListSearchDTO.sort}");
});

   function goSearch() {
	   
	   
      document.empListSearchForm.submit();
   }
   function goSearchAll() {
      document.empListSearchForm.reset();
      $("[name=empListSearchForm] [name=selectPageNo]").val(1);
      $("[name=empListSearchForm] [name=rowCntPerPage]").val(10);
      $("[name=empListSearchForm] [name=sort]").val('');
      document.empListSearchForm.submit();
   }
//    function insertNewEmp() {
//      location.href="/group4erp/viewNewEmpJoin.do"
//   } 
    function goAllReset(){
       inputData('[name=searchKeyword]',"");
       $('[name=searchKeyword]').focus();
     }
   function goEmpContentForm(emp_no){
      //alert("emp_no="+emp_no);
      //return;
      var str = "emp_no="+emp_no
      location.href="/group4erp/viewEmpContentForm.do?"+str;
      /*
      $.ajax({
         url : "/group4erp/empViewContantProc.do"
         , type : "post"
         , data : "emp_no="+emp_no
         , success : function(upDelCnt){
            alert(999);
            return;
            location.replace("/group4erp/???????.do");
         }
         , error : function(){
            alert("서버 접속 실패");
         }
      });
      */
      //location.replace("......");
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
            <a class="active" href="javascript:;">
              <i class="fa fa-users"></i>
              <span>인사 관리</span>
              </a>
            <ul class="sub">
              <li class="active">
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
      <section class="wrapper" style="text-align:left;">
        <h3><i class="fa fa-angle-right"></i> 직원 리스트</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
      <form name="empListSearchForm" method="post" action="/group4erp/viewEmpList.do">
         <!-- <div class="divcss"> -->
         <table class="searchTable" style="border: 0px;">
            <tr>
               <th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
               <td width="42%"> <input type="text" name="searchKeyword" size=40>
               <th>
               <td width="20%">
               <th>
               <td width="30%" >
                  <button  type="button" class="btn btn-default" onclick="goSearch();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" style="width:13; height:13;" ><font style="font-size:9pt;" >검색</font></button>
                  &nbsp;
                  <button type="button" class="btn btn-default" onclick="goSearchAll();"><input type="image" src="/group4erp/resources/image/searchA.png" style="width:13; height:13;"><font style="font-size:9pt;">모두검색</font></button>
                  &nbsp;
                  <button type="button" class="btn btn-default" onclick="goAllReset();"><input type="image" src="/group4erp/resources/image/reset.png" style="width:13; height:13;"><font style="font-size:9pt;">초기화</font></button>
         </table>

         <br>
         <!-- 
         <input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="20" height="20" value="검색" onclick="goSearchBookInven();">  
         <a href="javascript:goSearchBookInven();">검색</a>&nbsp;&nbsp;
         <input type="button" value="모두검색" onclick="goAllSearchBookInven();">&nbsp;&nbsp;
         <input type="button" value="초기화" onclick="goAllReset();">
          -->
         <!-- </div> -->
         
         <input type="hidden" name="selectPageNo">
         <input type="hidden" name="rowCntPerPage" value="${hrListSearchDTO.rowCntPerPage}"> <%-- value="${invenSearchDTO.rowCntPerPage}" --%>
         <!-- header sort를 하기 위한 hidden Tag -->
         <input type="hidden" name="sort">
         </form>
            </div>
          </div>
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
            <div class="adv-table">
            <table border=0 width=98%>
               <tr>
                  <td><h4><i class="fa fa-angle-right"></i> 검색 결과</h4>
                  <td align=right>[총 직원] : ${getEmpBoardListCnt} 권
                  <select name="rowCntPerPageDown">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="25">25</option>
                        <option value="30">30</option>
                  </select> 행보기
         </table>
         <table><tr><td height="10"></td></tr></table>
         <form name="empListForm" method="post" action="/group4erp/viewEmpInfo.do">
         <table class="table table-striped table-advance table-hover table-bordered" width="100%" border=0 cellspacing=0 cellpadding=5>   
         
         
         <thead>
            <tr>
            <c:choose>
               <c:when test="${param.sort=='emp_no desc'}">
                  <th width="15%" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼사번
               </c:when>
               <c:when test="${param.sort=='emp_no asc'}">
                  <th width="15%" style="cursor:pointer" onclick="$('[name=sort]').val('emp_no desc'); goSearch();">▲사번
               </c:when>
               <c:otherwise>
                  <th width="15%" style="cursor:pointer" onclick="$('[name=sort]').val('emp_no asc'); goSearch();">사번
               </c:otherwise>
            </c:choose>
            <c:choose>
               <c:when test="${param.sort=='emp_name desc'}">
                  <th width="30%" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼성명
               </c:when>
               <c:when test="${param.sort=='emp_name asc'}">
                  <th width="30%" style="cursor:pointer" onclick="$('[name=sort]').val('emp_name desc'); goSearch();">▲성명
               </c:when>
               <c:otherwise>
                  <th width="30%" style="cursor:pointer" onclick="$('[name=sort]').val('emp_name asc'); goSearch();">성명
               </c:otherwise>
            </c:choose>
            <c:choose>
               <c:when test="${param.sort=='3 desc'}">
                  <th width="20%" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼부서
               </c:when>
               <c:when test="${param.sort=='3 asc'}">
                  <th width="20%" style="cursor:pointer" onclick="$('[name=sort]').val('3 desc'); goSearch();">▲부서
               </c:when>
               <c:otherwise>
                  <th width="20%" style="cursor:pointer" onclick="$('[name=sort]').val('3 asc'); goSearch();">부서
               </c:otherwise>
            </c:choose>
            <c:choose>
               <c:when test="${param.sort=='jikup_cd desc'}">
                  <th width="20%" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼직급
               </c:when>
               <c:when test="${param.sort=='jikup_cd asc'}">
                  <th width="20%" style="cursor:pointer" onclick="$('[name=sort]').val('jikup_cd desc'); goSearch();">▲직급
               </c:when>
               <c:otherwise>
                  <th width="20%" style="cursor:pointer" onclick="$('[name=sort]').val('jikup_cd asc'); goSearch();">직급
               </c:otherwise>
            </c:choose>
            <c:choose>
               <c:when test="${param.sort=='5 desc'}">
                  <th width="10%" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼승인상태
               </c:when>
               <c:when test="${param.sort=='5 asc'}">
                  <th width="10%" style="cursor:pointer" onclick="$('[name=sort]').val('5 desc'); goSearch();">▲승인상태
               </c:when>
               <c:otherwise>
                  <th width="10%" style="cursor:pointer" onclick="$('[name=sort]').val('5 asc'); goSearch();">승인상태
               </c:otherwise>
            </c:choose>
         </thead>
         <tbody>
         <c:forEach items="${requestScope.getEmpBoardList}" var="empList" varStatus="loopTagStatus">
            <tr style="cursor:pointer" onClick="goEmpContentForm(${empList.emp_no});">   
               <td align=center>${empList.emp_no}</td>   <!-- <input type="hidden" value="${dep_no}">  -->
               <td align=center>${empList.emp_name}</td>
               <td align=center>${empList.dep_name}</td>
               <td align=center>${empList.jikup}</td>
               <c:if test="${empList.worktime_name=='미승인'}">
                  <td align=center>${empList.worktime_name}</td>
               </c:if>
               <c:if test="${empList.worktime_name!='미승인'}">
                  <td align=center></td>
               </c:if>
            </tr>      
         </c:forEach>
         </tbody>
      </table>
      <br>
      <!-- <input type="button" value="신규사원등록" onClick="insertNewEmp();"> -->
      <br><br>
      <div align=center>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
   </form>
         
         
         
         
         
         
         
         
            </div>
          </div>
          <!-- /col-md-12 -->
        </div>
        <br>
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
  <%-- 
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.js"></script>
  <script type="text/javascript" language="javascript" src="${ctRootlib}/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="${ctRootlib}/advanced-datatable/js/DT_bootstrap.js"></script> --%>
  <script src="${ctRootlib}/jquery/jquery.min.js?ver=1"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js?ver=1"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js?ver=1"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js?ver=1"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js?ver=1" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js?ver=1"></script>
  <!--script for this page-->
  
</body>

</html>








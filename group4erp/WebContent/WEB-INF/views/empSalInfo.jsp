<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="description" content="">
     <meta name="author" content="Dashboard">
     <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
     <meta http-equiv="Conpatible" content="no-cache"/>
     
   <title>급여지급내역(직원별)</title>
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
  

   <script type="text/javascript"></script>
   
   
<script>
	$(document).ready(function() {

		setTableTrBgColor(
				"empSalInfo",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
	

		$('[name=rowCntPerPageDown]').change(function(){
	         $('[name=rowCntPerPage]').val($(this).val());

			goSearch();
		});

		
		$(".pagingNumber").html(

				getPagingNumber(
					"${myPayCheckCnt}"						//검색 결과 총 행 개수
					,"${salListSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${salListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);

		//검색 후 입력양식에 넣었던 검색 조건들 세팅하기
		//$('[name=empSalForm] [name=rowCntPerPage]').val("${salListSearchDTO.rowCntPerPage}");
		//$('[name=empSalForm] [name=selectPageNo]').val("${salListSearchDTO.selectPageNo}");
		

		inputData('[name=rowCntPerPageDown]', "${salListSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${salListSearchDTO.selectPageNo}");
		inputData('[name=sort]',  "${salListSearchDTO.sort}");
		/* $('[name=rowCntPerPage]').val("${salListSearchDTO.rowCntPerPage}");
		$('[name=selectPageNo]').val("${salListSearchDTO.selectPageNo}");
		$('[name=sort]').val("${salListSearchDTO.sort}"); */

		//$('[name=rowCntPerPage]').val($('[name=empSalForm] [name=rowCntPerPage]').val());
		//$('[name=selectPageNo]').val($('[name=empSalForm] [name=selectPageNo]').val());
		
		//inputData("[name=sort]", "${salListSearchDTO.sort}");

	});
	
	
	function goSearch() {
		document.empSalForm.submit();
	}

	function goSearchAll() {
		document.empSalForm.reset();

		$('[name=selectPageNo]').val("1");
		$('[name=rowCntPerPage]').val("15");
		goSearch();
	}
		
	function goBack(){
		history.go(-1);
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
              <li>
                <a href="/group4erp/viewEmpList.do"><i class="fa fa-info-circle"></i>직원정보</a>
              </li>
                   <!-- 인사부장만 급여지급대장 조회 메뉴를 볼 수 있다. -->
                   <c:if test="${emp_id eq '600001'}">
                   		<li>
              				<a href="/group4erp/viewSalList.do"><i class="fa fa-file"></i>급여지급대장 조회</a>
              			</li>	
              			<li class="active">
              				<a href="/group4erp/viewEmpSalInfo.do"><i class="fa fa-file"></i>급여명세서 조회</a>
              			</li>	
                   </c:if>
                   
                   <c:if test="${emp_id != '600001'}">
                   		<li class="active">
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
       <table width=99%>
           <tr>
              <td width=25%> <h3><i class="fa fa-angle-right"></i> ${timeDTO.now_year}년도&nbsp;${timeDTO.now_month}월분 급여지급내역</h3> </td>
              <td width=50% align="center"><h3> 직책 : ${jikup}	&nbsp;&nbsp; 성명 :${emp_name} </h3> </td>
                <td align=right><h3><i class="fa fa-arrow-left" onclick="goBack();" style="cursor:pointer;"></i></h3> </td>
             </tr>
      </table>
        <div class="row">
          
      <form name="empSalForm" method="post" action="/group4erp/viewEmpSalInfo.do">
         <!-- <div class="divcss"> -->
 
         <!-- 
         <input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="20" height="20" value="검색" onclick="goSearchBookInven();">  
         <a href="javascript:goSearchBookInven();">검색</a>&nbsp;&nbsp;
         <input type="button" value="모두검색" onclick="goAllSearchBookInven();">&nbsp;&nbsp;
         <input type="button" value="초기화" onclick="goAllReset();">
          -->
         <!-- </div> -->
         
         <input type="hidden" name="selectPageNo">
         <input type="hidden" name="rowCntPerPage" value='${salListSearchDTO.rowCntPerPage}'>
         <!-- header sort를 하기 위한 hidden Tag -->
         <input type="hidden" name="sort">
         </form>
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
            <div class="adv-table">
            <table border=0 width=98%>
               <tr>
                  <td><h4><i class="fa fa-angle-right"></i> 지급일 : ${timeDTO.now_year}년 ${timeDTO.now_month}월 5일 </h4>
                  <td align=right>[단위] : 원 / [전체] : ${myPayCheckCnt}건&nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="rowCntPerPageDown">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="25">25</option>
                        <option value="30">30</option>
                  </select> 행보기
            </table>
            <table><tr><td height="10"></td></tr></table>
         </form>
         
         <table class="table table-striped table-advance table-hover table-bordered" name="salListTable" width="100%" border=0 cellspacing=0 cellpadding=5>   
         
         
         <thead>
         
         <tr align="center">
						<th rowspan="2">번호</th>
						
						<c:choose>
							<c:when test="${param.sort=='salary_dt desc'}">
								<th rowspan="2" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼지급일</th>
							</c:when>
							<c:when test="${param.sort=='salary_dt asc'}">
								<th rowspan="2" style="cursor:pointer" onclick="$('[name=sort]').val('salary_dt desc'); goSearch();">▲지급일</th>
							</c:when>
							<c:otherwise>
								<th rowspan="2" style="cursor:pointer" onclick="$('[name=sort]').val('salary_dt asc'); goSearch();">지급일</th>
							</c:otherwise>
						</c:choose>
						
						<th colspan="3">지급내역</th>
						
						<th colspan="5">공제내역</th>
						
						<c:choose>
							<c:when test="${param.sort=='real_sal desc'}">
								<th rowspan="2" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼실수령액</th>
							</c:when>
							<c:when test="${param.sort=='real_sal asc'}">
								<th rowspan="2" style="cursor:pointer" onclick="$('[name=sort]').val('real_sal desc'); goSearch();">▲실수령액</th>
							</c:when>
							<c:otherwise>
								<th rowspan="2" style="cursor:pointer" onclick="$('[name=sort]').val('real_sal asc'); goSearch();">실수령액</th>
							</c:otherwise>
						</c:choose>
						
					</tr>
					<tr align="center">
						<!-- 지급내역 목록 -->
						<c:choose>
							<c:when test="${param.sort=='month_sal desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼기본급</td>
							</c:when>
							<c:when test="${param.sort=='month_sal asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('month_sal desc'); goSearch();">▲기본급</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('month_sal asc'); goSearch();">기본급</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.sort=='mess_allowance desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼식대</td>
							</c:when>
							<c:when test="${param.sort=='mess_allowance asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('mess_allowance desc'); goSearch();">▲식대</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('mess_allowance asc'); goSearch();">식대</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.sort=='bus_trip_bonus desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼보너스</td>
							</c:when>
							<c:when test="${param.sort=='bus_trip_bonus asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('bus_trip_bonus desc'); goSearch();">▲보너스</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('bus_trip_bonus asc'); goSearch();">보너스</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.sort=='sum_payable desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼합계</td>
							</c:when>
							<c:when test="${param.sort=='sum_payable asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('sum_payable desc'); goSearch();">▲합계</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('sum_payable asc'); goSearch();">합계</td>
							</c:otherwise>
						</c:choose>
						<!-- 공제내역 목록-->
						<c:choose>
							<c:when test="${param.sort=='emp_insurance desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼고용보험</td>
							</c:when>
							<c:when test="${param.sort=='emp_insurance asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('emp_insurance desc'); goSearch();">▲고용보험</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('emp_insurance asc'); goSearch();">고용보험</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.sort=='health desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼건강보험</td>
							</c:when>
							<c:when test="${param.sort=='health asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('health desc'); goSearch();">▲건강보험</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('health asc'); goSearch();">건강보험</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.sort=='pension desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼국민연금</td>
							</c:when>
							<c:when test="${param.sort=='pension asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('pension desc'); goSearch();">▲국민연금</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('pension asc'); goSearch();">국민연금</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.sort=='deduct desc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼합계</td>
							</c:when>
							<c:when test="${param.sort=='deduct asc'}">
								<td style="cursor:pointer" onclick="$('[name=sort]').val('deduct desc'); goSearch();">▲합계</td>
							</c:when>
							<c:otherwise>
								<td style="cursor:pointer" onclick="$('[name=sort]').val('deduct asc'); goSearch();">합계</td>
							</c:otherwise>
						</c:choose>
					</tr>
      </thead>
         <tbody>
         <c:forEach items='${myPayCheckList}' var="myPayCheckList" varStatus="loopTagStatus">
						<tr align="center">	
							<td>${myPayCheckCnt - myPayCheckList.RNUM +1}</td>
							<td>${myPayCheckList.salary_dt}</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.month_sal}" />원</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.mess_allowance}" />원</td>
							<td>
								<c:if test="${myPayCheckList.bus_trip_bonus eq null}">
									0원
								</c:if>
					
								<c:if test="${!(myPayCheckList.bus_trip_bonus eq null)}">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.bus_trip_bonus}" />원
								</c:if>
							</td>

							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.sum_payable}" />원</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.emp_insurance}" />원</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.health}" />원</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.pension}" />원</td> 
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.deduct}" />원</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${myPayCheckList.real_sal}" />원</td>

						</tr>
		
					 </c:forEach>
         </tbody>
      </table>
      <!-- &nbsp;&nbsp;<h6>단위 [원]</h6> -->
      <br>
      <!-- <input type="button" value="신규사원등록" onClick="insertNewEmp();"> -->
      <br><br>
      <div align=center>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
         
         <br>
         
         
         
         
         
         
            </div>
          </div>
          <!-- /col-md-12 -->
        </div>
        <br>


        
        <!-- /row -->
      </section>
    </section>
    
       <br>
       <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!-- 
          <input type="button" value="급여 지급" onClick="goPayCheck();">
      <input type="button" value="차트보기" onClick="goChart();">
             -->
      
      
      <form name="salListForm" method="post" action="/group4erp/viewEmpSalInfo.do">
         <input type="hidden" name="emp_no" value=''>
      </form>
    
    
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
   <script src = "https://www.google.com/jsapi"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
</body>

</html>




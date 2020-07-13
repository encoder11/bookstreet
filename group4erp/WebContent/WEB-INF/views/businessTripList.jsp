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
  
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<% String emp_no = (String)session.getAttribute("emp_id"); 
   //System.out.println("emp_nm==="+emp_nm);
   
   request.setAttribute("emp_no", emp_no);

%>

<!-- =======
>>>>>>> refs/remotes/b_ldh/b_ldh
=======
>>>>>>> refs/remotes/b_kth/b_kth -->
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

		startTime();
		
		$("#datepicker3").datepicker({
			dateFormat: 'yy-mm-dd'
		});
		$("#datepicker4").datepicker({
			dateFormat: 'yy-mm-dd'
		});
		
		$('[name=rowCntPerPageDown]').change(function(){
			   $('[name=rowCntPerPage]').val( $(this).val() );
			   goSearch();
		});
		
		
		/* alert($("[name=getBusinessTripListSearchForm] [name=selectPageNo]").val());
		alert($("[name=getBusinessTripListSearchForm] [name=rowCntPerPage]").val()); */
		//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
		$(".pagingNumber").html(
				getPagingNumber(
				"${businessTripListAllCnt}"						//검색 결과 총 행 개수
				,"${businessTripSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
				,"${businessTripSearchDTO.rowCntPerPage}"			//페이지 당 출력행의 개수
				,"15"										//페이지 당 보여줄 페이지번호 개수
				,"goSearch();"								//페이지 번호 클릭 후 실행할 자스코드
			)
		);

		inputData('[name=rowCntPerPageDown]',"${businessTripSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${businessTripSearchDTO.selectPageNo}");
		inputData('#selectSearch',"${businessTripSearchDTO.searchKey}");
		inputData('#searchKeyword',"${businessTripSearchDTO.keyword}");
		inputData('#sort',"${businessTripSearchDTO.sort}");
		inputData('#datepicker3',"${businessTripSearchDTO.startTime}");
		inputData('#datepicker4',"${businessTripSearchDTO.endTime}");
		<c:forEach items="${businessTripSearchDTO.payment}" var="payment">
			inputData('[name=payment]',"${payment}");
		</c:forEach> 
		
});

	
	
	function goSearch(){
		//var keyword = '';
		var  keyword = $("#searchKeyword").val();
		var  searchKey = $("#selectSearch").val();
		var  outsideTime = $("#datepicker3").val();
		var  comebackTime = $("#datepicker4").val();

		
		$("#searchKey").val(searchKey);
		$("#keyword").val(keyword);
		$("#startTime").val(outsideTime);
		$("#endTime").val(comebackTime);

		//alert( $('[name=getBusinessTripListSearchForm]').serialize() );
		
		document.getBusinessTripListSearchForm.submit();
	}
	
	function goAllSearch(){
		document.getBusinessTripListSearchForm.reset();
		//$("#searchForm").submit()
		$('[name=getBusinessTripListSearchForm] [name=rowCntPerPage]').val('10');
		$('[name=getBusinessTripListSearchForm] [name=selectPageNo]').val('1');
		goSearch();
	}
	
	function goReset(){
		document.getBusinessTripListSearchForm.reset();
	}
	
																					
	function goBusinessTripContentsForm(work_outside_seq,emp_no,travel_payment,dep_no,mgr_no,jikup){
			if( 
				(
					("${businessTripDTO.login_emp_id}"== emp_no)
						||
					(
						("${businessTripDTO.login_mgr_no}"==mgr_no)
							&&
						("${businessTripDTO.login_dep_no}"==dep_no)
					)
						||
					("${businessTripDTO.login_dep_no}"==6)
						||
					("${businessTripDTO.login_jikup}"=="대표이사")
				) 
				&& 
				(travel_payment =="W")){
				  alert($('[name=getBusinessTripListSearchForm]').serialize());
				var str = "work_outside_seq="+work_outside_seq+"&"+emp_no+"&"+$('[name=getBusinessTripListSearchForm]').serialize();
				location.href="/group4erp/businessTripUpDelForm.do?"+str;
			}else{
				var str = "work_outside_seq="+work_outside_seq+"&"+emp_no+"&"+$('[name=getBusinessTripListSearchForm]').serialize();
				location.href="/group4erp/businessTripContentsForm.do?"+str;}
	}

	function goBusinessTripForm() {
		location.href = "/group4erp/businessTripForm.do";
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
      <section class="wrapper" style="text-align:left;">
        <table width=99%>
	      <tr>
	      <td>
	        <h3><i class="fa fa-angle-right"></i> 출장 신청</h3>
	       <td align=right>
	       <button type="button" class="btn btn-theme04" onclick="goBusinessTripForm();"><i class="fa fa-briefcase"></i> 출장 신청</button>
      </table>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
		<form name="getBusinessTripListSearchForm" id="getBusinessTripListSearchForm" method="post" action="/group4erp/businessTripList.do">
			<!-- <div class="divcss"> -->
			<table class="searchTable" style="border: 0px;">
				<tr>
					<th width="14%" style="text-align:right;"><b>* 결재 상태&nbsp;</b></th>
					
					<td width="30%" align=left>
					<input type="checkbox" name='payment' class="payment" value="Y">승인
         			<input type="checkbox" name='payment' class="payment" value="W">대기중
         			<input type="checkbox" name='payment' class="payment" value="N">반려 </td>
         			<th width="10%" style="text-align:right;"><b>* 출장 날짜&nbsp;</b></th>
					<td align=left>
						<input type="text" id="datepicker3" readonly>&nbsp;~&nbsp;
						<input type="text" id="datepicker4" readonly>
					</td>
			</table>
			<br>
			<table class="searchTable" style="border: 0px;">
				<tr>
					<th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
					<td width="50%">
						<select id = "selectSearch">
							<option value="">------</option>
							<option value="emp_name">성명</option>
							<option value="dep_name">부서</option>
							<option value="mgr_name">담당자</option>
						</select>
						<input type="text" name="book_keyword" id="searchKeyword" size=78>
					<th>
					<td>
					<th>
					<td  width="20%">
						<button type="button" class="btn btn-default" onclick="goSearch();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="15" height="15">검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goAllSearch();"><input type="image" src="/group4erp/resources/image/searchA.png" width="15" height="15">모두검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="15" height="15">초기화</button>
			</table>

			<br>
			<!-- 
			<input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="20" height="20" value="검색" onclick="goSearchBookInven();">  
			<a href="javascript:goSearchBookInven();">검색</a>&nbsp;&nbsp;
			<input type="button" value="모두검색" onclick="goAllSearchBookInven();">&nbsp;&nbsp;
			<input type="button" value="초기화" onclick="goAllReset();">
 			-->
			<!-- </div> -->
			<input type="hidden" name="searchKey" id="searchKey" >
			<input type="hidden" name="keyword" id="keyword">
			<input type="hidden" name="startTime" id="startTime">
      		<input type="hidden" name="endTime" id="endTime">
			<input type="hidden" name="selectPageNo">
			<input type="hidden" name="rowCntPerPage" value="${businessTripSearchDTO.rowCntPerPage}">
			<!-- header sort를 하기 위한 hidden Tag -->
			<input type="hidden" name="sort" id="sort">
			</form>
            </div>
          </div>
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
            <div class="adv-table">
            <table border=0 width=98%>
					<tr>
						<td><h4><i class="fa fa-angle-right"></i>검색 결과</h4>
						<td align=right>[총 신청 수] : ${businessTripListAllCnt} 건
						<select name="rowCntPerPageDown">
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
						</select> 행보기
			</table>
			<table><tr><td height="10"></td></tr></table>
             <table class="table table-striped table-advance table-hover table-bordered" width="90%" border=0 cellspacing=0 cellpadding=5>
             <thead>
				<tr>
					<th>번호</th>
					
			
					<c:choose>
						<c:when test="${param.sort=='4 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('outside_start_time desc'); goSearch();">▼성명</th>
						</c:when>
						<c:when test="${param.sort=='4 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('4 desc'); goSearch();">▲성명</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('4 asc'); goSearch();">성명</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='3 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('outside_start_time desc'); goSearch();">▼직급</th>
						</c:when>
						<c:when test="${param.sort=='3 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('3 desc'); goSearch();">▲직급</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('3 asc'); goSearch();">직급</th>
						</c:otherwise>
					</c:choose>
					
					

					<c:choose>
						<c:when test="${param.sort=='6 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('outside_start_time desc'); goSearch();">▼부서명</th>
						</c:when>
						<c:when test="${param.sort=='6 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('6 desc'); goSearch();">▲부서명</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('6 asc'); goSearch();">부서명</th>
						</c:otherwise>
					</c:choose>

					
	
					<c:choose>
						<c:when test="${param.sort=='10 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('outside_start_time desc'); goSearch();">▼출발 날짜</th>
						</c:when>
						<c:when test="${param.sort=='10 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('10 desc'); goSearch();">▲출발 날짜</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('10 asc'); goSearch();">출발 날짜</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='11 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('outside_start_time desc'); goSearch();">▼복귀 예정 날짜</th>
						</c:when>
						<c:when test="${param.sort=='11 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('11 desc'); goSearch()">▲복귀 예정 날짜</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('11 asc'); goSearch();">복귀 예정 날짜</th>
						</c:otherwise>
					</c:choose>

					
					<c:choose>
						<c:when test="${param.sort=='12 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('outside_start_time desc'); goSearch();">▼담당자</th>
						</c:when>
						<c:when test="${param.sort=='12 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('12 desc'); goSearch()">▲담당자</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('12 asc'); goSearch();">담당자</th>
						</c:otherwise>
					</c:choose>
					
					
					<c:choose>
						<c:when test="${param.sort=='15 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('outside_start_time desc'); goSearch();">▼결재</th>
						</c:when>
						<c:when test="${param.sort=='15 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('15 desc'); goSearch()">▲결재</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('15 asc'); goSearch();">결재</th>
						</c:otherwise>
					</c:choose>
				</tr>
					</thead>
					<tbody>
					<c:forEach items="${businessTripList}" var="businessList" varStatus="loopTagStatus">

						<!-- 자기 이외에는 못보게 막음(추후 진행방향 결정) -->
						<c:if test="${businessList.emp_no eq emp_no}">
							<tr class="tab" style="cursor:pointer" onClick="goBusinessTripContentsForm(${businessList.work_outside_seq}
																									,${businessList.emp_no}
																									,'${businessList.travel_payment}'
																									,${businessList.dep_no}
																									,${businessList.mgr_no}
																									,'${businessList.jikup}');">
						</c:if>
						<c:if test="${businessList.emp_no != emp_no }">
							<tr class="tab" style="cursor:pointer">
						</c:if>

						<%-- 
						<tr class="tab" style="cursor:pointer" onClick="goBusinessTripContentsForm(${businessList.work_outside_seq}
																									,${businessList.emp_no}
																									,'${businessList.travel_payment}'
																									,${businessList.dep_no}
																									,${businessList.mgr_no}
																									,'${businessList.jikup}');">--%>

								<td align=center>${businessTripListAllCnt - businessList.RNUM + 1}</td>	
								<td align=center>
									${businessList.emp_name}
								</td>
								<td align=center>${businessList.jikup}</td>
								<td align=center>${businessList.dep_name}</td>
								<td align=center>${businessList.outside_start_time}</td>
								<td align=center>${businessList.outside_end_time}</td>
								<td align=center>
									<c:choose>
										<c:when test="${businessList.mgr_name ne ' '}">
											${businessList.mgr_name}
										</c:when>
										<c:otherwise>
												-
										</c:otherwise>				
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${businessList.travel_payment eq 'Y'}">
											승인
										</c:when>
										<c:when test="${businessList.travel_payment eq 'N'}">
											반려
										</c:when>
										<c:otherwise>
											대기중
										</c:otherwise>				
									</c:choose>
								</td>
						</tr>		
						</c:forEach>
					</tbody>
			</table>
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
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</body>

</html>

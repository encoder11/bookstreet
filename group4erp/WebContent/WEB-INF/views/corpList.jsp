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

<style>

.searchTable{
	border-collapse: 1px collapse !important;
}

.searchTable td{
	height: 40px;
    padding-left: 7;
}

.searchTable th {
	height: 40px;
    padding-right: 7;
    
}

.searchTable-bordered td,
.searchTable-bordered th {
    border: 1px solid #ddd !important;
}

.tableth th{
	text-align: right;
	font-weight: bold;

}

</style>

<script>

	$(document).ready(function(){

		//$(".updateArea").hide();

		startTime();
		

		$('[name=rowCntPerPageDown]').change(function(){
		   $('[name=rowCntPerPage]').val( $(this).val() );
			goSearch();
		});
	
		$(".pagingNumber").html(
				getPagingNumber(
					"${corpListCnt}"						//검색 결과 총 행 개수
					,"${corpSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${corpSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);

	
		inputData('[name=rowCntPerPageDown]',"${corpSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${corpSearchDTO.selectPageNo}");
		inputData('[name=searchKeyword]',"${corpSearchDTO.searchKeyword}");
		inputData('[name=sort]',"${corpSearchDTO.sort}");

		<c:forEach items="${corpSearchDTO.corp_business_area}" var="corp_business_area">
			inputData("[name=corpSearchForm] [name=corp_business_area]", "${corp_business_area}");		
		</c:forEach>

		<%--<c:forEach items="${corpSearchDTO.corp_business_area}" var="corp_business_area">
			$('[name=corp_business_area]').filter("[value='${corp_business_area}']").prop("checked", true);
		</c:forEach>--%>

	});
	function goSearch() {

		
		var keyword = $("[name=searchKeyword]").text();
		$("#searchKeyword").val(keyword);

		document.corpSearchForm.submit();
	}
	

	function goSearchAll() {
		document.corpSearchForm.reset();

		$('[name=corpSearchForm] [name=selectPageNo]').val("1");
		$('[name=corpSearchForm] [name=rowCntPerPage]').val("10");
		$("[name=corpSearchForm] [name=sort]").val('');

		goSearch();
	}
	
	function goReset() {
		document.corpSearchForm.reset();
	}
	
	function insertCorp() {
		//alert("거래처 추가");
		location.href="/group4erp/goInsertCorpPage.do"
	}

	var closeFlag = "close";
	
	
	function updateCorpInfo(idx, flag, corp_no, corp_name, ceo_name, business_area, corp_addr, corp_tel, corp_fax) {

		var thisTr = $(idx).parent();
		var delTr = $(".corpListTable [name=updateCorpInfo]");
		
		if(delTr.size() > 0) {
			delTr.remove();
		}

		var htmlCode = "<tr name='updateCorpInfo' align='center'>" 
		htmlCode +=	"<td colspan=10>"
		htmlCode += "<table width=99%> <tr> <td width=30%> <td width=40% align=center>"
   		htmlCode += "⏷<br>[거래처 수정]<br>"
    	htmlCode += "<td width=30% align=right>"
    	htmlCode += "<h3 align=right><i class='fa fa-times' onClick='closeThisTr();' style='cursor:pointer;'></i>&nbsp;&nbsp;</h3> </table>"
		htmlCode += 	"<form name='updateCorpForm' method='post' action='/group4erp/updateCorpInfoProc.do'>"

		htmlCode += 		"<table class='searchTable tableth' align='center'>"
		htmlCode += 			"<tr> <th>사업자번호</th> <td><input type='text' class='form-control round-form' size='30' name='new_corp_no' value="+corp_no+"> </td> </tr>"
		htmlCode += 			"<tr> <th>상호명 </th> <td><input type='text' class='form-control round-form' size='30' name='corp_name' value='"+corp_name+"'> </td> </tr>"
		htmlCode += 			"<tr> <th>사업자명</th> <td><input type='text' class='form-control round-form' size='30' name='ceo_name' value='"+ceo_name+"'></td> </tr>"
		htmlCode += 			"<tr> <th>사업분야</th> <td> <input type='checkbox' name='corp_business_area' value='1'>IT" 
		htmlCode +=				"							<input type='checkbox' name='corp_business_area' value='2'>통신"
		htmlCode +=				"							<input type='checkbox' name='corp_business_area' value'3'>금융"
		htmlCode +=				"							<input type='checkbox' name='corp_business_area' value='4'>출판&미디어"
		htmlCode +=				"							<input type='checkbox' name='corp_business_area' value='5'>교육&학원"
		htmlCode +=				"							<input type='checkbox' name='corp_business_area' value='6'>운송&물류"
		htmlCode +=				"							<input type='checkbox' name='corp_business_area' value='7'>학교"
		htmlCode +=				"							<input type='checkbox' name='corp_business_area' value='8'>기타</td> </tr>"
		htmlCode += 			"<tr> <th>소재지</th> <td><input type='text' class='form-control round-form' size='30' name='corp_addr' value='"+corp_addr+"'></td> </tr>"
		htmlCode += 			"<tr> <th>연락처</th> <td><input type='text' class='form-control round-form' size='30' name='corp_tel' value='"+corp_tel+"'></td> </tr>"
		htmlCode += 			"<tr> <th>FAX</th> <td><input type='text' class='form-control round-form' size='30' name='corp_fax' value='"+corp_fax+"'></td> </tr>"
		htmlCode += 		"</table><br>"

		htmlCode +=			"<button type='button' class='btn btn-theme02' onClick='updateCorpInfoProc("+corp_no+");'><i class='fa fa-check'></i> 수정</button> &nbsp;"

		htmlCode +=         "<input type='hidden' name='corp_no' value="+corp_no+">"
		htmlCode +=  	"</form>"
		htmlCode += "</td>"
		htmlCode += "</tr>"
		
		thisTr.after(htmlCode);
		
		$(".corpListTable [name=updateCorpInfo]").hide();
		$(".corpListTable [name=updateCorpInfo]").show(1000);
	}

	function closeThisTr(idx) {
				
		var delTr = $(".corpListTable [name=updateCorpInfo]");
		delTr.hide(1000, function(){
			delTr.remove();
		});
		
	}

	
	function updateCorpInfoProc(corp_no) {

		$.ajax({
			url : "/group4erp/updateCorpInfoProc.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $('[name=updateCorpForm]').serialize(),		//서버로 보낼 파라미터명과 파라미터값을 설정			
			success : function(upCnt) {
				if(upCnt==1) {
					//alert("업체 정보가 수정되었습니다.");
					location.replace("/group4erp/viewCorpList.do");
					
				} else if(upCnt==-1) {	
					alert("업체가 이미 삭제되었습니다!");
					
					//location.replace("/group4erp/viewCorpList.do");

				} else {
					alert("서버쪽 DB 연동 실패!");
				}
			}

			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				alert("서버 접속 실패!");
			}	
		});
		
	}

	function deleteCorp() {
		//alert("거래처 삭제 기능 구현 예정")
		//체크된 checkbox의 value 값을 Array 객체에 저장하기
		var corp_no = [];
		var cnt=0;

		$("[name=delCheckBox]").each(function() {
		
			var thisObj = $(this);

			if(thisObj.is(":checked")) {
				//alert(thisObj.val());
				corp_no.push(thisObj.val());
			}
		});
					//Array 객체안의 배열변수가 0개면, 즉 체크된 학점이 없으면 함수 중단
		if(corp_no.length==0) {
			alert("선택된 업체가 없습니다.");

			return;
		}

		$("[name=corp_no]").val(corp_no);

		$.ajax({
			url : "/group4erp/deleteCorpProc.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $('[name=deleteCorpForm]').serialize(),		//서버로 보낼 파라미터명과 파라미터값을 설정
			
			success : function(delCnt) {
				if(delCnt>=1) {
					//alert("삭제 성공!");
					
					location.replace("/group4erp/viewCorpList.do");
				} else if(delCnt==-1) {	
					alert("업체가 이미 삭제되었습니다!");
					
					//location.replace("/group4erp/viewCorpList.do");

				} else {
					alert("서버쪽 DB 연동 실패!");
				}
			}

			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				alert("서버 접속 실패!");
			}	
		});		
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
            <a class="active" href="javascript:;">
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
              <li class="active">
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
        <h3><i class="fa fa-angle-right"></i> 거래처 현황 조회</h3>
       <td align=right>
       <button type="button" class="btn btn-theme04" onclick="insertCorp();"><i class="fa fa-link"></i> 거래처 등록</button>
      </table>
      <table><tr><td height=10></td></tr></table>  
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
		<form name="corpSearchForm" method="post" action="/group4erp/viewCorpList.do">
			<!-- <div class="divcss"> -->
			<table class="searchTable" style="border: 0px;">
				<tr>
					<th width="8%" style="text-align:right;"><b>* 분야&nbsp;</b></th>
					
					<td colspan=2 width="50%" align=left>
					<c:forEach items="${requestScope.corp_business_area}" var="corp_business_area" varStatus="loopTagStatus">
						&nbsp;&nbsp;<input type="checkbox" name="corp_business_area" value="${corp_business_area.bus_area_code}" >${corp_business_area.bus_area_name}
         			</c:forEach> </td>
				<tr>
					<th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
					<td width="42%"> <input type="text" name="searchKeyword" size=78>
					<th>
					<td>
					<th>
					<td  width="20%">
						<button type="button" class="btn btn-default" onclick="goSearch();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="15" height="15">검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goSearchAll();"><input type="image" src="/group4erp/resources/image/searchA.png" width="15" height="15">모두검색</button>
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
			
			<input type="hidden" name="selectPageNo">
			<input type="hidden" name="rowCntPerPage" value="${corpSearchDTO.rowCntPerPage}">
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
						<td><h4><i class="fa fa-angle-right"></i>검색 결과</h4>
						<td align=right>
						[전체] : ${corpListCnt}개
						<select name="rowCntPerPageDown">
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
						</select> 행보기
			</table>
			<table><tr><td height="10"></td></tr></table>

             <table class="corpListTable table table-striped table-advance table-hover table-bordered" width="90%" border=0 cellspacing=0 cellpadding=5>
             <thead>
				<tr>
					<th></th>
					<th>번호</th>
					<c:choose>
						<c:when test="${param.sort=='corp_no desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch();  "> ▲ 사업자번호</th>
						</c:when>
						<c:when test="${param.sort=='corp_no asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_no desc'); goSearch(); "> ▼ 사업자번호</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_no asc'); goSearch();  ">사업자번호</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='corp_name desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch(); "> ▲ 거래처명</th>
						</c:when>
						<c:when test="${param.sort=='corp_name asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_name desc'); goSearch(); "> ▼ 거래처명</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_name asc'); goSearch(); ">거래처명</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='ceo_name desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch(); "> ▲ 사업자명</th>
						</c:when>
						<c:when test="${param.sort=='ceo_name asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('ceo_name desc'); goSearch(); "> ▼ 사업자명</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('ceo_name asc'); goSearch(); ">사업자명</th>
						</c:otherwise>
					
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='corp_business_area desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch(); "> ▲ 사업분야</th>
						</c:when>
						<c:when test="${param.sort=='corp_business_area asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_business_area desc'); goSearch(); "> ▼ 사업분야</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_business_area asc'); goSearch(); ">사업분야</th>
						</c:otherwise>
					
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='corp_addr desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch(); "> ▲ 소재지</th>
						</c:when>
						<c:when test="${param.sort=='corp_addr asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_addr desc'); goSearch(); "> ▼ 소재지</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_addr asc'); goSearch(); ">소재지</th>
						</c:otherwise>
					
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='corp_tel desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch(); "> ▲ 연락처</th>
						</c:when>
						<c:when test="${param.sort=='corp_tel asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_tel desc'); goSearch(); "> ▼ 연락처</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_tel asc'); goSearch(); ">연락처</th>
						</c:otherwise>
					
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='corp_fax desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val(''); goSearch(); "> ▲ FAX</th>
						</c:when>
						<c:when test="${param.sort=='corp_fax asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_fax desc'); goSearch(); "> ▼ FAX</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_fax asc'); goSearch(); ">FAX</th>
						</c:otherwise>
					
					</c:choose>
					</thead>
					<tbody>
					<c:forEach items='${corpList}' var="corpList" varStatus="loopTagStatus">
						<tr style="cursor:pointer" onClick="viewCorpInfo(${empSal.emp_no});">
							<td align=center class="delCheckBox"><input type="checkbox" name="delCheckBox" value="${corpList.corp_no}"></td>
							<td align=center onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpListCnt-corpList.RNUM+1}</td>
							<td align=center onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpList.corp_no}</td>
							<td align=center onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpList.corp_name}</td>
							<td align=center onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpList.ceo_name}</td>
							<td align=center onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpList.corp_business_name}</td> 
							<td onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpList.corp_addr}</td> 
							<td align=center onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpList.corp_tel} </td> 
							<td align=center onClick="updateCorpInfo(this, 'update', '${corpList.corp_no}', '${corpList.corp_name}', '${corpList.ceo_name}', '${corpList.corp_business_area}', '${corpList.corp_addr}', '${corpList.corp_tel}', '${corpList.corp_fax}');">${corpList.corp_fax} </td>  
						</tr>
						
					</c:forEach>
					</tbody>
			</table>
			&nbsp;<button type='button' align=left class='btn btn-theme04' onClick='deleteCorp();'><i class='fa fa-eraser'></i> 선택 삭제</button>
			<div align=center>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
			<br>
            </div>
          </div>
          <!-- /col-md-12 -->
        </div>
        <br>
        <form name="deleteCorpForm" method="post" action="/group4erp/deleteCorpProc.do">
			<input type="hidden" name="corp_no">
		</form>
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
  
</body>

</html>

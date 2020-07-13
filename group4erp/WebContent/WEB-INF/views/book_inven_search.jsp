<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<!--
  	BootStrap의 수입 코드는 차트 등  특별한 경우를 제외하고 똑같다.
  	따로 수입하는 JSP파일을 생성하고 처리 할 수 있도록 만든다.
  	
  	해당 작업을 하기 기존 CSS가 겹치는지 확인
  		-> 먼저 테이블들의 id or name or class 값을 통일 및 CSS값 통일 작업
  	
  	Header 와 sideBar 분리는 필수
  		-> 1.레이아웃을 먼저 나눈후 해당 자리에 JSP파일을 로드하는 방식
  		-> 2.main에 넣어 두고 본문 자리에 각 메뉴에 해당하는 JSP를 로드하는 방식
  		-> 3. 다른 방법이 있을것이다.
  		
  	현재 inputdata함수의 활용, RowCntPerPage의 체인지 이벤트, 페이징 처리 함수 등 모든 페이지에 필수적으로 쓰이는 함수나 JQuery등이 너무 많음
  		-> 해당 작업은 common.js에 공용함수화 할것.
  			-> submit / reset / location 등등 난발하는것을 축소
  	
  	게시판 형태로 데이터를 나열하는 c:ForEach문을 함수화 할수 있을까
  		-> 이것이 가능하다면 모든 페이지에서 활용도가 높음
  	==> 위의 게시판이 함수화가 된다면 해당 게시판의 Header도 함수화가 가능할 것.
  		-> 현재 너무 길게늘어져있어서 보기 안좋으며 같은 함수를 계속 호출함
  	
   -->
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
	
		startTime();
	
	   $('[name=rowCntPerPageDown]').change(function(){
		   $('[name=rowCntPerPage]').val( $(this).val() );
	      goSearchBookInven();
	   });
	   
	   $(".pagingNumber").html(
	         getPagingNumber(
	            "${bookListCnt}"                  //검색 결과 총 행 개수
	            ,"${invenSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
	            ,"${invenSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
	            ,"10"                              //페이지 당 보여줄 페이지번호 개수
	            ,"goSearchBookInven();"                  //페이지 번호 클릭 후 실행할 자스코드
	         )
	      );

	   inputData('[name=rowCntPerPageDown]',"${invenSearchDTO.rowCntPerPage}");
	   inputData('[name=selectPageNo]',"${invenSearchDTO.selectPageNo}");
	   inputData('[name=searchPublisher]',"${invenSearchDTO.searchPublisher}");
	   inputData('[name=is_print]',"${invenSearchDTO.is_print}");
	   inputData('[name=book_keyword]',"${invenSearchDTO.book_keyword}");
	   inputData('[name=sort]',"${invenSearchDTO.sort}");
	   	<c:forEach items="${invenSearchDTO.category_name}" var="cat">
			inputData( "[name=category_name]", "${cat}" );
		</c:forEach>
		<c:forEach items="${invenSearchDTO.size_cd}" var="size_cd">
			inputData( "[name=size_cd]", "${size_cd}" );
		</c:forEach>
		<c:forEach items="${invenSearchDTO.inventory_loc}" var="loc">
			inputData( "[name=inventory_loc]", "${loc}" );
		</c:forEach>


		$("[name=is_print]").change(function(){
			if ( $(this).is(":checked") ){
				$(this).siblings().prop("checked", false);
			}
			$(this).siblings().prop("checked", false);
		});

		
	 
	});

	   function goSearchBookInven(){
	      //alert("검색기능 구현중");

	      //alert(  $("[name=book_inventory_search_form]").serialize()   );
	  
	      //alert(  $("[name=book_inventory_search_form]").serialize()   );

	      document.book_inventory_search_form.submit();
	   }


	   function goAllSearchBookInven(){
	      //alert("모두검색기능 구현중");
	      //document.book_inventory_search_form.reset();
	      //goSearchBookInven();

			document.book_inventory_search_form.reset();
			$("[name=book_inventory_search_form] [name=selectPageNo]").val(1);
			$("[name=book_inventory_search_form] [name=rowCntPerPage]").val(10);
			$("[name=book_inventory_search_form] [name=sort]").val('');
			goSearchBookInven();
	   }
	   
	   function goNewBookInfo(){
		   //alert("책등록 구현중");
		   //return;
		   location.href="/group4erp/viewSignUpBook.do";
	   }
	   
	   function goBookContentForm(isbn13_search){
		   //alert("상세보기 구현중"+str);
		   //return;
		   var str = "isbn13_search="+isbn13_search;
		   location.href="/group4erp/viewBookContentForm.do?"+str;
	   }
	   
	   function goAllReset(){
		   document.book_inventory_search_form.reset();
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
            <a class="active" href="javascript:;">
              <i class="fa fa-shopping-cart"></i>
              <span>재고 관리</span>
              </a>
            <ul class="sub">
              <li class="active">
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
      <table width=99%> <tr> <td>

        <h3><i class="fa fa-angle-right"></i> 재고 관리</h3>
       <td align=right>
       <button type="button" class="btn btn-theme04" onclick="goNewBookInfo();"><i class="fa fa-book"></i> 서적 등록</button>
      </table>
      <table><tr><td height=10></td></tr></table>  
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <h4><i class="fa fa-angle-right"></i> 검색</h4>
              <hr>
		<form name="book_inventory_search_form" method="post" action="/group4erp/goBookList.do">
			<!-- <div class="divcss"> -->
			<table class="searchTable" style="border: 0px;">
				<tr>
					<th width="8%" style="text-align:right;"><b>* 분야&nbsp;</b></th>

					<td colspan=2 width="50%" align=left>
					<c:forEach items="${requestScope.category}" var="cat" varStatus="loopTagStatus">
							&nbsp;<input type="checkbox" name="category_name" value="${cat.cat_name}">${cat.cat_name}
         			</c:forEach> </td>
         			<th width="8%" style="text-align:right;"><b>* 판매 상황&nbsp;</b>
					<td align=left>
						<input type="checkbox" name="is_print" value="n">절판
						<input type="checkbox" name="is_print" value="y">판매중
				<tr>
					<th width="8%" style="text-align:right;"><b>* 판형&nbsp;</b>
					<td colspan=2 width="42%" align=left>
					<c:forEach items="${requestScope.size}" var="size" varStatus="loopTagStatus">
							&nbsp;<input type="checkbox" name="size_cd" value="${loopTagStatus.index+1}">${size.size_name}
         			</c:forEach>
         			<th width="8%" style="text-align:right;"><b>* 출판사&nbsp;</b>
					<td align=left>
						<select name="searchPublisher">
							<option value="">--------</option>
							<c:forEach items="${requestScope.publisher}" var="publisher" varStatus="loopTagStatus">
								<option value="${publisher.publisher}">${publisher.publisher}</option>
							</c:forEach>
				<tr>
					<th width="8%" style="text-align:right;"><b>* 지역&nbsp;</b>
					<td width="42%" align=left>
					<c:forEach items="${requestScope.inventory_loc}" var="inven" varStatus="loopTagStatus">
							&nbsp;<input type="checkbox" name="inventory_loc" value="${loopTagStatus.index+1}">${inven.branch_name}
            		</c:forEach>
				<tr>
					<th width="8%" style="text-align:right;"><b>* 키워드&nbsp;</b>
					<td width="42%"> <input type="text" name="book_keyword" size=78>
					<th>
					<td>
					<th>
					<td  width="20%">
						<button type="button" class="btn btn-default" onclick="goSearchBookInven();"><input type="image" src="/group4erp/resources/image/magnifying-glass.png" width="15" height="15">검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goAllSearchBookInven();"><input type="image" src="/group4erp/resources/image/searchA.png" width="15" height="15">모두검색</button>
						&nbsp;
						<button type="button" class="btn btn-default" onclick="goAllReset();"><input type="image" src="/group4erp/resources/image/reset.png" width="15" height="15">초기화</button>
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
			<input type="hidden" name="rowCntPerPage" value="${invenSearchDTO.rowCntPerPage}">
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
						[등록 서적] : ${bookListCnt} 권
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
					<th width="6%">번호
					 <c:choose>
							<c:when test="${param.sort=='isbn13 desc'}">
								<th width="14%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼책번호
							</c:when>
							<c:when test="${param.sort=='isbn13 asc'}">
								<th width="14%" style="cursor: pointer"
									onclick="$('[name=sort]').val('isbn13 desc'); goSearchBookInven();">▲책번호
								
							</c:when>
							<c:otherwise>
								<th width="14%" style="cursor: pointer"
									onclick="$('[name=sort]').val('isbn13 asc'); goSearchBookInven();">책번호
							</c:otherwise>
					</c:choose> 
						
					<c:choose>
							<c:when test="${param.sort=='book_name desc'}">
								<th width="30%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼책이름
								
							</c:when>
							<c:when test="${param.sort=='book_name asc'}">
								<th width="30%" style="cursor: pointer"
									onclick="$('[name=sort]').val('book_name desc'); goSearchBookInven();">▲책이름
								
							</c:when>
							<c:otherwise>
								<th width="30%" style="cursor: pointer"
									onclick="$('[name=sort]').val('book_name asc'); goSearchBookInven();">책이름
								
							</c:otherwise>
					</c:choose> 
					
					<c:choose>
							<c:when test="${param.sort=='3 desc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼카테고리
							</c:when>
							<c:when test="${param.sort=='3 asc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('3 desc'); goSearchBookInven();">▲카테고리
							</c:when>
							<c:otherwise>
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('3 asc'); goSearchBookInven();">카테고리
							</c:otherwise>
					</c:choose>
					
					<c:choose>
							<c:when test="${param.sort=='publisher desc'}">
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼출판사
								
							</c:when>
							<c:when test="${param.sort=='publisher asc'}">
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('publisher desc'); goSearchBookInven();">▲출판사
								
							</c:when>
							<c:otherwise>
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('publisher asc'); goSearchBookInven();">출판사
								
							</c:otherwise>
					</c:choose>
					
					<c:choose>
							<c:when test="${param.sort=='is_print desc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼절판여부
								
							</c:when>
							<c:when test="${param.sort=='is_print asc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('is_print desc'); goSearchBookInven();">▲절판여부
								
							</c:when>
							<c:otherwise>
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('is_print asc'); goSearchBookInven();">절판여부
								
							</c:otherwise>
					</c:choose> 
						
					<c:choose>
							<c:when test="${param.sort=='to_number(book_price) desc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼가격
								
							</c:when>
							<c:when test="${param.sort=='to_number(book_price) asc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('to_number(book_price) desc'); goSearchBookInven();">▲가격
								
							</c:when>
							<c:otherwise>
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('to_number(book_price) asc'); goSearchBookInven();">가격
								
							</c:otherwise>
					</c:choose> 
					
					<c:choose>
							<c:when
								test="${param.sort=='(select s.isbn_cnt from stock_info s where s.isbn13=b.isbn13) desc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼수량
							</c:when>
							<c:when
								test="${param.sort=='(select s.isbn_cnt from stock_info s where s.isbn13=b.isbn13) asc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('(select s.isbn_cnt from stock_info s where s.isbn13=b.isbn13) desc'); goSearchBookInven();">▲수량
							</c:when>
							<c:otherwise>
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('(select s.isbn_cnt from stock_info s where s.isbn13=b.isbn13) asc'); goSearchBookInven();">수량
							</c:otherwise>
					</c:choose>
					
					<c:choose>
							<c:when test="${param.sort=='12 desc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val(''); goSearchBookInven();">▼재고위치
							</c:when>
							<c:when test="${param.sort=='12 asc'}">
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('12 desc'); goSearchBookInven();">▲재고위치
							</c:when>
							<c:otherwise>
								<th style="cursor: pointer"
									onclick="$('[name=sort]').val('12 asc'); goSearchBookInven();">재고위치
							</c:otherwise>
					</c:choose>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.BookList}" var="book" varStatus="loopTagStatus">
							<tr style="cursor: pointer" onClick="goBookContentForm(${book.ISBN13});">
								<td align=center>${bookListCnt-(invenSearchDTO.selectPageNo*invenSearchDTO.rowCntPerPage-invenSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}
								<td align=center>${book.ISBN13}
								<td align=left>${book.book_name}
								<td align=center>${book.cat_name}
								<td align=center>${book.publisher}
								<td align=center>${book.is_print=='y'?'판매중':'절판'}
								<td align=center>${book.book_price}
								<td align=center>${book.book_cnt}
								<td align=center>${book.branch_name}
					</c:forEach> <!-- <tr><td colspan=8 align=center> DB 연동 실패(아직 구현중)  -->
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
  
</body>

</html>

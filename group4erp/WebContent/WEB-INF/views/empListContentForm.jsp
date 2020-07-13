<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP페이지 처리 방식 선언하기 -->

<!-- 현재 이 JSP페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다 라고 설정함 / 현재 이 JSP페이지는 UTF-8방식으로 인코딩 한다 -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할수 있는 방법이다. -->
<!DOCTYPE html>
<!-- JSP기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<!-- 유일하게 WEB-INF 루트 경로를 쓸수 있다. -->
<%@ include file="/WEB-INF/views/common.jsp"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
   content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>직원상세보기</title>

<!-- Favicons -->
<link href="${ctRootImg}/favicon.png" rel="icon">
<link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link href="${ctRootlib}/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<!--external css-->
<link href="${ctRootlib}/font-awesome/css/font-awesome.css"
   rel="stylesheet" />
<link rel="stylesheet" type="text/css"
   href="${ctRootlib}/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
   href="${ctRootlib}/bootstrap-daterangepicker/daterangepicker.css" />
<!-- Custom styles for this template -->
<link href="${ctRootcss}/style.css" rel="stylesheet">
<link href="${ctRootcss}/style-responsive.css" rel="stylesheet">

<style>
boby{
   font-weight:bold;
}
.line {
   border-collapse: collapse;
   padding: 5px;
   border-top: 0px;
   border-bottom: 5px solid #ddd;
   border-left: 0px;
   border-right: 0px;
   font-size: 11pt;
   font-family: 'Noto Sans KR', sans-serif;
}

.fileBox .fileName {
   display: inline-block;
   width: 13%;
   height: 3%;
   padding-left: 10px;
   margin-right: 5px;
   line-height: 30px;
   border: 1px solid #aaa;
   background-color: #fff;
   vertical-align: middle;
   border-radius: 3px;
}

.fileBox .btn_file {
   display: inline-block;
   border: 1px solid white;
   width: 40px;
   /* height: 20px; */
   font-size: 0.8em;
   line-height: 15px;
   text-align: center;
   vertical-align: middle;
   background-color: white;
   /* color: white; */
   border-radius: 3px;
}

.fileBox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
}
input[type=text]{
   border-radius: 3px;
   box-shadow: none;
   border: 1px solid #ddd;
   -webkit-appearance: none;-moz-appearance: none;appearance: none;

}
input::placeholder {
  color:#ddd;
  font-size:10pt;
}
</style>

<script>
   var hire_default = "${employeeInfoDTO.hire_dt}"
   $(document).ready(
         function() {

           startTime();
            
            inputData("[name=dep_name]", "${employeeInfoUpDTO.dep_name}");
            inputData("[name=jikup]", "${employeeInfoUpDTO.jikup}");
            //inputData("[name=worktime_name]", "");
            //      inputData("[name=mgr_emp_dep_name]", "${employeeInfoUpDTO.mgr_emp_dep_name}");
            //      inputData("[name=mgr_emp_jikup]", "${employeeInfoUpDTO.mgr_emp_jikup}");

            $("#hire_dt").datepicker({
               dateFormat : 'yy-mm-dd',
               defaultDate : hire_default,
               onSelect : function() {
                  var dateObject = $(this).datepicker('getDate');
               },
               beforeShowDay : $.datepicker.noWeekends
            });

            $("#resign_date").datepicker({
               dateFormat : 'yy-mm-dd',
               defaultDate : 'today',
               onSelect : function() {
                  var dateObject = $(this).datepicker('getDate');
               },
               beforeShowDay : $.datepicker.noWeekends
            });

            var uploadFile = $('.fileBox .uploadBtn');
            uploadFile.on('change', function() {
               if (window.FileReader) {
                  var filename = $(this)[0].files[0].name;
               } else {
                  var filename = $(this).val().split('/').pop().split(
                        '\\').pop();
               }
               $(this).siblings('.fileName').val(filename);
            });

         });

   function goBack() {
      history.go(-1);
   }

   /*파일 업로드 테스트 스크립트
   function uploadFile(){
       var form = $('[name=empContentUp]')[0];
       var formData = new FormData(form);
       formData.append("profilePic", $("#profilePic")[0].files[0]);
       formData.append("emp_no", $("#emp_no").val());

       console.log(formData);
       $.ajax({
           url: '/group4erp/empInfoUpProc.do',
                   processData: false,
                   contentType: false,
                   data: formData,
                   type: 'POST',
                   success: function(result){
                       alert("업로드 성공!!");
                   }
           });
   } */

   function empInfoUp() {
      var form = $('[name=empContentUp]')[0];
      var formData = new FormData(form);
      formData.append("uploadBtn", $("#uploadBtn")[0].files[0]);
      //formData.append("emp_no", $("#emp_no").val());
      //console.log(formData);

      if (is_empty('[name=emp_name]')) {
         alert("이름을 입력해주세요.");
         $("[name=emp_name]").focus();
         return;
      }
      if (is_empty('[name=emp_eng_name]')) {
         alert("영문이름을 입력해주세요.");
         $("[name=emp_eng_name]").focus();
         return;
      }
      if (is_empty('[name=emp_gender]')) {
         alert("성별을 선택해주세요.");
         $("[name=emp_gender]").focus();
         return;
      }
      if (is_empty('[name=jumin_num]')) {
         alert("주민번호를 입력해주세요.");
         $("[name=jumin_num_f]").focus();
         return;
      }
      if (is_empty('[name=phone]')) {
         alert("휴대전화번호를 입력해주세요.");
         $("[name=phone]").focus();
         return;
      }
      /* if( is_empty('[name=emp_email_office]') ){
             alert("회사 이메일을 입력해주세요.");
             $("[name=emp_email_office]").focus();
             return;
      } */
      if (is_empty('[name=emp_email]')) {
         alert("이메일을 입력해주세요.");
         $("[name=emp_email]").focus();
         return;
      }
      if (is_empty('[name=emp_addr]')) {
         alert("주소를 입력해주세요.");
         $("[name=emp_addr]").focus();
         return;
      }

      if (is_empty('[name=dep_name]')) {
         alert("부서를 선택해주세요.");
         $("[name=dep_name]").focus();
         return;
      }
      if (is_empty('[name=worktime_name]')) {
         alert("근무 형태를 선택해주세요.");
         $("[name=worktime_name]").focus();
         return;
      }
      if (is_empty('[name=jikup]')) {
         alert("직급을 선택해주세요.");
         $("[name=jikup]").focus();
         return;
      }
      var salary = $("[name=salary]").val();
      if (is_empty('[name=salary]') || salary == 0) {
         alert("연봉을 입력해주세요.");
         $("[name=salary]").focus();
         return;
      }

      /* if( is_empty('[name=mgr_emp_name]') ){
         alert("직속상관 이름을 입력해주세요.");
         $("[name=conmgr_emp_nametent]").focus();
         return;
      } */

      var juminb = $('[name=jumin_num]').val();
      var gender = 0;
      $("[name=emp_gender]").each(function() {
         var thisGender = $(this);
         if (thisGender.is(":checked")) {
            gender = thisGender;
         }
      });
      if (juminb.substr(6, 1) == '1' || juminb.substr(6, 1) == '3') {
         if (gender.val() == '여') {
            alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
            return;
         }
      } else if (juminb.substr(6, 1) == '2' || juminb.substr(6, 1) == '4') {
         if (gender.val() == '남') {
            alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
            return;
         }
      } else if (juminb.substr(6, 1) == '5' || juminb.substr(6, 1) == '6'
            || juminb.substr(6, 1) == '7' || juminb.substr(6, 1) == '8'
            || juminb.substr(6, 1) == '9') {
         alert("일치하지 않는 주민등록번호 입니다.");
         return;
      }

      var phone = $('[name=phone]').val();

      if (phone.indexOf('-') > 0) {
         phone = phone.split('-').join('');
      }

      if (is_valid_pattern("[name=phone]", /^[0-9]{10,11}$/) == false) {
         alert("전화번호 형식이 틀렸습니다. 다시 입력해주세요");
         return;
      }
      if (is_valid_email("[name=emp_email]") == false) {
         alert("이메일 형식을 벗어납니다.");
         return;
      }

      if (confirm("정말 저장하시겠습니까?") == false) {
         return;
      }

      //alert(formData.serialize());
      //return;
      var emp_no = $("[name=emp_no]").val();

      //alert(formData);
      //return;
      $.ajax({
         url : '/group4erp/empInfoUpProc.do',
         processData : false,
         contentType : false,
         data : formData,
         type : 'POST',
         success : function(result) {
            $("img").remove();
            if(emp_no.length < 6){
               //alert("승인이 완료되었습니다.");
                  location.href = "/group4erp/viewEmpList.do"
            }else{
               //alert("수정이 완료되었습니다.");
                  location.href = "/group4erp/viewEmpContentForm.do?emp_no="+ emp_no;
            }
               
         }
      });

      /* alert( $("[name=empContentUp]").serialize() );

      $.ajax({
         url : "/group4erp/empInfoUpProc.do"
         , type : "post"
         , data : $("[name=empContentUp]").serialize()
         , success : function(data){
            alert("수정성공");
         }
         , error : function(){
            alert("서버 접속 실패");
         }
      });
       */
   }

   function empInfoDel(emp_no) {
      alert("삭제 기능 구현중");
      /*
      $.ajax({
         url : "/group4erp/empInfoDelProc.do"
         , type : "post"
         , data : "emp_no="+emp_no
         , success : function(DelCnt){
            alert(999);
            return;
            location.replace("/group4erp/???????.do");
         }
         , error : function(){
            alert("서버 접속 실패");
         }
      });
       */
   }
</script>
</head>
<body>
   <center>
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
                  <li class="mt"><a href="index.html"> <i
                        class="fa fa-dashboard"></i> <span>메인페이지</span>
                  </a></li>
                  <li class="sub-menu"><a href="javascript:;"> <i
                        class="fa fa-desktop"></i> <span>업무 관리</span>
                  </a>
                     <ul class="sub">
                        <li><a href="/group4erp/goMyCareBookList.do"><i
                              class="fa fa-book"></i>담당 도서 조회</a></li>
                        <li><a href="/group4erp/businessTripList.do"><i
                              class="fa fa-briefcase"></i>출장 신청</a></li>
                        <!-- 
              <li>
                <a href="/group4erp/goMyWorkTime.do"><i class="fa fa-list"></i>근태 조회</a>
              </li>
              <li>
               -->
                        <li><a href="/group4erp/viewApprovalList.do"><i
                              class="fa fa-pencil"></i>문서 결재</a></li>
                        <li><a href="/group4erp/goEmpDayOffjoin.do"><i
                              class="fa fa-edit"></i>휴가 신청</a></li>
                     </ul></li>
                  <li class="sub-menu"><a href="javascript:;">
                        <i class="fa fa-shopping-cart"></i> <span>재고 관리</span>
                  </a>
                     <ul class="sub">
                        <li><a href="/group4erp/goBookList.do"><i
                              class="fa fa-info-circle"></i>도서정보조회</a></li>
                        <li><a href="/group4erp/goReleaseList.do"><i
                              class="fa fa-list"></i>출고현황조회</a></li>
                        <li><a href="/group4erp/goWarehousingList.do"><i
                              class="fa fa-list"></i>입고현황조회</a></li>
                        <li><a href="/group4erp/goReturnOrderList.do"><i
                              class="fa fa-list"></i>반품현황조회</a></li>
                     </ul></li>
                  <li class="sub-menu"><a href="javascript:;"> <i
                        class="fa fa-calendar"></i> <span>마케팅 관리</span>
                  </a>
                     <ul class="sub">
                        <li><a href="/group4erp/viewSalesInfoList.do"><i
                              class="fa fa-money"></i>판매현황</a></li>
                        <li><a href="/group4erp/viewEventList.do"><i
                              class="fa fa-gift"></i>이벤트행사 현황</a></li>
                     </ul></li>
                  <li class="sub-menu"><a class="active" href="javascript:;"> <i
                        class="fa fa-users"></i> <span>인사 관리</span>
                  </a>
                     <ul class="sub">
                        <li class="active"><a href="/group4erp/viewEmpList.do"><i
                              class="fa fa-info-circle"></i>직원정보</a></li>
                        <li><a href="/group4erp/viewSalList.do"><i
                              class="fa fa-file"></i>급여명세서 조회</a></li>
                        <!-- 
              <li>
                <a href="/group4erp/viewEmpWorkStateList.do"><i class="fa fa-list"></i>직원별 근무현황</a>
              </li>
               -->

                        <li><a href="/group4erp/viewEmpDayOffList.do"><i
                              class="fa fa-list"></i>직원별 휴가 현황</a></li>
                     </ul></li>
                  <li class="sub-menu"><a href="javascript:;"> <i
                        class="fa fa-krw"></i> <span>회계 관리</span>
                  </a>
                     <ul class="sub">
                        <li class="active"><a
                           href="/group4erp/viewTranSpecIssueList.do"><i
                              class="fa fa-list"></i>거래명세서 조회</a></li>
                        <li><a href="/group4erp/viewTranSpecList.do"><i
                              class="fa fa-file-text"></i>사업자 거래내역 조회</a></li>
                        <li><a href="/group4erp/viewCorpList.do"><i
                              class="fa fa-link"></i>거래처 현황 조회</a></li>
                     </ul></li>
                  <li class="sub-menu"><a href="javascript:;"> <i
                        class=" fa fa-bar-chart-o"></i> <span>전략 분석</span>
                  </a>
                     <ul class="sub">
                        <li><a href="/group4erp/viewBestKeywdAnalysis.do"><i
                              class="fa fa-search"></i>키워드 검색 자료 조회</a></li>
                        <li><a href="/group4erp/viewOurCompanyReport.do"><i
                              class="fa fa-building-o"></i>회사현황</a></li>
                     </ul></li>
               </ul>
               <!-- sidebar menu end-->
            </div>
         </aside>
         <!--sidebar end-->
         <section id="main-content">
            <section class="wrapper" style="text-align: left;">
               <table border=0 cellpadding=0 cellspace=0 width="98%">
                  <tr>
                  <td widtj=50%>
                  <h3 align=left><i class="fa fa-angle-right"></i>직원 상세보기</h3>
                  <td widtj=50%>
                  <h3 align=right><i style="cursor:pointer" class="fa fa-arrow-left"  onclick="goBack();"></i></h3>
                 </table>
               
               <div class="col-lg-12 mt">
                     <div class="content-panel">
               
               
               <!-- <div class="row mt">
                  <div class="col-lg-12">
                     <div class="content-panel"> -->
                        <h4>
                           <i class="fa fa-angle-right"></i> 직원 상세정보
                        </h4>
                        <form name="empContentUp" class="form-horizontal style-form" method="post"
                           enctype="multipart/form-data">

                           <table class="empContentInfo tab" width="100%" border=1
                              bordercolor="#000000" cellpadding=5 align=center>
                              <tr>
                                 <td rowspan="5" colspan="2" width="20%">
                                    <c:choose>
                                       <c:when test="${empty employeeInfoUpDTO.emp_pic || employeeInfoUpDTO.emp_pic=='newWithoutPic'}">
                                          <img src="${ctRootImage}/default.jpg" width="80%" height="30%">
                                       </c:when>
                                       <c:otherwise>
                                          <img src="${ctRootImage}/${employeeInfoUpDTO.emp_pic}" width="80%" height="189">
                                       </c:otherwise>
                                    </c:choose>
                                    <%--<c:if test="${empty employeeInfoUpDTO.emp_pic || employeeInfoUpDTO.emp_pic=='newWithoutPic'}">
                                       <img src="${ctRootImage}/default.jpg" width="100%" height="30%">
                                    </c:if> 
                                    <c:if test="${!empty employeeInfoUpDTO.emp_pic && not employeeInfoUpDTO.emp_pic=='newWithoutPic'}">
                                       <img src="${ctRootImage}/${employeeInfoUpDTO.emp_pic}" width="100%" height="189">
                                    </c:if>  <img src="${ctRootImage}/emp_0003.jpg" width="100%" height="150"> --%>
                                    <!-- <img src="../image/emp_0002.jpg"> --></td>
                                 <td width="7%">∗ 성명</td>
                                 <td width="33%"><input type="text" size="27"
                                    name="emp_name" value="${employeeInfoUpDTO.emp_name}"></td>
                                 <td width="7%">∗ 영어명</td>
                                 <td width="33%"><input type="text" size="27"
                                    name="emp_eng_name"
                                    value="${employeeInfoUpDTO.emp_eng_name}"></td>
                              </tr>
                              <tr>
                                 <td >∗ 사번</td>
                                 <td><input type="text" size="27" name="emp_no"
                                    id="emp_no" value="${employeeInfoUpDTO.emp_no}"></td>
                                 <%-- <td><input type="text" style="background-color:#EBEBE4; box-shadow:none; border: 1px solid lightgray" size="27" name="emp_no" id="emp_no" value="${employeeInfoUpDTO.emp_no}"></td> --%>
                                 <td>∗ 비밀번호</td>
                                 <td><input type="text" size="27" name="emp_pwd"
                                    id="emp_pwd" value="${employeeInfoUpDTO.emp_pwd}"></td>


                              </tr>
                              <tr>
                                 <td >∗ 주민번호</td>
                                 <td><input type="text" size="27" name="jumin_num"
                                    value="${employeeInfoUpDTO.jumin_num}"></td>
                                 <td >∗ 성별</td>
                                 <td><c:if test="${employeeInfoUpDTO.emp_gender=='여'}">
                                       <input type="radio" name="emp_gender" value="여" checked>여
                                       <input type="radio" name="emp_gender" value="남">남
                                    </c:if> 
                                    <c:if test="${employeeInfoUpDTO.emp_gender=='남'}">
                                       <input type="radio" name="emp_gender" value="여">여
                                       <input type="radio" name="emp_gender" value="남" checked>남
                                    </c:if>
                                 </td>





                              </tr>
                              <tr>
                                 <td >∗ 전화번호</td>
                                 <td><input type="text" size="27" name="phone"
                                    value="${employeeInfoUpDTO.phone}"></td>

                                 <td >∗ 이메일</td>
                                 <td><input type="text" size="27" name="emp_email"
                                    size="27" value="${employeeInfoUpDTO.emp_email}"></td>
                              </tr>
                              <tr>
                                 <td >∗ 주소</td>
                                 <td colspan="3"><input type="text" name="emp_addr"
                                    size="76" value="${employeeInfoUpDTO.emp_addr}"></td>
                              <tr>
                                 <td colspan="7">
                                    <div class="fileBox" align="left">
                                       <!-- style="position:absolute;left:22%; -->
                                       <input align="left" type="text" class="fileName" placeholder="증명사진 업로드" readonly="readonly"> 
                                       <label style="cursor: pointer" for="uploadBtn" class="btn_file" align="left">
                                          <img src="/group4erp/resources/image/upload (1).png" align="center" width="75%" height="5%">
                                       </label> 
                                       <input type="file" id="uploadBtn" class="uploadBtn" name="uploadBtn">
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                                 <!-- <td colspan="6"><div align="left"><input type="file" name="profilePic" id="profilePic"></div> -->
                              </tr>
                           </table>
                        </div>
                  </div>


                           <br> <br>
                           
               
               <div class="col-lg-12 mt">
                     <div class="content-panel">
               
               
               <!-- <div class="row mt">
                  <div class="col-lg-12">
                     <div class="content-panel"> -->
                        <h4>
                           <i class="fa fa-angle-right">&nbsp;채용정보</i>
                        </h4>
                           
                           <table table class="empContentInfo tab" width="100%" border=1 bordercolor="#000000" cellpadding=5 align=center>
                              <tr>
                                 <td rowspan="5">
                                 </td>
                              </tr>
                              <tr>
                                 <td width="8%">∗ 부서</td>
                                 <td colspan="2" width='40%'><select name="dep_name">
                                       <c:if test="${empty employeeInfoUpDTO.dep_name}">
                                             <option value="">------------------선택-------------------</option>
                                       </c:if>
                                       <option value="총무부">총무부</option>
                                       <option value="기획부">기획부</option>
                                       <option value="영업부">영업부</option>
                                       <option value="마케팅부">마케팅부</option>
                                       <option value="사업부">사업부</option>
                                       <option value="인사부">인사부</option>
                                 </select></td>
                                 <td width="8%">∗ 채용형태</td>
                                 <td colspan="2" width='40%'>
                                    <select name="worktime_name">
                                       <c:if test="${employeeInfoUpDTO.worktime_name=='미승인'}">
                                          <option value="" selected>------------------선택-------------------</option>
                                       </c:if>
                                       <option value="정규직">정규직</option>
                                       <option value="파견직">파견직</option>
                                       <option value="기간제 근로자">기간제 근로자</option>
                                       <option value="파트타임">파트타임</option>
                                       <option value="인턴">인턴</option>
                                 </select></td>
                              </tr>
                              <tr>
                                 <td>∗ 직급</td>
                                 <td colspan="2"><select name="jikup">
                                       <c:if test="${empty employeeInfoUpDTO.jikup}">
                                             <option value="">------------------선택-------------------</option>
                                       </c:if>
                                       <option value="대표이사">대표이사</option>
                                       <option value="전무이사">전무이사</option>
                                       <option value="상무이사">상무이사</option>
                                       <option value="부장">부장</option>
                                       <option value="차장">차장</option>
                                       <option value="과장">과장</option>
                                       <option value="대리">대리</option>
                                       <option value="주임">주임</option>
                                       <option value="사원">사원</option>
                                       <option value="기타">기타</option>
                                 </select></td>
                                 <td>∗ 연봉</td>
                                 <td colspan="2"><input type="text" name="salary" size="27" value="${employeeInfoUpDTO.salary}"><font style="font-size:9pt; color:orange;"> *단위:만원</font></td>
                              </tr>
                              <tr>
                                 <td>∗ 입사일</td>
                                 <td colspan="2"><input type="text" name="hire_dt"
                                    id="hire_dt" size="27" value="${employeeInfoUpDTO.hire_dt}"></td>
                                 <td>∗ 퇴사일</td>
                                 <td colspan="2"><input type="text" name="resign_date"
                                    size="27" id="resign_date" value="${employeeInfoUpDTO.resign_date}"></td>
                              </tr>
                              <tr>
                                 <td>∗ 휴직상태</td>
                                 <td colspan="2">
                                 <c:if test="${employeeInfoUpDTO.is_on_leave=='F'}">
                                    <font style='color:blue'>재직중</font>
                                 </c:if> 
                                 <c:if test="${employeeInfoUpDTO.is_on_leave=='T'}">
                                    <font style='color:red'>휴직중</font>
                                 </c:if> <%-- <input type="text" name="is_on_leave" value="${employeeInfoDTO.is_on_leave}"></td> --%>
                                 <td>∗ 회사이메일</td>
                                 <td colspan="2"><c:if
                                       test="${employeeInfoUpDTO.salary!=0}">
                                       <input type="text" name="emp_email_office" size="27"
                                          value="${employeeInfoUpDTO.emp_email_office}">
                                    </c:if> <c:if test="${employeeInfoUpDTO.salary==0}">
                                       <input type="hidden"
                                          style='background-color: #EBEBE4; box-shadow: none; border: 1px solid lightgray; text-align: center;'
                                          name="emp_email_office" size="27"
                                          value="${employeeInfoUpDTO.emp_email_office}" readonly>
                                       <font size='2px' color='orange'> *승인 시 자동으로 부여</font>
                                    </c:if></td>




                              </tr>
                              <tr height="30"><td><td></tr>
                           </table>
                        </div>
                  </div>

                           <%-- <table class="line" width="850">
         <tr>
            <td>&nbsp;&nbsp;<b>결재자</b></td>
         </tr>
      </table>
      <table table class="empContentInfo tab2" width="850" border=1 bordercolor="#000000" cellpadding=5 align=center>
         <tr>
            <td bgcolor="#EEEEEE" width="10%">이름</td>
            <td width="23%"><input type="text" name="mgr_emp_name" value="${employeeInfoUpDTO.mgr_emp_name}"></td>
            <td bgcolor="#EEEEEE" width="13%">부서</td>
            <td width="20%">
               <input type="text" name="mgr_emp_dep_name" value="${employeeInfoUpDTO.mgr_emp_dep_name}">
               <select name="mgr_emp_dep_name">
                     <option value="총무부">총무부</option>
                     <option value="기획부">기획부</option>
                     <option value="영업부">영업부</option>
                     <option value="마케팅부">마케팅부</option>
                     <option value="사업부">사업부</option>
                     <option value="인사부">인사부</option>
               </select>
            </td>
            <td bgcolor="#EEEEEE" width="10%">직급</td>
            <td width="23%">
               <input type="text" name="mgr_emp_jikup" value="${employeeInfoUpDTO.mgr_emp_jikup}">
               <select name="mgr_emp_jikup">
                  <option value="대표이사">대표이사</option>
                  <option value="전무이사">전무이사</option>
                  <option value="상무이사">상무이사</option>
                  <option value="부장">부장</option>
                  <option value="차장">차장</option>
                  <option value="과장">과장</option>
                  <option value="대리">대리</option>
                  <option value="주임">주임</option>
                  <option value="사원">사원</option>
                  <option value="기타">기타</option>
               </select>
            </td>
         </tr>
      </table> --%>
                  </form>
         </section>
    </section>
<br>
                  <c:if test="${employeeInfoUpDTO.salary==0}">
                     <!-- <input type="button" value=" 승인 " onclick="empInfoUp();">&nbsp; -->
                     <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-theme02" onclick="empInfoUp();"><i class="fa fa-check"></i> 승인</button>
                     </center>
                     <br><br>
      </c:if>
                  <c:if test="${employeeInfoUpDTO.salary!=0}">
                     <!-- <input type="button" value=" 수정" onclick="empInfoUp();">&nbsp; -->
                     <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-theme02" onclick="empInfoUp();"><i class="fa fa-check"></i> 수정</button>
                     <br><br>
      </c:if>
                  <%-- <input type="button" value=" 삭제 " onclick="empInfoDel(${emp_no});">&nbsp; --%>
                  <!-- <input type="button" value="뒤로가기" onclick="goBack();"> -->
                  <form method="post" name="empUpDelForm"
                     action="/group4erp/empUpDelProc.do">
                     <input type="hidden" name="emp_no" value="${emp_no}">
                  </form>
                  

   </center>
   <!-- js placed at the end of the document so the pages load faster -->
   <script src="${ctRootlib}/jquery/jquery.min.js"></script>
   <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
   <script class="include" type="text/javascript"
      src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
   <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
   <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
   <!--common script for all pages-->
   <script src="${ctRootlib}/common-scripts.js"></script>
   <!--script for this page-->
   <script src="${ctRootlib}/jquery-ui-1.9.2.custom.min.js"></script>
   <!--custom switch-->
   <script src="${ctRootlib}/bootstrap-switch.js"></script>
   <!--custom tagsinput-->
   <script src="${ctRootlib}/jquery.tagsinput.js"></script>
   <!--custom checkbox & radio-->
   <%-- <script type="text/javascript"
      src="${ctRootlib}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript"
      src="${ctRootlib}/bootstrap-daterangepicker/date.js"></script>
   <script type="text/javascript"
      src="${ctRootlib}/bootstrap-daterangepicker/daterangepicker.js"></script>
   <script type="text/javascript"
      src="${ctRootlib}/bootstrap-inputmask/bootstrap-inputmask.min.js"></script> --%>
   <%-- <script src="${ctRootlib}/form-component.js"></script> --%>
</body>
</html>
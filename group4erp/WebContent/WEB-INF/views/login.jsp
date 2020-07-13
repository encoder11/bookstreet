<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
<style>
.checkID{
   /* background-color:#D4D4D4; */
   background-color:white;
   color:black;
   /*position:absolute;
    left:25%;
   top:10%;
   width:50%;
   height:90%;
   align:center; */
}
.aprroval{
   background-color:white;
   /* background-color:#D4D4D4; */
   color:black;
   position:absolute;
   left:525;
   top:290;
   width:30%;
   height:55%;
   align:center;
}
.noAprroval{
   /* background-color:#D4D4D4; */
   background-color:white;
   color:black;
   position:absolute;
   left:525;
   top:290;
   width:30%;
   height:55%;
   align:center;
}
body{
  /* background: #2f323a; */
  background: #444c57;
  color:white;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  /* background-image: radial-gradient(circle at 0% 0%, #373b52, #252736 51%, #1d1e26); */
}
.input { border-style: none; background: transparent; outline: none; }
button { padding: 0; background: none; border: none; outline: none; }
/* $input-background: rgba(57, 63, 84, 0.8); */
$input-background: rgba(0, 0, 0, 0.8);
$input-text-inactive: #FFFFFF;
$input-text-active: white;/* #BFD2FF; */ 

.webflow-style-input {
  position: relative;
  display: flex;
  flex-direction: row;
  width: 100%;
  max-width: 400px;
  margin: 0 auto;
  border-radius: 2px;
  padding: 1.4rem 2rem 1.6rem;
  background: $input-background;
  &:after {
    content: "";
    position: absolute;
    left: 0px;
    right: 0px;
    bottom: 0px;
    z-index: 999;
    height: 1.5px;
    border-bottom-left-radius: 2px;
    border-bottom-right-radius: 2px;
    background-position: 0% 0%;
    background: linear-gradient(to right, #B294FF, #57E6E6, #FEFFB8, #57E6E6, #B294FF, #57E6E6);
    background-size: 500% auto;
    animation: gradient 3s linear infinite;
  }
}

.webflow-style-input input {
  flex-grow: 1;
  color: $input-text-active;
  font-size: 12pt;
  line-height: 2rem;
  vertical-align: middle;
  &::-webkit-input-placeholder {
    color:white; /* $input-text-inactive; */
  }
}

input::placeholder {
  color: white;
}

/* .webflow-style-input button {
  color:  $input-text-inactive;
  font-size: 12pt;
  line-height: 2.4rem;
  vertical-align: middle;
  transition: color .25s;
  &:hover {
    color: $input-text-active;
  }
} */
.button {
    width:15%;
    height:35%;
    /* background-color: #F0C40F; */
    /* background-color: white; */
    background-color: #4ECDC4;
    border: 1px;
    /* color:#fff; */
    /* color: gray; */
    color: white;
    padding: 1px 0;
    text-align: center;
    vertical-align: text-top;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 5;
    line-height:2.5;
    cursor: pointer;
}

</style>
<title>YES4조 전사적자원관리 시스템 </title>
<script>
var x = 0;
var y = 0;

$(document).ready( function() {
   
   //$(".checkID").hide();
   //$(".aprroval").hide();
   //$(".noAprroval").hide();
   
   $(".newEmpDiv").hide();
   
   $("[name=newEmp]").click(function(){
      $(".newEmpDiv").show( 1000 );
      //$("[name=test]").css( {"border", 0);
      //$(".checkID").show( 1000 );
      
      //x = event.clientX+10;
      //y = event.clientY+10;
      
      //$(".checkID").css(
      //   {"top":y,"left":x}
      //);
   });

   
   
   $('[name=searchbtu]').click(function(){
      
      //$(".newEmpDiv").hide();
      $(".newEmpDiv").show();
      //alert("승인 여부 구현중");
      //return;
      //alert($('[name=checkIDProc1]').serialize());
      $.ajax({
         
         url : "/group4erp/checkApprovalProc.do"
         , type : "post"
         , data : $('[name=checkIDProc1]').serialize()
         , success : function(check){
            if(check.emp_no){
               var empNo = check.emp_no+'';
               var workCd = check.worktime_cd;
               if(workCd == 6){
                  //$(".noAprroval").show( 1000 );
                  //alert('미승인');
                  //$(".newEmpDiv").show();
                  //$("[name=jumin_num]").remove();
                  $("[name=jumin_num]").replaceWith("<i id='unconfirmed'><font style='color:blue;'>미승인 사원입니다.</font></i>");
                  //$(".newEmpDiv").show();
                  //$(".noAprroval").css( {"top":y,"left":x} );
               }
               else{
                  //alert("사번:"+check.emp_no+" 비밀번호:"+check.emp_pwd);
                  //$(".newEmpDiv").show();
                  //$("[name=jumin_num]").remove();
                  //console.log($(".newEmpDiv").is(":visible"));
                  $("[name=jumin_num]").replaceWith("<i id='confirmed' style='color:blue;'>사번:"+check.emp_no+" 비밀번호:"+check.emp_pwd+"</i>");
                  //$(".newEmpDiv").show();
                  //$('#approvalID td:eq(0)').text(check.emp_no);
                  //$('#approvalID td:eq(1)').text(check.emp_pwd);
                  
                  //$(".aprroval").show( 1000 );
                  //$(".aprroval").css( {"top":y,"left":x} );
               }
               
            }else{
               $("[name=jumin_num]").replaceWith("<i><font style='color:blue;'>등록되지 않은 사원입니다.</font></i>");
            }
            
         }
         , error : function(){
            alert("서버 접속 실패");
         }
      });
      
      
      
   });
   
});

   function checkLoginInfo() {
      $.ajax({
         
         url : "/group4erp/loginProc.do"
         , type : "post"
         , data : $('[name=login_form]').serialize()
         , success : function(loginCnt){
            
            if(loginCnt==1){
               //alert("회원 로그인 성공!");
               //location.replace("/group4erp/goMainPage.do");
               location.replace("/group4erp/goMainTest.do");
            }
            else{
               alert("회원 로그인 실패! 관리자에게 문의 바람.");
               $('[name=emp_id]').val("");
               $('[name=emp_pwd]').val("");
            }
         }
         , error : function(){
            alert("서버 접속 실패");
         }
      });
            
      
   }

   /*function joinMembership(){
      location.replace("/group4erp/joininsert.do");
   }
   
   function deleteMembership(){
      location.replace("/group4erp/godelete.do");
   }*/


   function goCEOLogin(str){
      
      $('[name=emp_pwd]').val(1111);
      
      if( str=='대표이사' ){
         $('[name=emp_id]').val(100001);
         checkLoginInfo();
      }
      if( str=='기획부장' ){
         $('[name=emp_id]').val(200003);
         checkLoginInfo();
      }
      if( str=='영업부장' ){
         $('[name=emp_id]').val(300004);
         checkLoginInfo();
      }
      if( str=='마케팅부장' ){
         $('[name=emp_id]').val(400005);
         checkLoginInfo();
      }
      if( str=='사업부장' ){
         $('[name=emp_id]').val(500003);
         checkLoginInfo();
      }
      if( str=='인사부장' ){
         $('[name=emp_id]').val(600001);
         checkLoginInfo();
      }
   }

   
   function insertNewEmp() {
      location.href="/group4erp/viewNewEmpJoin.do"
   }
   
   function goClose1(){
      
      //$("#input_area").empty();
      //$("#input_area").append("<input class='form-control' id='cname' name='jumin_num' minlength='13' maxlength='13' type='text' placeholder='&quot; - &quot; 를 제외하고 입력하시오' />");
      /* if($("i").is("#unconfirmed")){
         $("#unconfirmed").replaceWith("<input class='form-control' id='cname' name='jumin_num' minlength='13' maxlength='13' type='text' placeholder='&quot; - &quot; 를 제외하고 입력하시오' />");
      }else if($("i").is("#confirmed")){
         $("#confirmed").replaceWith("<input class='form-control' id='cname' name='jumin_num' minlength='13' maxlength='13' type='text' placeholder='&quot; - &quot; 를 제외하고 입력하시오' />");
      }else{
         $("[name=jumin_num]").replaceWith("<input class='form-control' id='cname' name='jumin_num' minlength='13' maxlength='13' type='text' placeholder='&quot; - &quot; 를 제외하고 입력하시오' />");
      }
          */
      //$("[name=jumin_num]").replaceWith("123");
      //console.log("주민번호 인풋", $("[name=jumin_num]"));
      $(".newEmpDiv").hide(1000);
      goReset();
   }
   function goReset(){
      $("#input_area").empty();
      $("#input_area").append("<input class='form-control' id='cname' name='jumin_num' minlength='13' maxlength='13' type='text' placeholder='&quot; - &quot; 를 제외하고 입력하시오' />");

   }
/*    function goClose2(){
      $(".aprroval").hide(1000);
   }
   function goClose3(){
      $(".noAprroval").hide(1000);
   } */

   //고객 주문 페이지
   function goClient(){
      location.href="/group4erp/goClientLogin.do";
   }
   
</script>

<!-- style="display:none" -->
</head>
<body>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a><img src="/group4erp/resources/image/paper.png" width="2.5%" height="5%" style="cursor:pointer;"><br>신입사원 승인 여부 확인하기</a></div> -->
<!--<a style="cursor:pointer;">[승인 여부]</a> <div align="left"><a><img src="/group4erp/resources/image/paper.png" width="3%" height="6%" style="cursor:pointer;"><br>[신입사원 승인 여부 확인하기]</a></div> -->
<div align="right" onclick="goClient();">
   <font style="font-size:11pt; font-weight:400;">고객주문페이지</font>
   <img src="/group4erp/resources/image/box (2).png" height="7%">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<center>
<form name="login_form" method="post" action="/group4erp/loginProc.do">
   <table width="90%">
      <tr>
         <td><br><br><br>
            <center><img src="/group4erp/resources/image/로고_가로ver.png" align="center" width="30%" height="65%"></center><!-- width="30%" -->
            <center><b style="font-size:15pt; color:#f3bbbb;">전사적 자원 관리 시스템</b></center>
         </td>

      <tr>
         <td>
            <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
            <br><br><br><br>
            <!-- <div align="center"><a><img src="/group4erp/resources/image/paper.png" width="3%" height="5%" style="cursor:pointer;"><br>신입사원 승인 여부 확인하기</a></div> -->
<!--             <div align="left"><a><img src="/group4erp/resources/image/paper.png" width="5%" height="7%" style="cursor:pointer;"><br><font style="color:pink;">신입사원 승인 여부 확인하기</font></a></div> -->
            <br><br>
            <table align="center" class="tab" width="30%" border="1" cellpadding=5 cellspacing=5> <!-- width="20%" -->
               <tr>
                  <td width="30%"><img src="/group4erp/resources/image/user.png" height="7%"><!-- <font style="font-size:15pt;">사원번호</font> --></td>
                  <td>
                     <div class="webflow-style-input">
                     <input type="text" name="emp_id" size="20%" class="input" placeholder="사원번호를 입력해주세요.">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td><img src="/group4erp/resources/image/password.png" height="7%"><!-- <font style="font-size:15pt;">비밀번호</font> --></td>
                  <td>
                     <div class="webflow-style-input">
                     <input type="password" name="emp_pwd" class="input" placeholder="비밀번호를 입력해주세요.">
                     </div>
                  </td>
               </tr>   
            </table>
            <br><br>
            <center>
            <input type="button" value="로그인" name="loginBtn" class="button" style=" vertical-align:top;" onClick="checkLoginInfo();">
            <input type="button" value="신규사원등록" class="button" style=" vertical-align:top;" onClick="insertNewEmp();">
            <br><input type="button" name="newEmp" value="신규사원 승인 여부 체크" class="button" style="width:31%; vertical-align:top;">
            <br><br>
            <!-- <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a><img src="/group4erp/resources/image/paper.png" width="2.5%" height="5%" style="cursor:pointer;"><br>신입사원 승인 여부 확인하기</a></div> -->
            </center>
         </td>
   </table>
</form>

<div class="newEmpDiv">
<table width="30%" name="test" class="tab3">
   <tr>
      <td width="30%" align="center">
         <div class="checkID" height="100%">
            <form name="checkIDProc1">  
            <center>
            <!-- <section id="main-content"> -->
               <section class="wrapper" style="margin-top:30px; text-align:center;height:100%">
                 <h4><i class="fa fa-check-square"></i>신규사원 승인여부</h4>
                 <!-- FORM VALIDATION -->
                 
                 <div class="row mt">
                   <!-- <div class="col-md-4"> -->
                   <div>
                     <h5>주민등록번호를 입력해주세요</h5>
                     <!-- <div class="form-panel"> -->
                       <div class=" form">
                         <form class="cmxform form-horizontal style-form" id="commentForm" method="get" action="">
                           <div class="form-group ">
                             <!-- <label for="cname" class="control-label col-lg-2">주민번호</label> -->
                             <div class="col-lg-12" id="input_area">
                               <input class=" form-control" id="cname" name="jumin_num" minlength="13" maxlength="13" type="text" placeholder="' - ' 를 제외하고 입력하시오" />
<!--                                <input class=" form-control" id="cname" name="jumin_num" minlength="13" maxlength="14" type="text" placeholder="' - ' 를 제외하고 입력하시오" required /> -->
                             </div>
                           </div>
                           <div class="form-group" style="text-align:center;">
                             <div class="col-lg-12" style="text-align:center;">
                                <table width="100%" border="1" class="tab3" style="border-collapse: collapse; border:1px solid ;black">
                                <tr>
                                <td align="center" width="100%">
                                <br>
                                  <button align="center" class="btn btn-theme" type="button" name="searchbtu">검색</button>
                                  <button align="center" class="btn btn-theme" type="button" name="reset" onclick="goReset();">초기화</button>
                                  <button align="center" class="btn btn-theme04" type="button" onclick="goClose1();">닫기</button>
                               <!-- <input type="button" value="검색" name="searchbtu" >&nbsp;
                          <input type="button" value="닫기" onclick="goClose1();"> -->
                             </td>
                             </tr>
                            </table>
                             </div>
                           </div>
                         </form>
                       </div>
                     <!-- </div> -->
                     <!-- /form-panel -->
                   </div>
                   <!-- /col-lg-12 -->
                 </div>
         
         
                 <!-- /row -->
               </section>
               <!-- /wrapper -->
         <!--     </section> -->
               </center>
            <!-- <table>
               <tr>
                  <th>주민등록번호<td><input type="text" name="jumin_num" size="20">
            </table> -->
            <!-- onclick="goCheckApproval();" -->
            <!-- <input type="button" value="검색" name="searchbtu" >&nbsp;
            <input type="button" value="닫기" onclick="goClose1();"> -->
            </form>
         </div>         
      </td>
   </tr>
</table>
</div>



<!-- <div class="aprroval" >
   <form name="checkIDProc2">
   <table id="approvalID">
      <tr>
         <th>사번 :<td>
      <tr>
         <th>비밀번호 :<td>
   </table>
   <input type="button" value="닫기" onclick="goClose2();">
   </form>
</div>
<div class="noAprroval" >
   <form name="checkIDProc3">
   <table id="noApprovalID">
      <tr>
         <th>승인되지 않은 주민등록번호 입니다!
   </table>
   <input type="button" value="닫기" onclick="goClose3();">
   </form>
</div> -->

<!-- <input type="button" name="joinBtn" value="사원등록" onClick="joinMembership();">&nbsp;
<input type="button" name="deleteBtn" value="사원삭제" onClick="deleteMembership();"> -->
<!-- <input type="button" name="checkIDbtu" value="승인여부"> -->
<br>
<br>

<input type="button" value="대표이사" name="easyLogin" style="color:black;" onclick="goCEOLogin('대표이사');">&nbsp;
<input type="button" value="기획부장" name="easyLogin" style="color:black;" onclick="goCEOLogin('기획부장');">&nbsp;
<input type="button" value="영업부장" name="easyLogin" style="color:black;" onclick="goCEOLogin('영업부장');">&nbsp;
<input type="button" value="마케팅부장" name="easyLogin" style="color:black;" onclick="goCEOLogin('마케팅부장');">&nbsp;
<input type="button" value="사업부장" name="easyLogin" style="color:black;" onclick="goCEOLogin('사업부장');">&nbsp;
<input type="button" value="인사부장" name="easyLogin" style="color:black;" onclick="goCEOLogin('인사부장');">&nbsp;




























  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${ctRootlib}/jquery/jquery.min.js"></script>
  <script src="${ctRootlib}/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${ctRootlib}/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${ctRootlib}/jquery.scrollTo.min.js"></script>
  <script src="${ctRootlib}/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${ctRootlib}/common-scripts.js"></script>
  <!--script for this page-->
  <%-- <script src="${ctRootlib}/form-validation-script.js"></script> --%>
</body>
</html>
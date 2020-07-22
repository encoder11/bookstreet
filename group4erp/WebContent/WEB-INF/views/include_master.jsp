<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- C태그를 활용하여 태그변수를 생성 / 길어지는 수입 코드를 간략화 할수 있다. -->
<c:set var="ctRoot" value="/group4erp" />
<c:set var="ctRootImage" value="${ctRoot}/resources/image"/>
<c:set var="ctRootImg" value="${ctRoot}/resources/img"/>
<c:set var="ctRootcss" value="${ctRoot}/resources/css"/>
<c:set var="ctRootlib" value="${ctRoot}/resources/lib"/>


<!-- css 파일 & jquery 라이브러리 파일 수입
		자체적으로 만든 CSS & 공용함수 파일 수입 -->
<link href="/group4erp/resources/test.css?ver=1" rel="stylesheet" type="text/css">
<link href="/group4erp/resources/component.css" rel="stylesheet" type="text/css">
<script src = "${ctRoot}/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src = "${ctRoot}/resources/common.js?ver=1"></script>
<link href="${ctRootImg}/favicon.png" rel="icon">
<link href="${ctRootImg}/apple-touch-icon.png" rel="apple-touch-icon">


<!-- 부트스트랩 수입 코드 -->


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

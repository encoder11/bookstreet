<!-- JSP 파일이 공통으로 수입해야 할 파일들을 절대경로를 사용해 수입한다.
	그리고 이 페이지를 해당 JSP 파일에서 include 한다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSP 페이지에서 사용할 사용자정의태그인 JSTL의 C 코어 태그 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!-- JSTL의 C 코어 태그를 사용하여 변수들을 선언하기 -->
<!-- ---------------------------------- -->

<!-- 변수 thColor1을 선언하고 문자열 "#eaeaea" 저장 -->
<c:set var="thColor1" value="#eaeaea"/>
<c:set var="thColor1" value="darkgray"/>

<!-- 변수 headerColor를 선언하고 문자열 "#cecece" 저장 -->
<c:set var="headerColor" value="#cecece"/>
<c:set var="headerColor" value="#323232"/>
<c:set var="headerColor" value="gray"/>
<!-- 변수 oddTrColor를 선언하고 문자열 "white" 저장 -->
<c:set var="oddTrColor" value="white"/>

<!-- 변수 evneTrColor를 선언하고 문자열 "#EBF0F4" 저장 -->
<c:set var="evenTrColor" value="#EBF0F4"/>

<!-- 변수 mouseOverColor를 선언하고 문자열 "#CCE1FF" 저장 -->
<c:set var="mouseOverColor" value="#CCE1FF"/>

<!-- 배경 컬러 설정 -->
<!-- 변수명이 같다면 마지막 라인이 최종 반영된다 -->
<c:set var="bodyBgColor1" value="lightblue" />
<c:set var="bodyBgColor1" value="#f6f6f6" />
<c:set var="bodyBgColor1" value="#D2E1FF" />
<c:set var="bodyBgColor1" value="#00FFFF" />
<c:set var="bodyBgColor1" value="#CCF4FF" />
<!-- ------------------------------ -->
<c:set var="ctRoot" value="/group4erp" />

<c:set var="ctRootImage" value="${ctRoot}/resources/image"/>
<c:set var="ctRootImg" value="${ctRoot}/resources/img"/>
<c:set var="ctRootcss" value="${ctRoot}/resources/css"/>
<c:set var="ctRootlib" value="${ctRoot}/resources/lib"/>


<!-- css 파일 & jquery 라이브러리 파일 수입 -->
<!-- <link href="${pageContext.request.contextPath}/resources/test.css?ver=1" rel="stylesheet" type="text/css"> -->
<!-- <link href="${ctRoot}/resources/common.css" rel="stylesheet" type="text/css"> -->
<link href="/group4erp/resources/test.css?ver=1" rel="stylesheet" type="text/css">
<link href="/group4erp/resources/component.css" rel="stylesheet" type="text/css">
<script src = "${ctRoot}/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src = "${ctRoot}/resources/common.js?ver=1"></script>


<script>
	$(document).ready(function() {
		//if(location.href.indexOf("loginForm.do") < 0 ) {
		//	$("body").prepend("<center><input type=button value='로그아웃' onClick=\"location.replace('/z_spring/logout.do')\"></center>" );
		//}

		$("body").attr("bgcolor", "${bodyBgColor1}");
	});
</script>

<body>


</body>


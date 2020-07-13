<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- css 파일 & jquery 라이브러리 파일 수입 -->
<link href="/myBoard/resources/common.css" rel="stylesheet" type="text/css">
<script src = "/myBoard/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src = "/myBoard/resources/common.js"></script>
<script src = "/www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 막대그래프 차트를 보여준다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연봉정보</title>
<script type="text/javascript">

google.charts.load('current', {'packages' : ['corechart'] } );

google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var data = google.visualization.arrayToDataTable(${sal_chart_data});
	
	var options = {
			title: '직급별 평균 연봉',
			width :600, 
			height: 700
	};
	
	var chart = new google.visualization.ColumnChart(document.getElementById('salaryChart'));
	
	chart.draw(data, options);
}
	
</script>

</head>

<body><center>
<div id="salaryChart" style="width: 700px; height: 500px;"></div>
</center>


</body>
</html>
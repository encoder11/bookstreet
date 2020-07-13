<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고신청현황</title>
<script>

	$(document).ready(function() {
		showTime();
		headerSort("adApplyTable", 0);

		setTableTrBgColor(
				"adApplyTable",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
	});


	function updateEventInfo(idx, ad_no, ad_title, open_req_dt, ad_term) {
		
		var thisTr = $(idx).parent().parent();
	      var delTr = $('.adApplyTable [name=updateAd]');
	      if(delTr.size()>0){
	    	  delTr.remove();
	      }
	      
	      //$('.mycarebookTable tbody tr:eq('+idx+')').append(" <tr> <td>");
	      //$('.mycarebookTable tbody tr:eq('+idx+')').after(" <tr align=center> <td colspan=7> </td> </tr>");
	      
	      //var str = $('.qqq').html();
	          
	      //var thisTr = $(idx).parent().parent();
	      
	      
	      var htmlCode = "<tr name='updateAd' align=center> <td colspan=7>"
		  htmlCode += "<div class='updateAdDiv'>"
	      htmlCode += "<form name='updateAdForm'>"
	      htmlCode += "<table class='innertable tab' align=center>"
	      htmlCode += "<tr> <th>광고타이틀 <td><input type='text' name='ad_title' value="+ad_title+">"
	      htmlCode += "<tr> <th>노출 시작일 <td><input type='text' name='open_req_dt' value="+open_req_dt+">"
	   	  htmlCode += "<tr> <th>희망노출기간 <td><input type='text' name='ad_term' value="+ad_term+">"
	      htmlCode += "</table> </form>"
	      htmlCode += "<input type='button' value='저장' name='updateAdInfo' onClick='updateAdInfoProc();'>&nbsp;"
		  htmlCode += "<input type='button' value='닫기' name='closeTr' onClick='closeThisTr(this);'>&nbsp;</div>"
		  htmlCode += "<input type='hidden' name='ad_apply_no' value="+ad_no+">"  
		  htmlCode += "<script>"
		  htmlCode += "$('[name=open_req_dt]').datepicker({ dateFormat: 'yy-mm-dd' });"
		  htmlCode += "$('[name=open_end_dt]').datepicker({ dateFormat: 'yy-mm-dd' });"
		  htmlCode += "</script"+">"
	      
	      thisTr.after(htmlCode);
	    
	}

	function closeThisTr(idx) {
		
		$(idx).parent().parent().parent().remove();

		//$("[name=updateCorpBtn]").val("수정");
	}

	function updateAdInfoProc(corp_no) {

		$.ajax({
			url : "/group4erp/updateAdInfoProc.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $('[name=updateAdForm]').serialize(),		//서버로 보낼 파라미터명과 파라미터값을 설정
			
			success : function(upCnt) {
				if(upCnt==1) {
					alert("수정 성공!");
					
					location.replace("/group4erp/viewAdApplyList.do");
				} else if(delCnt==-1) {	
					alert("광고가 이미 삭제되었습니다!");
					
					location.replace("/group4erp/viewAdApplyList.do");

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

	function reserveAdForm() {
		location.replace("/group4erp/insertAdApply.do");
	}
	
</script>
</head>
<body><center>
	<h1>[광고신청현황]</h1><br>
	<label> <span id="nowTime"> </span> [현재 광고 정보] : ${adApplyCnt}회 </label>
	<select name="rowCntPerPage">
						<option value="10">10
						<option value="15">15
						<option value="20">20
						<option value="25">25
						<option value="30">30
					</select>행보기 <br><br>
			
					
	<form name="searchEvntForm" method="post" action="/group4erp/viewEventList.do">
		<table name="searchEvntTable">
			<tr>
				<td>[상태별]</td><td><input type="checkbox" value="01" name="evnt_stat">대기중
									<input type="checkbox" value="03" name="evnt_stat">심사중
									<input type="checkbox" value="02" name="evnt_stat">진행중
									<input type="checkbox" value="04" name="evnt_stat">종료
				</td>
			</tr>
			<tr>
				<td>[검색어]</td><td><input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">&nbsp;&nbsp;
									<input type="button" value="모두검색" onClick="goSearchAll();"></td>
			</tr>
		</table>
		<input type="hidden" name="selectPageNo" >
		<input type="hidden" name="sort" >
	</form>

		
	<input type="button" name="reserveAd" value="광고 신청" onClick="reserveAdForm();" />&nbsp;
	<input type="button" value="삭제" onClick="deleteNotYetEvent();"><br>
	
	<div id="comment" style="color:red;">대기중인 광고 신청만 삭제할 수 있습니다.</div>
	<div id="blankArea">&nbsp;</div>
	
	<table class="adApplyTable tab" name="adApplyTable" cellpadding="5" cellspacing="5">
		<tr>
			
			
		</tr>
		<tr>
			<th></th><th>광고신청번호</th><th>업체번호</th><th>광고타이틀</th><th>희망노출기간</th><th>등록일</th><th>상태</th><th>비고</th>
		</tr>
		<c:forEach items='${adApplyList}' var="adApplyList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="viewEmpSalInfo(${empSal.emp_no});">
				<td><input type="checkbox" name="deleteAd" onClick="deleteAd('${adApplyList.ad_apply_no}')"></td>
				<td>${adApplyList.ad_apply_no}</td>
				<td>${adApplyList.corp_no}</td>
				<td>${adApplyList.ad_title}</td>
				<td align="center">${adApplyList.ad_term}</td>
				<td>${adApplyList.reg_dt}</td> 
				<td>${adApplyList.ad_stat}</td>
				<td>
					<c:if test="${adApplyList.ad_stat eq '대기중' }">
						<input type="button" name="updateBtn" value="수정" onClick="updateEventInfo(this,'${adApplyList.ad_apply_no}', '${adApplyList.ad_title}', '${adApplyList.open_req_dt}', '${adApplyList.ad_term}');">
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${empty adApplyList}">
		광고신청내역이 없습니다.
	</c:if>
	<br>
	<!-- <input type="button" value="광고신청" onClick="insertAdInfo();"> -->
</center>

	
</body>
</html>
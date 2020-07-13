<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>직원 근무 현황</title>
<style>
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
		/* var picker = new Pikaday({ 
			 field: document.getElementById('datepicker'),
			 format: 'yyyy-MM-dd',
			 toString(date, format) {
			   let day = ("0" + date.getDate()).slice(-2);
			   let month = ("0" + (date.getMonth() + 1)).slice(-2);
			   let year = date.getFullYear();
			   return `${year}-${month}-${day}`;
		 }
		}) */;
	
		$(document).ready(function(){
			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			});

			startTime();
			
			setTableTrBgColor(
					"inoutListTable",		//테이블 class 값
					"${headerColor}",		//헤더 tr 배경색
					"${oddTrColor}",		//홀수행 배경색
					"${evenTrColor}",		//짝수행 배경색
					"${mouseOverColor}"		//마우스 온 시 배경색
			);

			
			
			$(".pagingNumber").html(
				getPagingNumber(
					"${getEmpInoutListCnt}"					//검색 결과 총 행 개수
					,"${hrListSearchDTO.selectPageNo}"		//선택된 현재 페이지 번호
					,"${hrListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"									//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"							//페이지 번호 클릭 후 실행할 자스 코드
				)
			);


			$("#datepicker").datepicker({
			    onSelect: function() { 
			    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
			        var dateObject = $(this).datepicker('getDate');
			        //alert(dateObject.val()); 
			    }
			});


			inputData( "[name=selectPageNo]", "${hrListSearchDTO.selectPageNo}" );	
			inputData( "[name=rowCntPerPage]", "${hrListSearchDTO.rowCntPerPage}" );
			inputData( "[name=datepicker]", "${hrListSearchDTO.datepicker}" );
			inputData( "[name=keyword1]", '${hrListSearchDTO.keyword1}' );
			inputData( "[name=sort]", '${hrListSearchDTO.sort}' );
			<c:forEach items="${hrListSearchDTO.inout_name}" var="inout">
				inputData( "[name=inout_name]", "${inout}" );
			</c:forEach>
			
		});
	
		function goSearch(){
			//alert($("[name=datepicker]").val());
			var keyword1 = $("[name=InoutListDate] [name=keyword1]").val();
			keyword1 = $.trim(keyword1);
			$("[name=InoutListDate] [name=keyword1]").val(keyword1);
			document.InoutListDate.submit();
		}

		function goSearchAll(){
			document.InoutListDate.reset();
			$("[name=InoutListDate] [name=selectPageNo]").val(1);
			$("[name=InoutListDate] [name=rowCntPerPage]").val(10);
			goSearch();
			
		}
		function goReset(){
			document.InoutListDate.reset();
		}
		function InoutbyDt(){
			//alert( $("[name=getEmpInoutList]").serialize() );
			/* 
			$.ajax({
				url : "/group4erp/viewEmpWorkStateList.do"
				,type : "post"
				,data : $("[name=getEmpInoutList]").serialize()
				,success : function(admin_idCnt){
					if(admin_idCnt==1){
						location.replace("/z_spring/boardListForm.do");
					}
					else if(admin_idCnt==0){
						alert("아이디, 암호가 존재하지 않음. 재입력 바람");
					}
					else{
						alert("서버 오류 발생. 관리자에게 문의 바람");
					}	
				}
				,error : function(){
					alert("서버 접속 실패. 관리자에게 문의 바람");
				}
			}); */
		}
		function goUpdate(idx, idxNo){
			var test = $(idx).parent();
			var delTr = $('[name=thisTr]');
		    if(delTr.size()>0){
		         delTr.remove();
		    }

			test.after(insert);
		}
		function goUpdate(idx, idxNo, dt_work, emp_no){
			//alert("테스트중..." + idx + " / " + idxNo);
			//alert(dt_work);
			var thisTr = $(idx).parent().parent();
			var delTr = $('.inoutListTable [name=test]');
			if(delTr.size()>0){delTr.remove();}
			//alert(thisTr);
			var wares = "<tr name='test' align=center><form name='update'><td align=center>" + $('.inoutListTable tr:eq('+idxNo+') td:eq(0)').text();
				wares += "<td align=center>" + dt_work;
				wares += "<td align=center>" + emp_no;
				wares += "<td align=center>" + $('.inoutListTable tr:eq('+idxNo+') td:eq(3)').text();
				wares += "<td align=center>" + $('.inoutListTable tr:eq('+idxNo+') td:eq(4)').text();
				wares += "<td align=center>" + $('.inoutListTable tr:eq('+idxNo+') td:eq(5)').text();
				wares += "<td align=center><input type='text' name='in_time' size=6>"
				wares += "<td align=center><input type='text' name='out_time' size=6>"
				wares += "<td align=center>"
				wares += "<td align=center><select name='check_inout_name'><option value='출근'>출근<option value='퇴근'>퇴근<option value='결근'>결근<option value='조퇴'>조퇴<option value='지각'>지각<option value='외근'>외근</select>"
				wares += "<td align=center><input type='text' name='remarks' size=6>"
				wares += "<td align=center><input type='button' value=' 닫기 ' onClick='remove();'></tr>"
				wares += "<tr name='test'><td colspan=11><td><input type='hidden' name='dt_work' value="+dt_work+"><input type='hidden' name='emp_no' value="+emp_no+"><input type='button' value='수정하기' onClick='upLoder();'></form></tr>"
			//alert(wares);
			thisTr.after(wares);
		}
		function remove(){
			//var in_time = $('[name=in_time]').val();
			//in_time = in_time.substring(0,2) + ":" + in_time.substring(2,4);
			//$('[name=in_time]').val("");
			//$('[name=in_time]').val(in_time);
			//in_time = work_date + " " + in_time.substring(0,2) + ":" + in_time.substring(2,4);
			//var out_time = $('[name=out_time]').val();
			//out_time = work_date + " " + out_time.substring(0,2) + ":" + out_time.substring(2,4);
			//alert(in_time + " & " + out_time);
			//alert( $(".inoutListTable [name=test] [name=update]").serialize() );
			//alert( $("[name=InoutListDate]").serialize() );funct//ion remove(){
			$('[name=test]').remove();
		}
		function upLoder(){
			var dt_work = $("[name=dt_work]").val();
			var emp_no = $("[name=emp_no]").val();
			//alert(dt_work);
			//alert(emp_no);
			var in_time = $('[name=in_time]').val();
			//alert(in_time);
			var out_time = $('[name=out_time]').val();
			//alert(out_time);
			var remarks = $('[name=remarks]').val();
			
			var check_inout_name = $('[name=check_inout_name]').val();

			if(in_time.indexOf(':')>0){
				var time = in_time.split(':');
				if(time.length == 2){
					if(time[0].length == 1){time[0] = 0 + time[0];}
					if(time[1].length == 1){time[1] = 0 + time[1];}
					in_time = time[0] + time[1];
				}
			}
			if(in_time.length == 3 && parseInt(in_time) < 1000){
				in_time = 0 + in_time;
			}
			if(in_time.length == 2 && parseInt(in_time) > 12){
				var time1 = 0 + in_time.substring(0,1);
				var time2 = 0 + in_time.substring(1,2);
				in_time=time1+time2;
			}
			//alert(in_time);
			
			if(out_time.indexOf(':')>0){
				var time = out_time.split(':');
				if(time.length == 2){
					if(time[0].length == 1){time[0] = 12 + parseInt(time[0]);}
					if(time[1].length == 1){time[1] = 0 + time[1];}
					out_time = time[0] + time[1];
				}
			}
			if(out_time.length == 3 && parseInt(out_time) < 1200){
				out_time = 1200 + parseInt(out_time);
			}
			if(out_time.length == 2 && parseInt(out_time) > 24){
				var time1 = 12 + parseInt(out_time.substring(0,1));
				var time2 = 0 + out_time.substring(1,2);
				out_time=time1+time2;
			}
			if(out_time.length == 1){
				out_time = 12 +  parseInt(out_time);
			}

			if(check_inout_name == '출근' || check_inout_name == '퇴근'){
				remarks = "";
			}
			//alert(out_time);
			
			var str = "dt_work="+dt_work+"&emp_no="+emp_no+"&in_time="+in_time+"&out_time="+out_time+"&check_inout_name="+check_inout_name+"&remarks="+remarks;
			//alert(str);
			$.ajax({
				//서버 쪽 호출 URL 주소 지정
				url : "/group4erp/empWorkStateUpdateProc.do"
				//form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"
				//서버로 보낼 파라미터명과 파라미터값을 설정
				//, data : $("[name=update]").serialize()
				
				, data : str
				
				//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
				//익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
				//현재 data라는 매개변수에는 아이디,암호의 존재 개수가 들어온다.
				, success : function(updateCnt){
					//아이디 존재 개수가 1개면 ${ctRoot}/boardList.do 로 이동
					if(updateCnt==1){
						//alert("수정완료");
						document.InoutListDate.submit();
					}
					//아이디 존재 개수가 0개면 경고하기
					else if(updateCnt==0){ alert("수정 실패 입력양식을 확인하세요"); }
					else{ alert("서버 오류 발생! 관리자에게 문의 바람!"); }
				}
				//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				, error : function(){ alert("서버 접속 실패! 관리자에게 문의 바람!" + error); }
			});
			
		}
	</script>

</head>
<body><center>

	<b>추후 메뉴 이동해야함</b>

	<h1 class="fontBold" style="font-size:15pt">[직원 근무 현황]</h1><br>

	<form name="InoutListDate" method="post" action="/group4erp/viewEmpWorkStateList.do">
		
		<div class="fontLight" style="width:800; font-size:9pt">
			[키워드] : <input type="text" name="keyword1" >
			[일자] : <input type="text" id="datepicker" name="datepicker"><br>
			<table><tr height=10><td></table>
			[구분] :
			<input type="checkbox" name="inout_name" class="inout_name" value="출근">출근
			<input type="checkbox" name="inout_name" class="inout_name" value="퇴근">퇴근
			<input type="checkbox" name="inout_name" class="inout_name" value="결근">결근
			<input type="checkbox" name="inout_name" class="inout_name" value="조퇴">조퇴
			<input type="checkbox" name="inout_name" class="inout_name" value="지각">지각
			<input type="checkbox" name="inout_name" class="inout_name" value="외근">외근
			
			<table><tr height=10><td></table>
			<input type="button" value="검색" onClick="goSearch();">
			<input type="button" value="모두검색"  onClick="goSearchAll();">
			<input type="button" value="초기화" onClick="goReset();">
			<!-- <input type="button" value="검색" onClick="goSearch();"
				 style="width:75;  background-color:#FFFFFF; border:1 solid #A0DBE4">&nbsp;
			<input type="button" value="모두검색" onClick="goSearchAll();"
				style="width:75; background-color:#FFFFFF; border:1 solid #A0DBE4"> -->
		</div>
	    
	    <script>
	        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });    
	    </script>
	    
	    &nbsp;&nbsp;
		<table border=0 width=70%>
			<tr>
				<td class="fontLight" align=right style="font-size:9pt">
					[총 개수] : ${getEmpInoutListCnt}&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="rowCntPerPage">
						<option value="10">10
						<option value="15">15
						<option value="20">20
						<option value="25">25
						<option value="30">30
					</select> 행보기
		</table>
	    
	    <input type="hidden" name="selectPageNo">
	    <input type="hidden" name="sort">
	    

	  <!-- 
	    
	  </form>
	  <div id="modify" style="display:none;">
		<table class="tab" id="modifyTable" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<td>$('.inoutListTable tr:eq(1) td:eq(0)').text();
				<td>$('.inoutListTable tr:eq(1) td:eq(1)').text();
				<td>$('.inoutListTable tr:eq(1) td:eq(2)').text();
				<td>$('.inoutListTable tr:eq(1) td:eq(3)').text();
				<td>$('.inoutListTable tr:eq(1) td:eq(4)').text();
				<td>$('.inoutListTable tr:eq(1) td:eq(5)').text();
				<td><input type='text' size=6 name='in_time'>
				<td><input type='text' size=6 name='out_time'>
				<td>
				<td><input type='text' size=6 name='check_inout_name'>
				<td><input type='text' size=6 name='remarks'>
				<td><input type='button' value='닫기' onClick='remove();'>
			</tr>
		</table>
		<table><tr height=1><td></td></tr></table>
		<button onclick="closeDiv(this);">닫기
	 --></button>
	</div>
	    <table><tr height=10><td></table>
  
	   <form name="getEmpInoutList" method="post" action="/group4erp/viewEmpWorkStateList.do">
		<table class="inoutListTable tab" name="dayOffList" cellpadding="5" cellspacing="5" width=70%>

				<tr>
					<th class="thset" >번호</th>
					<c:choose>
						<c:when test="${param.sort=='DT_WORK desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼날짜</th>
						</c:when>
						<c:when test="${param.sort=='DT_WORK asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('DT_WORK desc'); goSearch()">▲날짜</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('DT_WORK asc'); goSearch();">날짜</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='EMP_NO desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼사원번호</th>
						</c:when>
						<c:when test="${param.sort=='EMP_NO asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('EMP_NO desc'); goSearch()">▲사원번호</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('EMP_NO asc'); goSearch();">사원번호</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='EMP_NAME desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼성명</th>
						</c:when>
						<c:when test="${param.sort=='EMP_NAME asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('EMP_NAME desc'); goSearch()">▲성명</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('EMP_NAME asc'); goSearch();">성명</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='DEP_NAME desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼부서</th>
						</c:when>
						<c:when test="${param.sort=='DEP_NAME asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('DEP_NAME desc'); goSearch()">▲부서</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('DEP_NAME asc'); goSearch();">부서</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='JIKUP desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼직급</th>
						</c:when>
						<c:when test="${param.sort=='JIKUP asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('JIKUP desc'); goSearch()">▲직급</h>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('JIKUP asc'); goSearch();">직급</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='IN_TIME desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼출근시간</th>
						</c:when>
						<c:when test="${param.sort=='IN_TIME asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('IN_TIME desc'); goSearch()">▲출근시간</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('IN_TIME asc'); goSearch();">출근시간</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='OUT_TIME desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼퇴근시간</th>
						</c:when>
						<c:when test="${param.sort=='OUT_TIME asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('OUT_TIME desc'); goSearch()">▲퇴근시간</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('OUT_TIME asc'); goSearch();">퇴근시간</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='WORKING_HRS desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼근무시간</th>
						</c:when>
						<c:when test="${param.sort=='WORKING_HRS asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('WORKING_HRS desc'); goSearch()">▲근무시간</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('WORKING_HRS asc'); goSearch();">근무시간</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='CHECK_INOUT_NAME desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼구분</th>
						</c:when>
						<c:when test="${param.sort=='CHECK_INOUT_NAME asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('CHECK_INOUT_NAME desc'); goSearch()">▲구분</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('CHECK_INOUT_NAME asc'); goSearch();">구분</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='REMARKS desc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val(''); goSearch();">▼비고</th>
						</c:when>
						<c:when test="${param.sort=='REMARKS asc'}">
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('REMARKS desc'); goSearch()">▲비고</th>
						</c:when>
						<c:otherwise>
							<th class="thset" style="cursor:pointer" onclick="$('[name=sort]').val('REMARKS asc'); goSearch();">비고</th>
						</c:otherwise>
					</c:choose>
					
					<th class="thset" >수정여부</th>
					
				</tr>

				<c:forEach items="${requestScope.getEmpInoutList}" var="inout" varStatus="loopTagStatus">
					<tr style="cursor:pointer">
						<td align=center> ${getEmpInoutListCnt-loopTagStatus.index}</td>
						<td align=center> ${inout.DT_WORK}</td>
						<td align=center> ${inout.EMP_NO}</td>
						<td align=center> ${inout.EMP_NAME}</td>
						<td align=center> ${inout.DEP_NAME}</td>
						<td align=center> ${inout.JIKUP}</td>
						<td align=center> ${inout.IN_TIME}</td>
						<td align=center> ${inout.OUT_TIME}</td>
						<td align=center> ${inout.WORKING_HRS}</td>
						<td align=center> ${inout.CHECK_INOUT_NAME}</td>
						<td align=center> ${inout.REMARKS}</td>
						<td align=center>
							<input type="button" value="수정" onClick="goUpdate(this,'${loopTagStatus.index+1}', '${inout.DT_WORK}','${inout.EMP_NO}');">
						</td>
						<%-- 
						<c:if test="${inout.CHECK_INOUT_NAME != '퇴근' && inout.CHECK_INOUT_NAME != '출근'}">
							<input type="button" value="수정" onClick="goUpdate(this,'${loopTagStatus.index+1}', '${inout.DT_WORK}','${inout.EMP_NO}');">
						</c:if>
						 --%>
					</tr>
				</c:forEach>
			
			
			<!-- <tr>
				<th>소속 부서 ▼ </th><th>직급 ▼ </th><th>성명 ▼ </th><th>휴가 종류 ▼ </th><th>복귀 예정일 ▼</th>
			</tr>
			<tr>
				<td>기획부</td><td>과장</td><td>박민아</td><td>연차</td><td>2019.12.24</td>
			</tr>
			<tr>
				<td>영업부</td><td>사원</td><td>김설현</td><td>연차</td><td>2019.12.26</td>
			</tr> -->
		
		</table>
		
		
		<table><tr height=10><td></table>
		<c:if test="${getEmpInoutListCnt eq 0}">
				<h5>해당 결과가 없습니다.</h5>
		</c:if>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	
	</form>

</center>
</body>
</html>
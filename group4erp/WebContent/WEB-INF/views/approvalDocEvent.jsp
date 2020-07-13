<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 행사 신청 결재</title>

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
	
	function responseApproval() {
	
		var approvalYn = $(".eventApprovalDoc").find("[name=approvalYn]:checked").val();
		var e_work_comment = $(".eventApprovalDoc [name=documentTable]").find("[name=e_work_comment]").val();
		//alert(e_work_comment);
		
		if( (approvalYn==6) && (e_work_comment=="") ) {
			alert("반려 시 사유를 기입해주세요.");

			return;		
			
		} 
		//alert( $('.eventApprovalDoc').serialize() );
		$.ajax({
			url : "/group4erp/updateEventApproavalProc.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $('.eventApprovalDoc').serialize(),		//서버로 보낼 파라미터명과 파라미터값을 설정
			
			success : function(upCnt) {
				if(upCnt==1) {
					//alert("결재 성공!");
					
					location.replace("/group4erp/viewApprovalList.do");
				} else if(delCnt==-1) {	
					//alert("업체가 이미 삭제되었습니다!");
					alert("결재 실패했습니다! 관리자에게 문의 바람");
					//location.replace("/group4erp/viewApprovalList.do");

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


</head>
<body><center>   
   <form class="eventApprovalDoc" method="post" action="/group4erp/updateEventApproavalProc.do">
      <table class="searchTable tableth" cellpadding="5" cellspacing="5" width="50%" align="center">
      
      <tr>
         <td align="right" ><table name="jikup" border="1" cellpadding="5" cellspacing="0">
      <tr>
      	<td width="90" align="center" style="font-weight: bold;">기안자 </td>
      	<td  width="90" align="center" style="font-weight: bold;">부서장</td>
      	<td width="90" align="center" style="font-weight: bold;">대표이사 </td> </tr> 
      <tr>
      	<td align="center">${approvalInfoList.emp_name}</td>
      	<td align="center">
      	 <% String mgr_no = (String)session.getAttribute("mgr_emp_no"); 
      	 	String emp = (String)session.getAttribute("emp_id");
      	 	System.out.println("mgr_no==="+mgr_no);
      	 	String ceo_no = (String)session.getAttribute("ceo_no");
      	 	System.out.println("ceo_no==="+ceo_no);
      	 	if(mgr_no != null) {   //사원이 부서장에게 결재 요청했을 때 %>
      	 <input type="radio" name="approvalYn" value="7">승인 &nbsp;
      	 <input type="radio" name="approvalYn" value="6">반려 &nbsp;
      	 <input type="hidden" name="mgr_emp" value='<%=emp %>'>
      	 <% } else if(mgr_no==null && ceo_no!=null) {if(ceo_no.equals("100001") ) { } else { %>
      	 <label>${approvalInfoList.mgr_name}</label><%  } }%>
      	 </td>
      	 <td>
      	 	<% if(mgr_no == null) { %>
      	 	<input type="radio" name="approvalYn" value="5">승인 &nbsp;
      	 	<input type="radio" name="approvalYn" value="6">반려 &nbsp;
      	 	<% } %>
      	 	 </td> </tr></table>                  
                                                                                 
      </tr>
         
      <tr>
         <table class="documentTable searchTable tableth" name="documentTable" cellpadding="5" cellspacing="5" width="50%">      
            <tr>
               <th width="100">신청번호</td>
			   <td colspan="3">${approvalInfoList.evnt_no}</td>
               <input type="hidden" name="document_no" value="${approvalInfoList.evnt_no}">
            </tr>
            <tr>
               <th width="100">기안자</td>
			   <td>
					<table>
						<tr>
							<th style="text-align:center;">직급<th style="text-align:center;">성명
						<tr>
							<td>${approvalInfoList.jikup}<td>${approvalInfoList.emp_name}
					</table>
            </tr>
            <tr>
               <th>일시</td>
			   <td>${approvalInfoList.reg_dt} </td>
            </tr>
            <tr>
               <th>안건 주제</td >
			   <td>이벤트 행사 신청</td>
            </tr>
            <tr>
               <th>내용</td>
			   <td>
					<table class="inner">
						<tr>
						<th style="text-align:center;">이벤트 타이틀<th style="text-align:center;">진행 일시<th style="text-align:center;">첨부파일
						<tr>
						<td>${approvalInfoList.evnt_title}<td>${approvalInfoList.evnt_start_dt} ~ ${approvalInfoList.evnt_end_dt}<td>${approvalInfoList.atchd_data}
						</table>
            </tr>
            <tr>
               <th>메모</td>
			   <td><textarea name="e_work_comment" cols="40" rows="10" placeholder="반려할 시 사유를 기입해주세요."></textarea></td>
            </tr>            
         </table><br>
         <h4>위와 같이 진행할 예정이니 검토 부탁드립니다.</h4>
         <input type="button" value="결재" onClick="responseApproval();"> &nbsp;
         <input type="reset" value="초기화">
      </tr>   
      
      
   </table>
   <br><br>
   

   </form>
   
</center>

</body>
</html>
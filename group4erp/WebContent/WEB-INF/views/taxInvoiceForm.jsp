<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세금계산서</title>
<script>

	$(document).ready(function() {

		$("[name=corpList]").change(function() {
			var corp_no = $('[name=corpList]').val();
			$('[name=corp_no]').val(corp_no);
			
			searchCorp();
		});


		$("[name=open_req_dt]").datepicker({
   		 	onSelect: function() { 
   	 		//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
   	    	 var dateObject = $(this).datepicker('getDate');
   	    	 //alert(dateObject.val()); 
   			}
		});
	});

	function saveTaxInvoiceTemp() {
		alert("세금계산서 임시 저장");
	}

	function issueTaxInvoice() {

		if(confirm("정말 저장하겠습니까?")==false) {

			return;
		}

		
		//alert("세금계산서 발급");
	}

	function searchCorp() {
		document.buyerInfoForm.submit();
		/*$.ajax({			
			url : "/group4erp/selectCorp.do"	
			, type : "post"					
			, data : $("[name=buyerInfoForm]").serialize()	
			, success : function(corp_cnt) {	
											
				if(corp_cnt != null) {				
					location.replace("/group4erp/viewTaxInvoiceForm.do");
					
				} else if(corp_cnt==null) {		
					alert("해당 업체가 존재하지 않습니다.");
				} else {
					alert("서버 오류 발생! 관리자에게 문의 바람!");
				}				
			}
			
			, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				alert("서버 접속 실패!");
			}			
		}); */
		
	}

</script>
</head>
<body><center>
	<h3>세금계산서</h3>
	<form name="taxInvoiceForm" method="post" action="/group4erp/insertTaxInvoice.do" >
		<table class="ourCompanyInfoForm tab" name="ourCompanyInfoForm" cellpadding="5" cellspacing="5" width="800">
			<tr>
				<td rowspan="5" width="150" align="center">공급자</td><td width="100">사업자번호</td><td>110-11-98765</td>
			</tr>
			<tr>
				<td width="10">상호(법인명)</td><td>(주)아이즈북스&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>성명(대표자)</td><td>조충래, 김태현, 박현우, 이동하, 임남희, 최민지</td>
			</tr>
			<tr>
				<td>사업자주소</td><td>서울특별시 금천구 가산동 월드메르디앙 2차 409호&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>업종</td><td>출판&nbsp;&nbsp;</td>
			</tr>
		</table><br>
	</form>	
	
	<form name="buyerInfoForm" method="post" action="/group4erp/selectCorp.do">
		<table class="BuyerInfoTable tab" name="BuyerInfoForm" cellpadding="5" cellspacing="5" width="800">
			<tr>
				<td rowspan="5" width="100" align="center">공급받는자
					<select name="corpList">
						<option value="00">-------</option>			
						<c:forEach items="${corpList}" var="corp" varStatus="loopTagStatus">
							<option value="${corp.corp_no}">${corp.corp_name}</option>			
						</c:forEach>					
					</select><!-- <input type="button" value="검색" onClick="searchCorp();"></td> --><td width="100">사업자번호</td><td> ${selectedCorp.corp_no} </td>
			<tr>
				<td width="10">상호(법인명)</td><td>${selectedCorp.corp_name}</td>
			</tr>
			<tr>
				<td>성명(대표자)</td><td>${selectedCorp.ceo_name}</td> 
			</tr>
			<tr>
				<td>사업자주소</td><td>${selectedCorp.corp_addr}</td>
			</tr>
			<tr>
				<td>업종</td><td>${selectedCorp.corp_business_area}</td>
			</tr>
		</table>
		<input type="hidden" name="corp_no" >
	</form>
	<br>				
	<table class="invoice_body tbcss1" name="invoice_body" cellpadding="5" cellspacing="5" width="800">
		<tr>
			<th>거래일시</th><th>품목</th><th>단가</th><th>공급가액</th><th>세액</th><th>비고</th>
		</tr>
		<tr>
			<td><input type="text" name="tradeDate"></td>
			<td><input type="text" name="item"></td>
			<td><input type="text" name="unit_cost"></td>
			<td><input type="text" name="real_cost"></td>
			<td><input type="text" name="tax"></td>
			<td><input type="text" name="comment"></td>
		</tr>
		</table> 
	
	</form>
	<input type="button" value="임시저장" onClick="saveTaxInvoiceTemp();">
	<input type="button" value="발급하기" onClick="issueTaxInvoice();">
	
</center>

</body>
</html>
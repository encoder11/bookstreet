<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세금계산서 발행 내역</title>
<script>

	function viewTaxInvoiceForm() {

		//document.issue_list_submit();
		location.replace("/group4erp/viewTaxInvoiceForm.do");
	}

</script>

</head>
<body><center>
	<h1>2019년도 11월 세금계산서 발급 내역</h1>
	<form name="issue_list" method="post" action="/group4erp/viewTaxInvoiceForm.do">
		<table class="issue_no tab" name="issue_no" cellpadding="5" cellspacing="5" width="700">
			<thead>
				<th>발급번호</th><th>공급받는 자</th><th>사업자명</th><th>거래일시</th><th>총액</th><th>비고</th>
			</thead>
			
			<tr>
				<td>20190035</td><td>CJ 대한통운</td><td>박근희</td><td>2019.11.11</td><td>530,000</td><td><input type="button" value="수정발급"></td>
			</tr>
		</table>
		<br>
	<input type="button" value="세금계산서 발급" onClick="viewTaxInvoiceForm();"> 
	</form>
	

</center>

</body>
</html>
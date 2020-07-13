<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

$(document).ready(function(){   

	   $('[name=rowCntPerPage]').change(function(){
	      goSearchBookInven();
	   });
	   
	   $(".pagingNumber").html(
	         getPagingNumber(
	            "${bookListCnt}"                  //검색 결과 총 행 개수
	            ,"${invenSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
	            ,"${invenSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
	            ,"10"                              //페이지 당 보여줄 페이지번호 개수
	            ,"goSearchBookInven();"                  //페이지 번호 클릭 후 실행할 자스코드
	         )
	      );
});

	function goSearchBookInven(){
		//alert($('[name=bookOrderList]').serialize());
		//return;
		document.bookOrderList.submit();
	}
	
	function goOrderPage(isbn){
		alert("주문 페이지 구현중"+isbn);
		//return;
		location.href="/group4erp/goBookOrderPage.do?isbn13="+isbn;
	}
	
	function goBack(){
		history.go(-1);
	}
	
</script>

</head>
<body>
<center>
<b>[책 목록]</b>
<br><br>
	<table border=0 width=700>
		<tr>
			<td align=right><a href="javascript:goBack();">[뒤로가기]</a></td>
		</tr>
	</table>
<br>

	<form name="bookOrderList" method="post" action="/group4erp/goOrderBookList.do">
		<table border=0 width=700>
			<tr>
	        <td align=center>키워드 : 
	            <input type="text" name="book_keyword" size=15>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <input type="button" value="검색" onclick="goSearchBookInven();">
	        <tr>
	         	<th>
	            <td align=right>
	            [검색 수량] : ${bookListCnt} 권
	               <select name="rowCntPerPage">
	                  <option value="10">10</option>
	                  <option value="15">15</option>
	                  <option value="20">20</option>
	                  <option value="25">25</option>
	                  <option value="30">30</option>
	               </select> 행보기
	      </table>
	      <input type="hidden" name="selectPageNo" value="${invenSearchDTO.selectPageNo}">
	</form>
	
	<table class="bookTable tab" border=0 cellspacing=0 cellpadding=5 >
		<tr>
			<th>번호<th>책번호<th>책이름<th>카테고리<th>출판사<th>가격<th>비고
		<c:forEach items="${requestScope.BookList}" var="book" varStatus="loopTagStatus">
	         <tr style="cursor:pointer" onClick="goBookContentForm(${book.ISBN13});">
	         	<td align=center>${bookListCnt-
	                 (invenSearchDTO.selectPageNo*invenSearchDTO.rowCntPerPage-invenSearchDTO.rowCntPerPage+1+loopTagStatus.index)
	                 +1}
	            <td align=center>${book.ISBN13}
	            <td align=center>${book.book_name}
	            <td align=center>${book.cat_name}
	            <td align=center>${book.publisher}
	            <td align=center>${book.book_price}
	            <td align=center><input type="button" value="주문" onclick="goOrderPage('${book.ISBN13}');">
	    </c:forEach>
	</table>

<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>

</center>
</body>
</html>
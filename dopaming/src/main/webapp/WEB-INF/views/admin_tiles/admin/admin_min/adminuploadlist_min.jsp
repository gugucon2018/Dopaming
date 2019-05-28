<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<script>
function go_page(p) {
	searchFrm.page.value = p;
	searchFrm.submit();
}
</script>
</head>
<body>
	<div>
		<h4>업로드리스트 관리창</h4>
		<hr>
		<span style="float:right">
		<div>
			<form name="searchFrm" method="get">
				<input type="hidden" name="page" value="1"> 
				<input name="searchKeyword" value="${boardListVO_min.searchKeyword}" />
				<button type="submit">검색</button>
			<script>
				searchFrm.searchKeyword.value="${boardListVO_min.searchKeyword}";
			</script>
			</form>
		</div>
		</span>
		<div>
			<table>
				<tr>
					<td>게시판고유번호</td>
					<td>아이디</td>
					<td>제목</td>
					<td>게시판 용량</td>
				<tr>
					<c:forEach items="${uploadList}" var="list1">
						<!-- 등급관리 전체조회 -->
						<tr>
							<td>${list1.board_no }</td>
							<td>${list1.member_id }</td>
							<td>${list1.board_title }</td>
							<td>${list1.file_storage }</td>
						</tr>
					</c:forEach>
			</table>	
		</form>
		</div>
		<my:paging paging="${paging}" />
		<br> <br> <br>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
.pagination {
	display: inline-block;
}
.pagination {
	display: inline-block;
}

.pagination ul {
	display: inline-block;
	padding: 10px;
	margin: 0px;
}

.pagination li {
	display: inline-block;
	padding: 10px;
}

.active {
	color: red;
}

</style>
<script>
	function go_page(p) {
		downFrm.page.value = p;
		downFrm.submit();
	}	
</script>
</head>
<body>
	<h1 style="text-align: center;">내가받은자료</h1>
	<hr>
	<form name="downFrm" action="">
 		<table class="table table-striped table-hover">
 			<thead>
 				<tr>
	 				<th>등록번호</th>
	 				<th>제목</th>
	 				<th>종류</th>
	 				<th>다운로드일</th>
	 				<th>판매자</th>	
 				</tr>
 			</thead>
 			<tbody>
 			<c:forEach items="${list}" var="list">
 				<tr>
 					<td>${list.download_no}</td>
 					<td>${list.board_title}</td>
 					<td>${list.category_big}</td>
 					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.download_date}"/></td>
 					<td>${list.sal_id}</td>
 				</tr>
 			</c:forEach>
 			</tbody>
 		</table>
 		<input type="hidden" name="page" value="1">
	</form>
	<div align="center">
		<my:paging paging="${paging}"/>
	</div>
</body>
</html>
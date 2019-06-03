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
	<h1 style="text-align: center;">업로드관리</h1>
	<hr>
	<form name="downFrm" action="">
 		<table class="table table-striped table-hover">
 			<thead>
 				<tr>
	 				<th>게시판번호</th>
	 				<th>제목</th>
	 				<th>종류</th>
	 				<th>용량(단위: MB)</th>	
	 				<th>등록일</th>	
	 				<th></th>	
 				</tr>
 			</thead>
 			<tbody>
 			<c:forEach items="${list}" var="upload">
 				<tr>
 					<td>${upload.board_no}</td>
 					<td>${upload.board_title}</td>
 					<td>${upload.category_big}</td>
 					<td><fmt:formatNumber pattern="#.00" value="${upload.file_storage}"/>MB</td>
 					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${upload.upload_date}"/></td>
 					<td></td>
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
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

a {
	text-decoration: none;
}

* {
	box-sizing: border-box;
}
td {
	border-bottom: 1px solid;
}
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
		<h4>일반사용자관리</h4>
		<hr>
		<span style="float:right">
		<div>
			<form name="searchFrm" method="get">
				<input type="hidden" name="page" value="1"> <input
					name="searchKeyword" value="${boardVO.searchKeyword}" />
				<button type="submit">검색</button>
			</form>
		</div>
		</span>
		<div>
		
		<form name="form">
			<table>
				<tr>
					<td>아이디</td>
					<td>이메일</td>
					<td>가입날짜(내림차순)</td>
					<td>등급</td>
				<tr>
					<c:forEach items="${normalList}" var="list1">
						<!-- 등급관리 전체조회 -->
						<tr>
							<td><a href="blackInsert/${list1.member_id }">${list1.member_id}</a></td>
							<td>${list1.member_email }</td>
							<td>${list1.member_date }</td>
							<td>${list1.grade_kor }</td>
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
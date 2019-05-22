<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width: 90%;
	text-align: center;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>
<body>
	<h3 align=center>${small} ${big}</h3>

	<button style="float: right">자료 올리기</button>

	<table align="center">
		<tr>
			<td width="150px">분류</td>
			<td width="150px">번호</td>
			<td>제목</td>
			<td width="150px">용량</td>
			<td width="150px">아이디</td>
		</tr>
		<c:forEach items="${list}" var="file">
			<tr>
				<td>${file.file_type}</td>
				<td>${file.file_no}</td>
				<td>${file.file_name}</td>
				<td>${file.file_storage}M</td>
				<td>${file.member_id}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
</html>
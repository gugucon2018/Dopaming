<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//페이징 기능
function goList(p){
	form2.page.value = p;
	form2.submit();
}
</script>
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
	<form action = "mdview" name="form2">
	<input type="hidden" name="page" value="1"></input>
	<input type="hidden" name="category_small" value="${fileVO.category_small}"></input>
	<input type="hidden" name="category_big" value="${fileVO.category_big}"></input>
	</form>
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
	<button style="float: right">자료 올리기</button>
		<!-- 페이징버튼 -->
	<my:paging_joon paging="${paging}" jsfunc="goList"/>
	</body>
</html>
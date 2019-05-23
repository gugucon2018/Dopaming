<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
	<h4>사용자관리 </h4><hr>
	<div>
	<form name="searchFrm" method="get">
	 <input type="hidden" name="page" value="1">
		<select name="user_list">
		  <option value=" ">전체</option>
		  <option value="b">블랙리스트</option>
		  <option value="c">일반회원</option>
		</select>
		<button type="submit">검색</button>
		</form>
	</div>
	<div>
		<table>
			<tr>
				<td> </td>
				<td>아이디</td>
				<td>이메일</td>
			<tr>
		<c:forEach items="${blackList}" var="list1"> <!-- 등급관리 전체조회 -->
		<tr>
			<td><input type="checkbox" name="member_id" value="${classs.member_id }"></td>
			<td>${list1.member_id }</td>
			<td>${list1.member_email }</td>
		</tr>
		</c:forEach>
		</table>
		<my:paging paging="${paging}"/>
	</div>
	<br>
	<br>
	<br>
</div>
</body>
</html>
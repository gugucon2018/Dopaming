<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%-- <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %> --%>  
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
</head>
<body>
<div>
	<h4>등급관리 </h4><hr>
	<table>
		<tr>
			<td>아이디</td>
			<td>총 현질합계</td>
			<td>등급</td>
			<td>총 업로드횟수</td>
		<tr>
	<c:forEach items="${classList}" var="classs"> <!-- 등급관리 전체조회 -->
	<tr>
		<td>${classs.member_id }</td>
		<td>${classs.acron }</td>
		<td>${classs.grade_kor }</td>
		<td>${classs.upload_count }</td>
	</tr>
	</c:forEach>
	</table>
	페이징해야함
		<span style="float:right">
		<form action="adminlogin1" method="post">
		<select>
		  <option value="Select bar">Select bar</option>
		  <option value="Diamond">다이아몬드</option>
		  <option value="gold">골드</option>
		  <option value="sliver">실버</option>
		  <option value="bronze">브론즈</option>
		</select>
		<button type="button">등급 수정</button>
		</form>
	</span>
	<br>
	<br>
	<br>
</div>
</body>
</html>
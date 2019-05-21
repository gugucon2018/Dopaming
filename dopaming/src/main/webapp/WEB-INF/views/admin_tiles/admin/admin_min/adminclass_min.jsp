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
	<h4>등급관리 </h4><hr>
	<form name="searchFrm">
	 <input type="hidden" name="page" value="1">
		<select name="member_grade">
			<option value="">선택
			<option value="g4">다이아도토리
			<option value="g3">골드도토리
			<option value="g2">실버도토리
			<option value="g1">브론즈도토리
		</select>
		<script>
		searchFrm.member_grade.value='${gradeVO_min.member_grade}';
		</script>
		<button>검색</button>
	</form>
	<table>
		<tr>
			<td> </td>
			<td>아이디</td>
			<td>총 현질합계</td>
			<td>등급</td>
			<td>총 업로드횟수</td>
		<tr>
	<c:forEach items="${classList}" var="classs"> <!-- 등급관리 전체조회 -->
	<tr>
		<td><input type="checkbox" name="seqs" value="${board.seq }"></td>
		<td>${classs.member_id }</td>
		<td>${classs.acron }</td>
		<td>${classs.grade_kor }</td>
		<td>${classs.upload_count }</td>
	</tr>
	</c:forEach>
	</table>
<my:paging paging="${paging}"/>
<div align="right">
		<select name="member_grade">
			<option value="">선택
			<option value="g4">다이아도토리
			<option value="g3">골드도토리
			<option value="g2">실버도토리
			<option value="g1">브론즈도토리
		</select>
</div>
</body>
</html>
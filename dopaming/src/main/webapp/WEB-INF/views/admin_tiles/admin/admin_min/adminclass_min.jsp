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
span {
float: right;
}
</style>
<script>
	function go_page(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}

	//등급수정기능
	function grade_update() {
		//체크박스 입력 체크
		var chk = document.getElementsByName("td_checkbox");//태그찾기
		var cnt = 0;
		for (i = 0; i < chk.length; i++) {
			if (chk[i].checked == true) {
				cnt++
			}
		}
		if(cnt == 0 ){
			alert("등급을 수정할 아이디를 선택해주세요");
			return false;
		}

		var grade2 = form.member_grade2.selectedIndex;
		if (grade2 == 0) {
			alert("선택!!");
			return;
		}
		form.action="grade_update"
		form.submit();
	}
</script>
</head>
<body>
	<!-- select + 검색 -->
	<h1 style="text-align: center;">등급관리</h1>
	<hr>
	
	<form name="searchFrm" method="get">
		<span>
			<input type="hidden" name="page" value="1"> 
			<select	name="member_grade">
				<option value="">전체
				<option value="g4">다이아도토리
				<option value="g3">골드도토리
				<option value="g2">실버도토리
				<option value="g1">브론즈도토리
			</select>
			<script>
			searchFrm.member_grade.value='${gradeVO_min.member_grade}';
			</script>
			<button class="btn btn-info">검색</button>
		</span>
	</form>
	
	<!-- 테이블 -->
	<form name="form">
		<table>
			<tr>
				<td></td>
				<td>아이디</td>
				<td>총 현질합계</td>
				<td>등급(내림차순)</td>
				<td>총 업로드횟수</td>
			<tr>
				<c:forEach items="${classList}" var="classs">
					<!-- 등급관리 전체조회 -->
					<tr>
						<td><input type="checkbox" name="td_checkbox"
							value="${classs.member_id }"></td>
						<td>${classs.member_id }</td>
						<td>${classs.acron }</td>
						<td>${classs.grade_kor }</td>
						<td>${classs.upload_count }</td>
					</tr>
				</c:forEach>
		</table>
		<div align="center">
		<my:paging paging="${paging}" />
		</div>
		<div align="right">
			<select name="member_grade2">
				<option value="">선택
				<option value="g4">다이아도토리
				<option value="g3">골드도토리
				<option value="g2">실버도토리
				<option value="g1">브론즈도토리
			</select>
			<button class="btn btn-primary" onclick="grade_update()">등급수정</button>
		</div>
	</form>
</body>
</html>
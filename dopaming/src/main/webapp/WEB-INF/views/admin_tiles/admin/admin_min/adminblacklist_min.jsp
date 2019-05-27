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
//선택삭제 기능
function td_delete(){
	//체크박스 입력 체크
	var chk = document.getElementsByName("td_checkbox"); //태그찾기
	var cnt = 0; //태그의 배열
	for (i = 0; i < chk.length; i++) { //td_checkbox그룹에서 체크된 값을 찾기위해 for문을 돌려 체크된 값이 있는지를 확인한다.
		//체크된 카운트
		if (chk[i].checked == true) { //태그에 체크가 되었는지 확인
			cnt++ //체크수 증가
			console.log(cnt);
		}
	}
	if (cnt == 0) { // 체크수가 0이면
		alert("삭제할 게시글을 선택하세요");
		return false;

	}
	if(confirm("삭제할까요?")){
		form.action = "blackList_delete"
		form.submit();
	}
}	

	function go_page(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</head>
<body>
	<div>
		<h4>사용자관리</h4>
		<hr>
		<div>
			<form name="searchFrm" method="get">
				<input type="hidden" name="page" value="1"> <input
					name="searchKeyword" value="${boardVO.searchKeyword}" />
				<button type="submit">검색</button>
			</form>
		</div>
		<div>
		<form name="form">
			<table>
				<tr>
					<td></td>
					<td>아이디</td>
					<td>이메일</td>
					<td>상태</td>
				<tr>
					<c:forEach items="${blackList}" var="list1">
						<!-- 등급관리 전체조회 -->
						<tr>
							<td><input type="checkbox" name="td_checkbox" value="${list1.member_id }"></td>
							<td>${list1.member_id }</td>
							<td>${list1.member_email }</td>
							<td>${list1.list_date }</td>
						</tr>
					</c:forEach>
			</table>
			<button style="float:right;" type="button" onclick="td_delete()">삭제</button>		
		</form>
		</div>
		<my:paging paging="${paging}" />
		<br> <br> <br>
	</div>
</body>
</html>
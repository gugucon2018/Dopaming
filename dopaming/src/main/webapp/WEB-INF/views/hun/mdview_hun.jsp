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
	function goList(p) {
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

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
.thumb{
width:80px;
height:100px;
}
</style>
<body>
	<h1 align=center>${small}${big}</h1>

	<form name="searchFrm" method="get">
		<input type="hidden" name="page" value="1">
		<button style="float: right;">검색</button>
		<input type="text" name="searchKeyword" style="float: right;">
		<script>
			/* searchFrm.board_title.value='${FileVO.board_title}'; */
			searchFrm.board_title.value = '${FileVO.searchKeyword}';
		</script>


	</form>
	<br>
	<form action="mdview" name="form2">
		<input type="hidden" name="page" value="1"></input> <input
			type="hidden" name="category_small" value="${fileVO.category_small}">
		 <input type="hidden" name="category_big"
			value="${fileVO.category_big}"></input>
	</form>

	<table align="center">
		<tr>
			<td width="150px">게시판번호</td>
			<td width="200px" height="100px">썸네일</td>
			<td>제목</td>
			<td width="150px">용량(단위: MB)</td>
			<td width="150px">아이디</td>
		</tr>
		<c:forEach items="${list}" var="file">
			<tr>
				<td>${file.board_no}</td>
				<td><a
					href="filepost?board_no=${file.board_no}&member_id=${file.member_id}"><img
						class="thumb" src="${file.boardImg}"></a></td>
				<td><a
					href="filepost?board_no=${file.board_no}&member_id=${file.member_id}">
						${file.board_title}</a></td>
				<td>${file.file_storage}MB</td>
				<td>${file.member_id}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<button class="btn btn-primary btn-sm"
		onclick="location.href='fileUploadForm_Hwan'" style="float: right">자료
		올리기</button>
	<!-- 페이징버튼 -->
	<div align="center">
		<my:paging_joon paging="${paging}" jsfunc="goList" />
	</div>
</body>
</html>
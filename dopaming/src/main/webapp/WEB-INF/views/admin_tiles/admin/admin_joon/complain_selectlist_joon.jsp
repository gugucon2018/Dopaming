<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 페이징태그 스타일 */
.pagination {
	display: inline-block;
}

.pagination ul {
 	padding: 10px;
	margin: 0px;
}

.pagination li {
    display: inline-block; /* 페이징 가로효과 */
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
</style>
<!-- 전체선택을 하기 위해서는 자바스크립트는 포문을 써야하지만 jquery를 쓰면 배열을 자동으로 받아온다 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//페이징 기능(처음/끝 값을 보내준다.)
function goList(p){
	page_form.page.value = p;
	page_form.submit();
}
	
</script>
</head>
<body>
<!-- 페이징 값 보내는 폼(category_form) -->
<form name="page_form"><input type="hidden" name="page" value="1" />
<!-- 지정된 풀다운 메뉴를 고정시키기 -->
<script>
category_form.category_small.value='${boardListVO.category_small}';//BoardListVO에 정보를 가져온다.
category_form.searchKeyword.value='${boardListVO.searchKeyword}';//BoardListVO에 정보를 가져온다.
</script>
</form>

	<u><h3 align=center>${list[0].getComplain_type()}목록</h3></u><br>

	<table width="100%">
		<tr align="center">
			<td bgcolor="" width="200px">번호</td>
			<td bgcolor="">제목</td>
			<td bgcolor="">작성자</td>
			<td bgcolor="">날짜</td>
			<td bgcolor="">답변유무</td>
			<td bgcolor="">답변</td>
		</tr>

		<c:forEach items="${list}" var="i">
			<tr align="center">
				<td>${i.getRn()}</td>
				<td>${i.getComplain_title()}</td>
				<td>${i.getMember_id() }</td>
				<td>${i.getComplain_date() }</td>
				<td>${i.getComplain_check() }</td>
				<td><button type="button">답변완료</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
<!-- 페이징버튼 -->
<div align="center">
<my:paging_joon paging="${paging}" jsfunc="goList"/>
</div>
</body>
</html>
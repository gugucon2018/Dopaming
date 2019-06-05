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

#spann {
	float: right;
}
</style>
<script>
	function goList(p) {
		category_form.page.value = p;
		category_form.submit();
	}
</script>
</head>
<body>
	<div>
		<h1 style="text-align: center;">유저별 사용량</h1>
		<hr>
		<span id="spann">
			<div>
				<form name="searchFrm" method="get">
					아이디:<input type="hidden" name="page" value="1"> <input
						name="searchKeyword" value="${ChartVO.searchKeyword}" />
					<button class="btn btn-info" type="submit">검색</button>
				</form>
			</div>
		</span>
		<div>

			<form name="form">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<td>아이디</td>
							<td>다운로드횟수</td>
							<td>업로드횟수</td>
							<td>업로드용량</td>
							<td>등급</td>
						<tr>
					<thead>
					<tbody>
						<c:forEach items="${list}" var="list1">
							<tr>
								<td>${list1.MEMBER_ID}</td>
								<td>${list1.DOWN_COUNT}</td>
								<td>${list1.UPLOAD_COUNT}</td>
								<td>${list1.UPLOAD_STORAGE}M</td>
								<td>${list1.MEMBER_GRADE}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<div align="center">
			<my:paging_joon paging="${paging}" jsfunc="goList" />
		</div>
		<br> <br> <br>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<body>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<td>아이디</td>
			<tr>
		<thead>
		<tbody>
			<c:forEach items="${acornlist}" var="list">
				<tr>
					<td><a href="/dopaming/acorndetaillist?member_id=${list.member_id}">${list.member_id }</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
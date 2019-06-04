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
				<td>금액</td>
				<td>충전날짜</td>
				<td>결제코드</td>
			<tr>
		<thead>
		<tbody>
			<c:forEach items="${acorndetail}" var="list">
				<tr>
					<td>${list.member_id }</td>
					<td>${list.acorn_charge }</td>
					<td>${list.acorn_date }</td>
					<td><a href="./acornreturn?pay_code=${list.pay_code }">${list.pay_code }</a></td>
				
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
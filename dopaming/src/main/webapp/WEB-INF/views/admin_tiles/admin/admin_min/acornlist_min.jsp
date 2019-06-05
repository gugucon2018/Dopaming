<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<body>
	<h1 style="text-align: center;">환불처리<br></h1>
	<h4>조건<br>
	1.당일 0시~24시에 충전한 금액만 당일 환불가능(다음날넘어가면 환불불가)<br>
	2.남아있는아콘>현질아콘이어야함 <Br>(막사용해서 남아있는아콘<현질아콘이 되면 환불불가>)<br>
	(조건에 해당안되면 리스트자체가 안나옴)</h4> <hr>
<c:set var="now" value="<%=new java.util.Date()%>" />
<h1><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /> 충전했는 아이디들</h1>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<td>아이디</td>
			<tr>
		<thead>
		<tbody>
			<c:forEach items="${acornlist}" var="list">
				<tr>
					<td><a href="/dopaming/admin/acorndetaillist?member_id=${list.member_id}">${list.member_id }</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
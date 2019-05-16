<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %> --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty sessionScope.id }"> 
	${userName }님 환영합니다.
	<input type="button" onclick="location='logout'" value="로그아웃">
</c:if>
<c:if test="${empty sessionScope.id }"> 
	<a href="login">로그인</a>
</c:if>
</body>
</html>
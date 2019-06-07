<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
function go_page(p) {
	searchFrm.page.value = p;
	searchFrm.submit();
}

</script>
</head>
<body>
	<div class="px-3 py-5 bg-gradient-info text-white text-gray-100 p-3 bg-dark m-0" style="text-align: center; " ><h1>환불처리</h1></div>
	<div class="px-3 py-5 bg-gradient-success text-white"><h3>조건<br></h3>
	<h5>
	1.조건에 해당안되면 리스트자체가 안나옴<br>
	2.당일 0시~24시에 충전한 금액만 당일 환불가능(다음날 넘어가면 환불불가)<br>
	3.남아있는아콘>현질아콘이어야함 <Br>
	불가능한 예시<br>
	ex)남은아콘이 환불아콘보다 큰경우<br>
	</h5>
	</div> <hr>
<div style="text-align: center;">
<c:set var="now" value="<%=new java.util.Date()%>" />
<h1><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /> 충전했는 아이디들</h1>
</div>
<input type="hidden" name="page" value="1"> 
	<table class="table table-striped table-hover" style="text-align: center; font-size: 25px;" >
		<thead>
			<tr>
				<td>아이디(클릭시 세부사항으로 이동)</td>
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
	<div align="center">
		<my:paging paging="${paging}" />
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙으로 넘기기</title>
</head>
<body>
<h3>블랙리스트로 변경</h3>
<div >
<form action="${pageContext.request.contextPath }/blackInsert" method="post">
	이름<input type="text" name="member_id" value="${normal.member_id}" readonly/><Br>
	<!-- readonly(VO에 값은 들어가지만 수정은 불가능(disable, VO에 값이 안들어가서 아예 못함 -->
	내용<br>
	<div align="center">
	<textarea name="list_content" cols="90%" rows="10">${normla.list_content}</textarea>
	<Br>
	<span style="float:right">
	<button class="btn btn-primary">등록</button> 
	</span>     
	</div>        
</form>
</div>
</body>
</html>
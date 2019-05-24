<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="./resources/css/slider.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="container">
		<div class="joinmodal_resize">
			<div class="loginmodal_body">
				<div class="joinmodal_title">
					<h1>회원가입</h1>
				</div>
				<form:form role="form" commandName="memberVO" action="register">
					<!-- 아이디 -->
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-check"></i></span>
						<form:input path="member_id" type="text" class="form-control" placeholder="아이디" />
					</div>
					<div class="form-group">
						<form:errors cssStyle="color:red;" path="member_id" />
					</div>
					<!-- 비밀번호 -->
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password path="member_password" class="form-control" placeholder="비밀번호" />
					</div>
					<div class="form-group">
						<form:errors cssStyle="color:red;" path="member_password" />
					</div>
					<!-- 비밀번호 재확인 -->
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password path="check_passowrd" class="form-control" placeholder="비밀번호 확인" />
					</div>
					<div class="form-group">
						<form:errors cssStyle="color:red;" path="check_passowrd" />
					</div>
					<!-- 본인확인 이메일 -->
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
						<form:input path="member_email" type="email" class="form-control" placeholder="이메일" />
					</div>
					<div class="form-group">
						<form:errors cssStyle="color: red;" path="member_email" />
					</div>
					<div style="text-align: center;">
						<button class="btn btn-info" type="submit">가입</button>		
		    		    <button class="btn btn-primary" type="reset">취소</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slider.css">
<!-- 로그인 모달 -->
<div class="modal fade" id="modalLogin" role="dialog">
	<div class="modal-dialog cascading-modal modal-margin" role="document">
		<div class="modal-content loginmodal_resize">
			<div class="modal-body loginmodal_body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<img class="rounded-circle loginmodal_image" src="${pageContext.request.contextPath}/resources/images/hong/login.gif">
				<p class="loginmodal_title">Dopaming</p>
				<form id="loginForm" name="loginForm" method="post" action="${pageContext.request.contextPath}/loginA">
					<input class="loginmodal_loginid" type="text" name="member_id" placeholder="아이디 입력">
                    <input class="loginmodal_loginpass" type="password" name="member_password" placeholder="비밀번호 입력">
                    <div class="form-check">
	                    <label class="switch">
							<input type="checkbox" name="loginCheck" id="loginCheck">
							<span class="slider round"></span>
						</label>
						<label class="form-check-label" for="loginCheck">아이디 저장</label>
						<p class="forgot-password" id="recovery-password"><a href="#">비밀번호 찾기<a></p>
                    </div>
                    <button class="btn btn-primary loginmodal_loginbtn" type="submit">로그인</button>
                   	<div class="content_modalsocialwarp">
						<img src="${pageContext.request.contextPath}/resources/images/hong/google.png" class="content_socialicon" data="social-google">
						<img src="${pageContext.request.contextPath}/resources/images/hong/naver.png" class="content_socialicon" data="social-naver">
						<img src="${pageContext.request.contextPath}/resources/images/hong/facebook.png" class="content_socialicon" data="social-facebook"> 
						<img src="${pageContext.request.contextPath}/resources/images/hong/kakao.png" class="content_socialicon" data="social-kakao">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cookie.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="./resources/css/slider.css">
<!-- 로그인 모달 -->
<div class="modal fade" id="modalLogin" role="dialog">
	<div class="modal-dialog cascading-modal modal-margin" role="document">
		<div class="modal-content loginmodal_resize">
			<div class="modal-body loginmodal_body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<img class="rounded-circle loginmodal_image" src="./resources/images/hong/login.gif">
				<p class="loginmodal_title">Dopaming</p>
				<form id="loginForm" name="loginForm" method="post" action="loginA">
					<input class="loginmodal_loginid" type="text" name="member_id" placeholder="아이디 입력">
                    <input class="loginmodal_loginpass" type="password" name="member_password" placeholder="비밀번호 입력">
                    <div class="form-check">
	                    <label class="switch">
							<input type="checkbox" name="loginCheck" id="loginCheck">
							<span class="slider round"></span>
						</label>
						<label class="form-check-label" for="loginCheck">로그인 상태 유지</label>
						<label class="forgot-password"><a href="#">비밀번호 찾기<a></label>
                    </div>
                    <button class="btn btn-primary loginmodal_loginbtn" type="submit">로그인</button>
                   	<div class="content_modalsocialwarp">
						<img src="./resources/images/hong/google.png" class="content_socialicon" data="social-google">
						<img src="./resources/images/hong/naver.png" class="content_socialicon" data="social-naver">
						<img src="./resources/images/hong/facebook.png" class="content_socialicon" data="social-facebook"> 
						<img src="./resources/images/hong/kakao.png" class="content_socialicon" data="social-kakao">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 회원가입 모달 -->
<div class="modal fade" id="joinModal" role="dialog">
	<div class="modal-dialog cascading-modal modal-margin" role="document">
		<div class="modal-content joinmodal_resize">
			<div class="modal-body joinmodal_body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<p class="joinmodal_title">회원가입</p>
				<form id="joinForm">
					<input class="joinmodal_joinid" type="text" name="joinId" placeholder="아이디 입력">
                    <input class="joinmodal_joinpass" type="password" name="joinPassA" placeholder="비밀번호 입력">
                    <input class="joinmodal_joinpass" type="password" name="joinPassB" placeholder="비밀번호 재입력">
                    <input class="joinmodal_joinemail" type="email" name="joinEmail" placeholder="EXAMPLE@GMAIL.COM">
	                <div>
		                <button id="join-submit" class="btn btn-info joinmodal_joinbtn" type="button">회원가입</button>		
    		            <button class="btn btn-info validation_final" type="button">취소</button>		
	                </div>
                </form>
            </div>
		</div>
	</div>
</div>
<script src="./resources/js/modal.js"></script>
<script src="./resources/js/cookie.js"></script>
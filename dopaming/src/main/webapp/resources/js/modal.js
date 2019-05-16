var action = ''
var url = '';


$(document).ready(function () {
	//로그인 버튼 클릭
	$("#loginBtn").click(function(){
		$("#modalLogin").modal();
	});
	
	//회원가입 버튼 클릭
	$("#joinBtn").click(function(){
		$("#joinModal").modal();
	});
});
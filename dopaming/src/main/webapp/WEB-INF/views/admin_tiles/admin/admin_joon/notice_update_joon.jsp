<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//수정 기능
function notice_update(){
	alert("수정이 되었습니다."); // 확인창
	notice_update_frm.action = "notice_update";
	notice_update_frm.submit(); // 보낸다.
}

</script>
</head>
<body>
	
	<h3 align=center>공지사항-수정</h3>
	
	<!-- 수정할 데이터를 보내주는 폼 -->
	<form name="notice_update_frm" method="post">
	
	<!-- Notice_no가 필요가기 때문에 값을 받을 곳을 만들어둔다 -->
	<input type="hidden" name="notice_no" value="${notice.notice_no}">	
	
	공지제목 : <input type="text" id="notice_title" name="notice_title"   value="${notice.notice_title}" 
	style="width:100%; height:40px; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"> <br><br>
	
	공지내용 : <textarea id="notice_content" name="notice_content" 
	style="width:100%; height:500; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'">${notice.notice_content}</textarea><br><br>
	
	<button style="float:right;" type="button" class="" onclick="notice_update()">수정</button>
</form>
</body>
</html>
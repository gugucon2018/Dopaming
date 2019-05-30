<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//내용 입력 확인 기능
function notice_insert_btn(){
	//변수선언
	var chk = document.getElementById("notice_title").value; //단건 id찾기
	var chk2 = document.getElementById("notice_content").value; //단건 id찾기
	
	if (chk == '') { // 제목에 값이 없을시
		alert("제목을 입력하세요");
		return false;
	}
	else if(chk.length >= 20){
		alert("20 자 이내로 적어주세요");
		return false;
	}
	
	else if (chk2 == '') { // 내용 값이 없을시
		alert("내용을 입력하세요");
		return false;

	}
	else if(chk2.length >= 500){
		alert("500 자 이내로 적어주세요");
		return false;
	}
	
	alert("등록이 되었습니다."); // 확인창
	notice_frm.action = "notice_insert"
	notice_frm.submit();
}

</script>
</head>
<body>
	<h3 align=center>공지사항-등록</h3>
	
	<form name="notice_frm">
	공지제목 : <input type="text" id="notice_title" name="notice_title" 
	style="width:100%; height:40px; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"> <br><br>
	
	공지내용 : <textarea id="notice_content" name="notice_content" 
	style="width:100%; height:500; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"></textarea><br><br>
	
	<button style="float:right;" type="button" class="" onclick="notice_insert_btn()">등록</button>
	</form>

</body>
</html>
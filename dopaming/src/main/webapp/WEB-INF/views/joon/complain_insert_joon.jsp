<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//내용 입력 확인 기능
function complain_insert_btn(){
	//변수선언
	var chk = document.getElementById("complain_title").value; //단건 id찾기
	var chk2 = document.getElementById("complain_content").value; //단건 id찾기
	
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
	complain_insert_frm.action = "complain_insert"
	complain_insert_frm.submit();
}
</script>
</head>
<body>

<form name="complain_insert_frm">

<input type="hidden" name="board_no" value="${complainVO.board_no}"/>
	
	<h3 align=left><u>고객센터</u></h3>
	
	타입:<select name = "complain_type">
			<option value="신고">신고</option>
			<option value="건의">건의</option>
			<option value="qna">Q&A</option>
		</select><br>
		
	제목 : <input type="text" id="complain_title" name="complain_title" 
	style="width:100%; height:40px; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"> <br><br>
	
	내용 : <textarea id="complain_content" name="complain_content" 
	style="width:100%; height:500; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"></textarea><br><br>
	
	<button style="float:right;" type="button" class="" onclick="complain_insert_btn()">보내기</button>

</form>
</body>
</html>
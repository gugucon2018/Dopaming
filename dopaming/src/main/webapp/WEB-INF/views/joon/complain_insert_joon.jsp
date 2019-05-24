<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//입력되면 알림창을 띄운다
if("${complain_insert.complain_no}"== -1){
	alert("정상적으로 접수가 되었습니다.");
}

</script>
</head>
<body>
<form action="complain_insert" method="post">
	<h3 align=left><u>고객센터</u></h3>
	
	타입:<select name = "complain_type">
			<option value="신고">신고</option>
			<option value="건의사항">건의사항</option>
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
	
	<input style="float:right;" type="submit" class="" value="보내기"/>
	</form>
</body>
</html>
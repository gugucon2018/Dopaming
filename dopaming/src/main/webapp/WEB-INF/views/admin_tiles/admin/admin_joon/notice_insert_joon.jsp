<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
if("${notice_insert.notice_no}"== -1){
	alert("정상적으로 공지사항이 등록 되었습니다.");
}
</script>
</head>
<body>
	<h3 align=center>공지사항-등록</h3>
	
	<form action="notice_insert" method="post">
	공지제목 : <input type="text" id="notice_title" name="notice_title" 
	style="width:100%; height:40px; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"> <br><br>
	
	공지내용 : <textarea id="notice_content" name="notice_content" 
	style="width:100%; height:500; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"></textarea><br><br>
	
	<input style="float:right;" type="submit" class="" value="등록"/>
	</form>

</body>
</html>
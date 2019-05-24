<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//입력되면 알림창을 띄운다
if("${boardVO.seq}"== -1){
	alert('${boardVO.msg}');
}
</script>
</head>
<body>
<form action="claim_insert" method="post">
	<h3 align=left><u>고객센터</u></h3>
	
	타입:<select name = "menu" onchange="changeMenu()">
			<option value="report">신고</option>
			<option value="suggest">건의사항</option>
			<option value="qna">Q&A</option>
		</select><br>
		
	신고제목 : <input type="text" id="notice_title" name="notice_title" 
	style="width:100%; height:40px; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"> <br><br>
	
	신고내용 : <textarea id="notice_contents" name="notice_contents" 
	style="width:100%; height:500; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'"></textarea><br><br>
	
	<input style="float:right;" type="submit" class="btn btn-info" value="보내기"/>
	</form>
</body>
</html>
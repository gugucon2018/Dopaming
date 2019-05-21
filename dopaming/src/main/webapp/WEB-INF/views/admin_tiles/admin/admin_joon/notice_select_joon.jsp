<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	border-bottom: 1px solid;
	border-top: 1px solid;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//삭제 기능
function notice_delete(){
	if(confirm("삭제할까요?")){ // 확인기능
		form.action = "notice_delete" // 확인을 누르면 값을 notice_update->notice_delete로 변경한다.
		form.submit(); // 보낸다.
	}
}
</script>
</head>
<body>

<h1 align = "center"><u>공지사항</u></h1>

<!-- 보낼폼을 설정 -->
<form name="form" action="notice_update">

<!-- Notice_no가 필요가기 때문에 값을 받을 곳을 만들어둔다 -->
<input type="hidden" name="notice_no" value="${notice.getNotice_no()}">

<table width="100%" height = "40px">
        <tr>        
            <td bgcolor="gray" width="80p"  align="center">제목</td>
            <td align="center">${notice.getNotice_title()}</td>
            <td bgcolor="gray" width="80p"  align="center">글쓴이</td>
            <td width="200p"  align="center">관리자</td>
            <td bgcolor="gray" width="80p"  align="center">날짜</td>
            <td width="200p"  align="center">${notice.getNotice_date()}</td>     
        </tr>
        </table>
        <pre>
${notice.getNotice_content()}
</pre>
	<input style="float:right;" type="submit" class="" value="수정"/>
	<button style="float:right;" class="" type="button" onclick="notice_delete()">삭제</button>
</form>
	
</body>
</html>
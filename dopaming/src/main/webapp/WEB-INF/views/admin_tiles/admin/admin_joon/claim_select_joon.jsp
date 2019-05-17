<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3 align=left><u>고객센터</u></h3>
	
	유형: ${notice.notice_title}
	<table width="100%" height = "40px">
        <tr>        
            <td bgcolor="gray" width="80p"  align="center">제목</td>
            <td align="center">전체공지 사항입니다.</td>
            <td bgcolor="gray" width="80p"  align="center">글쓴이</td>
            <td width="200p"  align="center">허준혁</td>
            <td bgcolor="gray" width="80p"  align="center">날짜</td>
            <td width="200p"  align="center">오늘</td>     
        </tr>
        </table>
		
	
	내용 : <textarea id="notice_contents" name="notice_contents" 
	style="width:100%; height:500; background-color:ivory; border:1 solid blue; 
	font-family:굴림; font-size:10pt; color:red" onMouseOver="this.style.backgroundColor='yellow'" 
	onMouseOut="this.style.backgroundColor='ivory'">${notice.notice_contents}</textarea><br><br>
	
	<a href="../board/commentPost.jsp?board_no=${ i.getBoard_no()}">
	<button style="float:right;" type="button" class="btn btn-info">답변하기</button>
	</a>
</body>
</html>
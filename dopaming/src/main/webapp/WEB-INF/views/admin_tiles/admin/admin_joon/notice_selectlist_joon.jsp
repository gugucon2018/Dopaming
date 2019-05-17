<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//선택삭제 기능
function notice_delete(){
	//체크박스 입력 체크
	var chk = document.getElementsByName("board_no_d"); //태그찾기
	var cnt = 0; //태그의 배열
	for (i = 0; i < chk.length; i++) { //board_no_d그룹에서 체크된 값을 찾기위해 for문을 돌려 체크된 값이 있는지를 확인한다.
		//체크된 카운트
		if (chk[i].checked == true) { //태그에 체크가 되었는지 확인
			cnt++ //체크수 증가
		}
	}
	if (cnt == 0) { // 체크수가 0이면
		alert("삭제할 게시글을 선택하세요");
		return false;

	}
	if(confirm("삭제할까요?")){
		form.submit();
	}
}
//등록폼으로 이동

</script>
</head>
<body>

	<h3 align=left><u>공지사항 목록</u></h3>
	
	<table class="joon_table" border="1" width="100%">
		<tr align= "center" >
			<td bgcolor="" width="200px">
<label for="th_checkAll"><input type="checkbox" id="th_checkAll" onclick="checkAll();"/>번호</label>
			</td>
			<td bgcolor="">제목</td>
			<td width="200px" bgcolor="">날짜</td>
		</tr>
	
		<c:forEach items="${list}" var="i">
			<tr align = "center">
				<td><label for="${i.getRn()}"><input type="checkbox" name="board_no_d" id="${i.getRn()}" value="${ i.getNotice_no()}">${i.getRn()}</label></td>
				<td><a href=".jsp?notice_no=${ i.getNotice_no()}">
					${i.getNotice_title()}</a></td>
				<td>${i.getNotice_date()}</td>
			</tr>
		</c:forEach>
</table><br>
	
	<button style="float:right;" type="button" >공지사항 등록</button>
	<button style="float:right;" type="button" onclick="notice_delete()">삭제</button>

</body>
</html>
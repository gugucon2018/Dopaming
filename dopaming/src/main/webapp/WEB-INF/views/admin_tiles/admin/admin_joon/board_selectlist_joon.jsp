<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//풀다운메뉴 버튼
function changeMenu(){
		form2.a.value = document.getElementById("menu")[0].value
		form2.submit();
}

//검색 기능
function board_search(){
	var $textValue = document_getElementById("textValue").value;
	location.href="/smallProject/members/GetProduct_do?board_title=" + $textValue;
}

//페이징 기능
function goList(p){
	form2.p.value = p;
	form2.submit();
	
}

//삭제 기능
function PostDelete(){
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
//풀다운메뉴 초기값 설정
window.onload=function(){//바디실행후 작동
if('${param.a}'=='asc'){
	document.getElementsByName("menu")[0].selectedIndex=1;
	}
}
//체크박스 전체선택, 전체해제
function checkAll(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=board_no_d]").prop("checked", true);
      }else{
        $("input[name=board_no_d]").prop("checked", false);
      }
}
</script>
</head>
<body>
	<h3 align=left>
		<u>게시판 목록</u>
	</h3>
	<br>

	<select style="float: left;" id="menu" onchange="changeMenu()">
		<option value="movie">영화</option>
		<option value="drama">드라마</option>
		<option value="video">동영상</option>
		<option value="music">음악</option>
	</select>
	
	<form action="board_search" id="textValue" method="post" enctype="multipart/form-data">
		<button style="float: right;" type="button">검색</button>
		<input style="float: right;" type="text" value=""/>
	</form>
	<br>
	<br>

	<table width="100%">
		<tr align="center">
			<td bgcolor="gray" width="200px"><label for="th_checkAll"><input
					type="checkbox" id="th_checkAll" onclick="checkAll();" />번호</label></td>
			<td bgcolor="gray">제목</td>
			<td width="200px" bgcolor="gray">작성자</td>
			<td width="200px" bgcolor="gray">분류</td>
			<td width="200px" bgcolor="gray">게시날짜</td>
		</tr>

		<c:forEach items="${list}" var="i">
			<tr align="center">
				<td><label for="${i.getRn()}"><input type="checkbox"
						name="board_no_d" id="${i.getRn()}" value="${ i.getBoard_no()}">${i.getRn()}</label></td>
				<td><a
					href="../board/commentPost.jsp?board_no=${ i.getBoard_no()}">
						${i.getBoard_no() }</a></td>
				<td>${i.getTitle()}</td>
				<td>${i.getUser_code() }</td>
			</tr>
		</c:forEach>
	</table>
	<br>

	<button style="float: right;" class="btn btn-info" type="button" onclick="notice_delete()">삭제</button>
</body>
</html>
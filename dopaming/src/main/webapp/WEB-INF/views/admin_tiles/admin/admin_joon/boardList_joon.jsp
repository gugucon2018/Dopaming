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
//페이징 기능(처음/끝 값을 보내준다.)
function goList(p){
	form2.page.value = p;
	form2.submit();
}
</script>
</head>
<body>

<h3 align=center><u>게시판 목록</u></h3><br>

<select style="float: left;" id="menu" onchange="changeMenu()">
		<option value="영화">영화</option>
		<option value="드라마">드라마</option>
		<option value="동영상">동영상</option>
		<option value="음악">음악</option>
	</select>

<!-- 페이징 값 보내는 폼(form2) -->
<form action = "boardList" name="form2">
	<input type="hidden" name="page" value="1"></input>
</form>

	<table class="joon_table" border="1" width="100%">
		<tr align= "center" >
			<td bgcolor="">번호</td>
			<td bgcolor="" width="200px">
				<label for="td_checkAll">제목</label>
			</td>
			<td bgcolor="">아이디</td>
			<td bgcolor="">대분류</td>
			<td width="200px" bgcolor="">소분류</td>
		</tr>
		
<!-- db에서 가져온 자료를 forEach로 반복해서 가져온다.	 -->		
<c:forEach items="${list}" var="i">
<!-- Notice_no가 필요하기 때문에 값을 받을 곳을 만들어둔다 -->
<input type="hidden" name="board_no" value="${i.getBoard_no()}">

			<tr align = "center">
				<td>${ i.getRn()}</td>
				<td><a href="/dopaming/notice_select?notice_no=${ i.getBoard_no()}">
					${ i.board_title}</a></td>
				<td>${ i.getMember_id()}</td>
				<td>${ i.getCategory_big()}</td>	
				<td>${ i.getCategory_small()}</td>
			</tr>
</c:forEach>
</table><br>

<!-- 페이징버튼 -->
<my:paging_joon paging="${paging}" jsfunc="goList"/>
</body>
</html>
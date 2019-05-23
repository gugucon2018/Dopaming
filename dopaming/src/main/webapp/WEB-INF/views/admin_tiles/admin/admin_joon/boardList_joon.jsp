<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.pagination {
	display: inline-block;
}

.pagination ul {
	display: inline-block;
	padding: 10px;
	margin: 0px;
}

.pagination li {
	display: inline-block;
	padding: 10px;
}

.active {
	color: red;
}

a {
	text-decoration: none;
}

* {
	box-sizing: border-box;
}
td {
	border-bottom: 1px solid;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//페이징 기능(처음/끝 값을 보내준다.)
function goList(p){
	form2.page.value = p;
	form2.submit();
}

//풀다운기능
function changeMenu(){
		form2.category_small.value = document.getElementsByName("category_small")[0].value
		form2.submit();
}

/* //풀다운메뉴 초기값 설정
window.onload=function(){//바디실행후 작동
if('${param.a}'=='asc'){
	document.getElementsByName("category_small")[0].selectedIndex=1;
	}
} */
</script>
</head>
<body>

<h3 align=center><u>게시판 목록</u></h3><br>

<select style="float: left;" name="category_small" onchange="changeMenu()">
		<option value="">전체</option>
		<option value="최신">최신</option>
		<option value="국내">국내</option>
		<option value="외국">외국</option>		
</select>

<!-- 지정된 풀다운 메뉴를 고정시키기 -->
<script>
document.getElementsByName("category_small")[0].value='${BoardListVO.category_small}';
</script>
	
<!-- 검색창 -->
<form action="board_search" id="textValue" method="post" enctype="multipart/form-data">
<span>
	<button style="float: right;" type="button">검색</button>
	<input style="float: right;" type="text" value=""/>
</span>
</form>
<br> 

<!-- 페이징 값 보내는 폼(form2) -->
<form action = "boardList" name="form2">
	<input type="hidden" name="page" value="1"></input>
	<input type="hidden" name="category_small" value="${i.category_small}">
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
<!-- board_no가 필요하기 때문에 값을 받을 곳을 만들어둔다 -->
<input type="hidden" name="board_no" value="${i.getBoard_no()}">
		
			<tr align = "center">
				<td>${ i.getRn()}</td>
				<td><a href="/dopaming/filepost?board_no=${ i.getBoard_no()}">
					${ i.board_title}</a></td>
				<td>${ i.getMember_id()}</td>
				<td>${ i.getCategory_big()}</td>	
				<td>${ i.getCategory_small()}</td>
			</tr>
</c:forEach>
</table>

<!-- 페이징버튼 -->
<div align="center">
<my:paging_joon paging="${paging}" jsfunc="goList"/>
</div>
</body>
</html>
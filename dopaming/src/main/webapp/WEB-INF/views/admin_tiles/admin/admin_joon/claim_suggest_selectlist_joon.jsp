<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 전체선택을 하기 위해서는 자바스크립트는 포문을 써야하지만 jquery를 쓰면 배열을 자동으로 받아온다 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	//페이징 기능
	function goList(p) {
		form2.p.value = p;
		form2.submit();
	}
	//함수들 동작
	$(function() {
		answer_update();
	});
	//답변완료 기능
	function answer_update() {
		$('.btnUpdate').on('click', function() {
			var claim_no = $(this).closest('tr').find('checkbox').val();
			$.ajax({
				url : 'users/', //컨트롤러에 리퀘스트 매핑값
				data : {
					claim_no : claim_no
				},
				dataType : 'json',
				error : function(xhr, status, msg) { //에러시 발동
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(xhr) {
					console.log(xhr.result);
				}
			}); //아작스   
		}); // 답변하기 버튼
	} //answer_update
</script>
</head>
<body>

	<h3 align=left>
		<u>건의 목록</u>
	</h3>

	<table width="100%">
		<tr align="center">
			<td bgcolor="gray" width="200px"><label for="th_checkAll"><input
					type="checkbox" id="th_checkAll" onclick="checkAll();" />번호</label></td>
			<td bgcolor="gray">제목</td>
			<td width="200px" bgcolor="gray">작성자</td>
			<td width="200px" bgcolor="gray">날짜</td>
			<td width="200px" bgcolor="gray">답변유무</td>
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
				<td><input class="btnUpdate" type="button" value="답변완료" /></td>
			</tr>
		</c:forEach>
	</table>
	<br>

</body>
</html>
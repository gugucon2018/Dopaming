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
//수정폼으로 보내기

</script>
</head>
<body>
<u><h1 align = "center">공지사항</h1></u>
<form>
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
        <pre>
 ㅁㄴㄴㅁ아러낭ㄴ
           ㄴ마어러낭리나멀아ㅣㄴㅇㅁ
           ㅏㄴ마어림나어리ㅓ낭ㅁㄹ
           ㄹㄴ머ㅏㅣㄴ얼나얼
           ㅁㄴ아ㅣㅓㄻ나이ㅓ리낭머린ㅁ
           ㅏㅓㄴㅇㅁ리ㅏㅓㄴ이ㅏ런ㅁ
           ㅁ나이런머랑
</pre>
	<input style="float:right;" type="submit" class="" value="수정"/>
</form>
	<button style="float:right;" class="btn btn-info" type="button" onclick="notice_delete()">삭제</button>
</body>
</html>
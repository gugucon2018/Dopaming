<%@page import="com.dopaming.www.common.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 다운로드</title>
<style>
.cen_table {
	margin: 0 auto;
}

table {
	width: 550px;
}

td {
	padding: 10px;
	border: 1px solid #666666;
}

th {
	padding: 10px;
	border: 1px solid #666666;
	background: #819FF7;
	color: #fff;
}
/* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.no_border {
	border: 0px;
}

.write_on {
	float: right;
}
</style>
<script>
	function ajaxExample() {
		$.ajax({
			"url" : "/request_download",
			"type" : "get",
			"dataType" : "json",
			"data" : {
				"dataType" : init
			},
			"success" : function(data) {
				alert("가져온 데이터 입니다." + data);
			}
		});
	}
	
	$(".btnDown").click(function(){
		//var url="'request_download?group_no=${downPost.group_no}'",
		$.ajax({
			url:"request_download",
			type:"GET",
			datatype: JSON,
			data: JSON.stringify({
				group_no : ${downPost.group_no}
			})				
			success:function(args){
				alert("다운로드 요청 성공");
			}
			error:function(e){
				alert("다운로드 요청 실패");
			}
		});
	});
</script>
</head>
<body>
	<div class="container cen_form">
		<form>
			<table class="cen_table table table-striped table-bordered">
				<tr>
					<th><label class="cel1">다운로드 위치 지정</label></th>
					<th><input placeholder="다운로드 위치" /></th>
					<th><button class="btn btn-danger btn-sm">다운로드 하기</button></th>
				</tr>
				<tr>
					<td>다운로드 아콘</td>
					<td>회원아이디</td>
					<td>결제 날짜</td>
				</tr>
				<tr>
					<td>${downPost.board_acorn}</td>
					<td>${downPost.member_id}</td>
					<td><label><%=DateUtil.tDateFormat()%></label></td>
				</tr>
				<tr>
					<td colspan="3">
						<ol>다운로드 항목들
						</ol> <c:forEach items="${downPost_List}" var="list">
							<li>${list.file_name}</li>
						</c:forEach>
						</ol>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="progress">
							<div class="progress-bar progress-bar-striped active"
								role="progressbar" aria-valuenow="70" aria-valuemin="0"
								aria-valuemax="100" style="width: 70%">70%</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-right: none;"></td>
					<td colspan="2" class="cen_table" style="border-left: none;">
						<!-- <button type="button" class="btn btn-success btn-md"
							onclick="location.href='request_download?group_no=${downPost.group_no}'">다운로드
							하기</button>-->
						<button type="button" class="btn btn-success btn-md btnDown" >다운로드 하기</button>&nbsp;
						<button class="btn btn-success btn-md">취소 하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
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
	$(function(){
			fileDownload();
	});
	
	// 다운로드 요청 ==> json 
	function fileDownload() {
		$('#btnDown').on('click',function(){
			var id=$('input:text[name="id"]').val();
			var name=$('$input:text[name="name"]').val();
			$.ajax({
				url:"request_download",
				type:"get",
				dataType:"json",
				data:JSON.stringify({}),
				contentType:'application/json',
				mimeType:'application/json',
				success:function(data){
					alert("status: "+status+" er:"+message);
				},
				error:function(xhr, status, message){
					alert("status: "+status+" er:"+message);
				}				
			});			
		});		
	}
</script>
</head>
<body>
	<div class="container cen_form">
		<form>
			<table class="cen_table table table-striped table-bordered">
				<tr>
					<th>다운로드 아콘</th>
					<th>회원 아이디</th>
					<th>결제 날짜</th>
				</tr>
				<tr>
					<td>${downPost.board_acorn}</td>
					<td><label>${sessionScope.Id}</label></td>
					<td><label><%=DateUtil.tDateFormat()%></label></td>
				</tr>
				<tr>
					<td colspan="3">
						<ol>다운로드 항목들
						<c:forEach items="${downPost_List}" var="list">
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
						<button type="button" class="btn btn-success btn-md"
							onclick="location.href='request_download?group_no=${downPost.group_no}'">다운로드
							하기</button>
						<!-- <button type="button" id="btnDown" class="btn btn-success btn-md btnDown" >다운로드 하기</button>&nbsp; -->
						<button class="btn btn-success btn-md">취소 하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
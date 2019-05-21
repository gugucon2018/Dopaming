<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .table > thead {
      background-color: #b3c6ff;
    }

.no_border{
	border: 0px;
}
.write_on{
	float:right;
}
</style>
</head>
<body>
<div class="container cen_form">
<form>
	<table class="cen_table table table-striped table-bordered">
		<tr>
			<th><label class="cel1">다운로드 위치 지정</label></th>
			<th><input placeholder="다운로드 위치"/></th>
			<th><button class="btn btn-danger btn-sm">다운로드 하기</button></th>
		</tr>
		<tr>
			<td>다운로드 번호</td>
			<td>다운로드 아콘</td>
			<td>회원아이디</td>
		</tr>
		<tr>
			<td>100</td>
			<td>210</td>
			<td>홍길동</td>
		</tr>
		<tr>
			<td colspan="3">
				<ol>다운로드 항목들
				<li>파일명</li>
				<li>파일명2</li>
				</ol>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<div class="progress">
  				<div class="progress-bar progress-bar-striped active" role="progressbar"	
  					aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
    				70%
    			</div>
  			</div>
  			</td>			
		</tr>
		<tr>	
			<td style="border-right:none;"></td>			
			<td colspan="2" class="cen_table" style="border-left:none;">
				<button class="btn btn-success btn-md">다운로드 하기</button>&nbsp;
				<button class="btn btn-success btn-md">취소 하기</button>
			</td>
		</tr>		
	</table>
</form>
</div>
</body>
</html>
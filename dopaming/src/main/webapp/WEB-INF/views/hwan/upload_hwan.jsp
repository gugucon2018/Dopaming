<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Custom styles for this template -->
<link href="./resources/fontawesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./resources/js/ie-emulation-modes-warning.js"></script>
<script src="./resources/ckeditor/ckeditor.js"></script>
<title>자료 업로드</title>
<!-- <script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script> -->
<style>
.cen_table {
	margin: 0 auto;
}

table {
	width: 500px;
}

td {
	padding: 10px;
	border: 1px solid #666666;
	background: #A9F5D0;
}

th {
	padding: 10px;
	border: 1px solid #666666;
	color: #fff;
}
/* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.no_border {
	border: 0px;
	background: #FFFFFF;
}

.write_on {
	float: right;
}
textarea{
	margin-left:85px;
}
</style>
</head>
<body>
	<div class="cen_form">
		<form class="container" action="request_upload" method="post" enctype="multipart/form-data">
			<table class="cen_table table table-striped table-bordered">
				<tr>
					<td>제목<br> <input id="title" size="20" placeholder="제목입력"/></td>
					<td>회원아이디<br> <input id="member" size="20" placeholder="아이디입력"/></td>
					<td>파일추가<br><input multiple="multiple" type="file" size="20"/> </td>
					<td>파일용량<br> <label>100</label></td>
					<td>업로드날짜<br> <label>2019</label></td>
				</tr>
				<tr>
					<td colspan="3"><select class="form-control">
							<option>영화</option>
							<option>드라마</option>
							<option>동영상</option>
							<option>음악</option>
					</select> <select class="form-control">
							<option>최신</option>
							<option>국내</option>
							<option>외국</option>
					</select>										
					</td>
					<td colspan="2">
						게시글아콘<br>
						<input placeholder="아콘값 입력"/>						
					</td>
				</tr>
				<tr>
					<td class="no_border" colspan="6">
						<div class="row justify-content-md-center">
							<div style="margin-bottom: 30px">
								<div class="input-group cen_table">
									<textarea class="form-control" id="p_content"></textarea>
									<script>
  								CKEDITOR.replace('p_content', {
  									uiColor:'#9AB8F3',
  									filebrowserUploadUrl:'<%=request.getContextPath()%>/resources/ckeditor/fileUpload.jsp'
														});
									</script>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="6">
    						<textarea rows="5" cols="130">	    
						</textarea><br>						
						<button type="submit" class="btn btn-danger btn-danger pull-right">업로드 하기</button>										
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
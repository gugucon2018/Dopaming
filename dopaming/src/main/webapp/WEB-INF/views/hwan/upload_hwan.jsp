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
	width: 550px;
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
    .table > thead {
      background-color: #b3c6ff;
    }

.no_border{
	border: 0px;
	background: #FFFFFF;
}
.write_on{
	float:right;
}
</style>
</head>
<body>
<div class="container cen_form" >
<form>
  <table class="cen_table table table-striped table-bordered">
  	<tr>
    <td><label for="title">글 제목 </label>
    <input type="text" class="form-control" size="30" id="title" placeholder="제목을 입력하세요"></td>
  	</tr>
    <tr>
    <td><label for="money">올릴 아콘</label>
    <input type="text" class="form-control" size="30" id="money" placeholder="올릴 아콘을 입력하세요"></td>
  	</tr>
  	<tr>  
  		<td>		
  			<div class="content" style="width: 70%">
  				<div class="row justify-content-md-center">
  					<div class="col-sm-9">
  						<div class="input-group-prepend">
  							<label class="input-group-text">제목</label>  							  						
  						</div>
  						<input type="text" class="form-control">
  					</div>
  					<div class="col-sm-3">
  						<div class="input-group mb-3">
  							<select class="custom-select" id="inputGroupSelect03">
  								<option selected>분류</option>
  								<option value="1">영화</option>
  								<option value="2">드라마</option>
  								<option value="3">동영상</option>
  								<option value="4">음악</option>
  							</select>  						
  						</div>
  					</div>
  				</div>
  			</div>
  			</td>
  		</tr>
  		<tr>
  		<td class="no_border">  				
  		<div class="row justify-content-md-center">
  			<div style="margin-bottom:30px">
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
  		<td>
    <label for="S_file">파일 찾아보기</label>
    <input type="file" id="S_file">
  		</td>
  </tr>
  <tr>
  <td><button type="submit" class="btn btn-default">제출</button></td>
  </tr>
</table>
</form>
</div>

</body>
</html>
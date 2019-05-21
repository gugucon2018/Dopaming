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
				<tr>
					<td colspan="6">					       
    					 <input type="file" class="afile3 multi with-preview" />
						 <div id="afile3-list" style="border:2px solid #c9c9c9;min-height:50px"></div>			
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	<!--CDN방식-->
	<script src="jQuery.MultiFile.min.js" type="text/javascript" language="javascript"> </script>	
	<script>	  
	        $(function(){ // wait for page to load
                    $('input.afile3').MultiFile({
            max: 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
            accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
            maxfile: 1024, //각 파일 최대 업로드 크기
            maxsize: 3024,  //전체 파일 최대 업로드 크기
            STRING: { //Multi-lingual support : 메시지 수정 가능
                remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
                duplicate : "$file 은 이미 선택된 파일입니다.", 
                denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
                 selected:'$file 을 선택했습니다.', 
                toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
                toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
                toobig: "$file 은 크기가 매우 큽니다. (max $size)"
            },
            list:"#afile3-list" //파일목록을 출력할 요소 지정가능

            //각각의 이벤트에 따라 스크립 처리를 할수있다.
            /*
            ,onFileRemove: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileRemove - ' + value + '</li>')
            },
            afterFileRemove: function(element, value, master_element) {
              $('#afile3-list').append('<li>afterFileRemove - ' + value + '</li>')
            },
            onFileAppend: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileAppend - ' + value + '</li>')
            },
            afterFileAppend: function(element, value, master_element) {
              $('#afile3-list').append('<li>afterFileAppend - ' + value + '</li>')
            },
            onFileSelect: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileSelect - ' + value + '</li>')
            },
            afterFileSelect: function(element, value, master_element) {
              $('#afile3-list').append('<li>afterFileSelect - ' + value + '</li>')
            },
            onFileInvalid: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileInvalid - ' + value + '</li>')
            },
            onFileDuplicate: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileDuplicate - ' + value + '</li>')
            },
            onFileTooMany: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileTooMany - ' + value + '</li>')
            },
            onFileTooBig: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileTooBig - ' + value + '</li>')
            },
            onFileTooMuch: function(element, value, master_element) {
              $('#afile3-list').append('<li>onFileTooMuch - ' + value + '</li>')
            }
            */

          });

        });
        </script>	
</body>
</html>
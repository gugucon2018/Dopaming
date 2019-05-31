<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	//페이징 기능
	function goList(p) {
		form2.page.value = p;
		form2.submit();
	}
</script>
<title>파일 게시글</title>
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
<script type="text/javascript">
$(document).ready(function(){
	$(".ComBtn").click(function(){		
//		$.ajax({
//			url:"/comment_hwan",
//			data:$(".ComContent").val(),
//			dataType:"json",			
//			success: function(data){
/* 				var show="";
				$.each(data, function(index, item){
					show+="<tr><td>"+(index+1)+"</td>";
					show+="<td>"+item.name+"</td>";
					show+="<td>"+item.age+"</td>";
					show+="<td>"+item.loc+"</td></tr>";
				});
				$(".lastTr").append(show); */
//				console.log('ㅎㅎㅎㅎ');				
//			}
//		});		
		var show="";		
		show+="<tr colspan='6'>";
		show+="<td>"++"</td>";
		show+="</tr>";
		$(".lastTr").after(show); 
	});	
});
</script>
</head>
<body>
	<div class="container">
	<table class="cen_table  table table-striped table-bordered">
		<tr>
			<th width="10%">게시글 번호</th><th class="c1">분류</th><th>제목</th><th>캐시</th><th>용량(MB)</th><th>판매자</th>	
		</tr>
		<tr>
			<td>${filePost.board_no}</td>
			<td class="c1">${filePost.category_big}/${filePost.category_small}</td>
			<td>${filePost.board_title}</td>
			<td>${filePost.board_acorn}</td>
			<td>${filePost.board_file_storage}MB</td>
			<td>${filePost.member_id}</td>	
		</tr>		
		<tr>
			<td>게시글 파일</td>
			<td colspan="5">
				<c:forEach items="${Board_FileList}" var="list">
					<label>${list.fileName_List}</label><br>					
				</c:forEach>
			</td>
		</tr>
		<tr>
		<td colspan="6" class="no_border">
		<label>${filePost.board_img}<br>${filePost.board_content}</label>		
  	 </td>
		</tr>
		<tr>
		<td colspan="6" class="no_border">
			 <table class="cen_table table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="10%">작성자</th>
            <th width="20%">대장르</th>
            <th width="10%">소장르</th>
          </tr>
        </thead>
        <tbody>   
        <form name="searchFrm" method="get">
        <input type="hidden" name="page" value="1">
        <input type="text" name="member_id">
        	<script>
        		searchFrm.member_id.value='${FilePostVO_Hwan.member_id}';
        	</script>        
        </form>    	
        <form action="filepost?member_id=${filePost.member_id}" name="form2">
		<input type="hidden" name="page" value="1"></input> 
		</form>
          	<c:forEach items="${Board_List_Hwan}" var="flist">
          		<tr>
          		<td>${flist.board_no}</td>
          		<td><a href="filepost?board_no=${flist.board_no}&member_id=${flist.member_id}">${flist.board_title}</a></td>
          		<td>${flist.member_id}</td>
          		<td>${flist.category_big}</td>
          		<td>${flist.category_small}</td>
          		</tr>
          	</c:forEach>          
        </tbody>
    </table>
	<!-- 페이징버튼 -->
	<my:paging_joon paging="${paging}" jsfunc="goList" />
		</td>
		</tr>
		<tr>
			<td colspan="6" class="no_border">
           <div>            
            <button href='#' onclick="location.href='download_hwan?group_no=${filePost.board_no}'" class="btn btn-success write_on">다운로드 하기</button>            
           </div>
           	</td>
		</tr>
		<tr class="lastTr">
			<td colspan="6" class="no_border">
			      <div>
      					<input  width="100%" class="ComContent" placeholder="댓글쓰기">
      					<button type="button" class="btn btn-success ComBtn">댓글 쓰기</button>
				 </div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
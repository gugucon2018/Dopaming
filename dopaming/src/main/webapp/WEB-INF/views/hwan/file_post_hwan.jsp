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
</head>
<!-- 
제목 
회원 아이디
카테고리대제목
카테고리소제목
게시글내용
게시글 이미지 ===> null 허용
게시글 아콘 ====> null 허용

파일명
파일확장자
파일용량
업로드날짜
 -->
<body>
	<div class="container">
	<table class="cen_table  table table-striped table-bordered">
		<tr>
			<th class="c1">분류</th><th>캐시</th><th>용량(MB)</th><th>판매자</th>	
		</tr>
		<tr>
			<td class="c1">${filePost.category_big}/${filePost.category_small}</td><td>${filePost.board_acorn}</td><td>${filePost.board_file_storage}MB</td><td>${filePost.member_id}</td>	
		</tr>		
		<tr>
			<td>게시글 파일</td><td colspan="3"></td>
		</tr>
		<tr>
		<td colspan="5" class="no_border">
		<label>${filePost.board_img}<br>${filePost.board_content}</label>		
  	 </td>
		</tr>
		<tr>
		<td colspan="4" class="no_border">
			 <table class="cen_table table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="10%">작성자</th>
            <th width="20%">작성일</th>
            <th width="10%">조회</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="article" items="${articles}" varStatus="status">
            <tr>
              <td>${article.articleNumber}</td>
              <td id="title">
                <c:if test="${article.depth > 0}">
                  &nbsp;&nbsp;
                </c:if>
                <a href="/bbs/content.bbs?articleNumber=${article.articleNumber}&pageNum=${pageNum}">${article.title}</a>
                <c:if test="${article.hit >= 20}">
                  <span class="hit">hit!</span>
                </c:if>
              </td>
              <td>${article.id}</td>
              <td>${article.writeDate}</td>
              <td>${article.hit}</td>
            <tr>
          </c:forEach>
        </tbody>
    </table>
          <!-- Paging 처리 -->
      <div id="paging">
        ${pageCode}
      </div>
		</td>
		</tr>
		<tr>
			<td colspan="4" class="no_border">
           <div>            
            <a href='#' onClick='fn_write()' class="btn btn-success write_on">다운로드 하기</a>            
           </div>
           	</td>
		</tr>
		<tr>
			<td colspan="4" class="no_border">
			      <div>
      					<input  width="100%" placeholder="댓글쓰기">
      					<button class="btn btn-success">댓글 쓰기</button>
				 </div>
			</td>
		</tr>
	</table>
</div>


</body>
</html>
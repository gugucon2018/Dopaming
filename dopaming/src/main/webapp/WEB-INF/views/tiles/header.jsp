<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.32.2/sweetalert2.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.32.2/sweetalert2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 메시지 세션 -->
<c:if test="${sessionScope.message ne null}">
	<script>
	  $(document).ready(function() {
	      sessionMessage();
	      
	      function sessionMessage() {
	          var message = "${sessionScope.message}";
	          
	          if (message != '') {
	              Swal({
	                  position: 'top-end',
	                  type: 'success',
	                  title: message,
	                  showConfirmButton: false,
	                  timer: 1500
	              })
	          }
	      }
	  });
	</script>
	<c:remove var="message" scope="session" />
</c:if>
<!-- 에러 세션 -->
<c:if test="${sessionScope.error ne null}">
	<script>
	  $(document).ready(function() {
	      sessionError();
	      function sessionError() {
	          var error = "${sessionScope.error}";
	          if (error != '') {
	              Swal({
	                  position: 'top-end',
	                  type: 'error',
	                  title: error,
	                  showConfirmButton: false,
	                  timer: 1500
	              })
	          }
	      }
	  });
	</script>
	<c:remove var="error" scope="session" />
</c:if>
</head>
<div class="container-fluid">
	<div class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a class="navbar-brand" href="#">아콘충전</a></li>
					<li><a class="navbar-brand" href="#">쪽지</a></li>
					<li><a class="navbar-brand" href="complain_selectlist_nomal?complain_type=qna">고객센터</a></li>
					<li><a class="navbar-brand" href="loginForm">(임시)관리자로그인페이지</a></li>
					<li><a class="navbar-brand" href="notice_selectlist_nomal">공지사항</a></li>
				</ul>
				<ul class="nav navbar-nav navber-right">
					<c:choose>
						<%-- 로그인 안 한 상태 --%>
						<c:when test="${sessionScope.memberSession eq null || sessionScope.Id eq 'admin'}">
							<li><a class="navbar-brand" id="loginBtn" data-toggle="modal">로그인</a></li>
							<li><a class="navbar-brand" id="joinBtn" onclick="location='register'">회원가입</a></li>
						</c:when>
						<%-- 로그인한 상태 --%>
						<c:otherwise>
							<li><a class="navbar-brand" href="#">회원정보 수정</a></li>
							<li><button onclick="location='logoutA'" class="btn btn-primary btn-sm">로그아웃</button></li>
						</c:otherwise>
					</c:choose>					
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<!--배너 -->
	<div class="jumbotron">
		<div class="container">
			<div class="form-inline" role="form"></div>
		</div>
	</div>
	<!--탭-->
	<div class="navbar navbar-inverse col-xs-12 col-md-12 col-lg-12">
		<div class="">
			<div class="navbar-header">
				<a class="navbar-brand" href="/dopaming">Dopaming</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">영화<span class="caret"></span></a>
						<ul class="dropdown-menu"><li>
							<a href="mdview?category_big=영화">전체영화</a></li>
							<li class="divider"></li>
							<li><a href="mdview?category_small=국내&category_big=영화">국내영화</a></li>
							<li><a href="mdview?category_small=외국&category_big=영화">외국영화</a></li>
							<li class="divider"></li>
							<li><a class="disabled">최신영화</a></li>
							<li class="divider"></li>
							<li><a href="#">국내영화</a></li>
							<li><a href="#">외국영화</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">드라마<span class="caret"></span></a>
						<ul class="dropdown-menu">
							
							<li><a href="mdview?category_big=드라마">전체드라마</a></li>
							<li class="divider"></li>
							<li><a href="mdview?category_small=국내&category_big=드라마">국내드라마</a></li>
							<li><a href="mdview?category_small=외국&category_big=드라마">외국드라마</a></li>
							<li class="divider"></li>
							<li><a class="disabled">최신드라마</a></li>
							<li class="divider"></li>
							<li><a href="#">국내드라마</a></li>
							<li><a href="#">외국드라마</a></li>							
						</ul></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">동영상<span class="caret"></span></a>
						<ul class="dropdown-menu">							
							<li><a href="mdview?category_big=동영상">전체동영상</a></li>
							<li class="divider"></li>
							<li><a href="mdview?category_small=국내&category_big=동영상">국내동영상</a></li>
							<li><a href="mdview?category_small=외국&category_big=동영상">외국동영상</a></li>
							<li class="divider"></li>
							<li><a class="disabled">최신동영상</a></li>
							<li class="divider"></li>
							<li><a href="#">국내동영상</a></li>
							<li><a href="#">외국동영상</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">음악<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="mdview?category_big=음악">전체음악</a></li>
							<li class="divider"></li>
							<li><a href="mdview?category_small=국내&category_big=음악">국내음악</a></li>
							<li><a href="mdview?category_small=외국&category_big=음악">외국음악</a></li>
							<li class="divider"></li>
							<li><a class="disabled">최신음악</a></li>
							<li class="divider"></li>
							<li><a href="#">국내음악</a></li>
							<li><a href="#">외국음악</a></li>
							
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</div>
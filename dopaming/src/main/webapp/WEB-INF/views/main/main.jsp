<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page session="false"%>
<!-- 웹페이지언어 설정 -->
<html>
<head>
<title>도파밍 프로젝트</title>
</head>
<body>
	<div class="container col-sm-8">
		<div class="container col-sm-12">
			<div id="genreCarousel" class="carousel slide" data-ride="carousel"
				data-interval="3000">
				<ol class="carousel-indicators">
					<li data-target="#genreCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#genreCarousel" data-slide-to="1" class="active"></li>
					<li data-target="#genreCarousel" data-slide-to="2" class="active"></li>
					<li data-target="#genreCarousel" data-slide-to="3" class="active"></li>
					<li data-target="#genreCarousel" data-slide-to="4" class="active"></li>
					<li data-target="#genreCarousel" data-slide-to="5" class="active"></li>
					<li data-target="#genreCarousel" data-slide-to="6" class="active"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<c:forEach items="${slide1}" var="s" varStatus="status">
						<div class="item <c:if test="${status.index eq 0}">active</c:if>">
							<a
								href="filepost?board_no=${s.BOARD_NO}&member_id=${s.MEMBER_ID}"><img
								src="${s.BOARD_IMG}" alt="로고1"></a>
							<div class="carousel-caption"></div>
						</div>
					</c:forEach>
				</div>

				<!-- 					<div class="item">
						<img src="./resources/images/logo2.jpg" alt="로고2">
						<div class="carousel-caption"></div>
					</div> -->

				<a class="left carousel-control" href="#genreCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#genreCarousel"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

		</div>
		<div class="container col-sm-12">
			<div id="genreCarousel2" class="carousel slide" data-ride="carousel"
				data-interval="3000">
				<ol class="carousel-indicators">
					<li data-target="#genreCarousel2" data-slide-to="0" class="active"></li>
					<li data-target="#genreCarousel2" data-slide-to="1" class="active"></li>
					<li data-target="#genreCarousel2" data-slide-to="2" class="active"></li>
					<li data-target="#genreCarousel2" data-slide-to="3" class="active"></li>
					<li data-target="#genreCarousel2" data-slide-to="4" class="active"></li>
					<li data-target="#genreCarousel2" data-slide-to="5" class="active"></li>
					<li data-target="#genreCarousel2" data-slide-to="6" class="active"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<c:forEach items="${slide2}" var="s" varStatus="status">
						<div class="item <c:if test="${status.index eq 0}">active</c:if>">
							<a
								href="filepost?board_no=${s.BOARD_NO}&member_id=${s.MEMBER_ID}"><img
								src="${s.BOARD_IMG}" alt="로고1"></a>
							<div class="carousel-caption"></div>
						</div>
					</c:forEach>
				</div>

				<a class="left carousel-control" href="#genreCarousel2"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#genreCarousel2"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

		</div>
		<div class="container col-sm-12">
			<div id="genreCarousel3" class="carousel slide" data-ride="carousel"
				data-interval="3000">
				<ol class="carousel-indicators">
					<li data-target="#genreCarousel3" data-slide-to="0" class="active"></li>
					<li data-target="#genreCarousel3" data-slide-to="1" class="active"></li>
					<li data-target="#genreCarousel3" data-slide-to="2" class="active"></li>
					<li data-target="#genreCarousel3" data-slide-to="3" class="active"></li>
					<li data-target="#genreCarousel3" data-slide-to="4" class="active"></li>
					<li data-target="#genreCarousel3" data-slide-to="5" class="active"></li>
					<li data-target="#genreCarousel3" data-slide-to="6" class="active"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<c:forEach items="${slide3}" var="s" varStatus="status">
						<div class="item <c:if test="${status.index eq 0}">active</c:if>">
							<a
								href="filepost?board_no=${s.BOARD_NO}&member_id=${s.MEMBER_ID}"><img
								src="${s.BOARD_IMG}" alt="로고1"></a>
							<div class="carousel-caption"></div>
						</div>
					</c:forEach>
				</div>
				<a class="left carousel-control" href="#genreCarousel3"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#genreCarousel3"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

		</div>
	</div>

	<div class="container col-sm-4">
		<img src="./resources/images/logo1.png" class="img-responsive"
			alt="로고1" />
			
		<form action="mdview" name="searchFrm" method="get">
		<input type="hidden" name="page" value="1">
		<input type="text" name="searchKeyword" width="200%" placeholder="입력하세요" />
		<button class="btn btn-success btn-sm">검색</button>
		</form>
		
		<!-- side menu (link) -->
		<h3>Dopaming 이번주 위</h3>
		<p>Dopmaing의 최신소식을 즐겨보세요!</p>
		<ul class="list-group">
			<c:forEach items="${list}" var="main" end="9" step="1"
				varStatus="status">
				<li class="list-group-item list-group-item-action genre_rank"
					align="center"><a href="filepost?board_no=${main.board_no}&member_id=${main.member_id}">${main.rn}위 ${main.board_title}</a></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
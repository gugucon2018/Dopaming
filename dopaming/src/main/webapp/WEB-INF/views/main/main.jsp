<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 웹페이지언어 설정 -->
<html>
<head>
	<title>도파밍 프로젝트</title>
</head>
<body>
<div class="col-sm-8">
	<div class="container col-sm-12">
		<div id="genreCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
		<ol class="carousel-indicators">
			<li data-target="#genreCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#genreCarousel" data-slide-to="1" class="active"></li>
			<li data-target="#genreCarousel" data-slide-to="2" class="active"></li>
		</ol>	
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="./resources/images/logo1.png" alt="로고1">
				<div class="carousel-caption">
				</div>			
			</div>
			<div class="item">
				<img src="./resources/images/logo2.jpg" alt="로고2">
				<div class="carousel-caption">
				</div>			
			</div>
		</div>	
	<a class="left carousel-control" href="#genreCarousel" role="button" data-slide="prev">
	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>	
	<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#genreCarousel" role="button" data-slide="next">
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>	
	<span class="sr-only">Next</span>
	</a>
		</div>
	
		</div>
	<div class="container col-sm-12">
		<div id="genreCarousel2" class="carousel slide" data-ride="carousel" data-interval="3000">
		<ol class="carousel-indicators">
			<li data-target="#genreCarousel2" data-slide-to="3" class="active"></li>
			<li data-target="#genreCarousel2" data-slide-to="4" class="active"></li>
			<li data-target="#genreCarousel2" data-slide-to="5" class="active"></li>
		</ol>	
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="./resources/images/logo1.png" alt="로고1">
				<div class="carousel-caption">
				</div>			
			</div>
			<div class="item">
				<img src="./resources/images/logo2.jpg" alt="로고2">
				<div class="carousel-caption">
				</div>			
			</div>
		</div>	
	<a class="left carousel-control" href="#genreCarousel2" role="button" data-slide="prev">
	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>	
	<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#genreCarousel2" role="button" data-slide="next">
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>	
	<span class="sr-only">Next</span>
	</a>
		</div>
	
	</div>
	<div class="container col-sm-12">
		<div id="genreCarousel3" class="carousel slide" data-ride="carousel" data-interval="3000">
		<ol class="carousel-indicators">
			<li data-target="#genreCarousel3" data-slide-to="6" class="active"></li>
			<li data-target="#genreCarousel3" data-slide-to="7" class="active"></li>
			<li data-target="#genreCarousel3" data-slide-to="8" class="active"></li>
		</ol>	
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="./resources/images/logo1.png" alt="로고1">
				<div class="carousel-caption">
				</div>			
			</div>
			<div class="item">
				<img src="./resources/images/logo2.jpg" alt="로고2">
				<div class="carousel-caption">
				</div>			
			</div>
		</div>	
	<a class="left carousel-control" href="#genreCarousel3" role="button" data-slide="prev">
	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>	
	<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#genreCarousel3" role="button" data-slide="next">
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>	
	<span class="sr-only">Next</span>
	</a>
		</div>
		
		</div>
	</div>
		 <div class="container col-sm-4"> 
                <!-- side menu (link) -->
                <h3>Dopaming 이번주 순위</h3>
                <p>Dopmaing의 최신소식을 즐겨보세요!</p>
                <ul class="list-group">
                    <li class="list-group-item list-group-item-action genre_rank"><a href="#">어벤져스 엔드게임</a></li>
                    <li class="list-group-item list-group-item-action genre_rank"><a href="#">스파이더맨</a></li>
                    <li class="list-group-item list-group-item-action genre_rank"><a href="#">헐크</a></li>
					<li class="list-group-item list-group-item-action genre_rank"><a href="#">토르</a></li>
					<li class="list-group-item list-group-item-action genre_rank"><a href="#">아이언맨</a></li>
					<li class="list-group-item list-group-item-action genre_rank"><a href="#">캡틴마블</a></li>
					<li class="list-group-item list-group-item-action genre_rank"><a href="#">슈퍼맨</a></li>
					<li class="list-group-item list-group-item-action genre_rank"><a href="#">배트맨</a></li>
					<li class="list-group-item list-group-item-action genre_rank"><a href="#">울버린</a></li>
					<li class="list-group-item list-group-item-action genre_rank"><a href="#">와칸다 포에버</a></li>
                </ul>
            </div>
</body>
</html>
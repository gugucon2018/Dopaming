<%@page import="javafx.stage.Stage"%>
<%@page import="com.dopaming.www.file.DownloadProgressbar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 페이지</title>
</head>
<body>
<h1>다운로드 테스트 페이지 입니다.</h1>
<script src="./resources/js/dtfx.js"></script>
<script>
	javafx(
		{
			archive: "javafxprogress.jar",
			width: 500,
			width: 500,
			code: "com.dopaming.www.file.DownloadProgressbar",
			name:"DownloadProgressbar"			
		}		
	);
</script>
</body>
<!-- <figure>
	<object type="application/x-java-applet">
		<param name="code" value="DownloadProgressbar">
		<p>자바 테스트!</p>
	</object>
</figure> -->
</html>
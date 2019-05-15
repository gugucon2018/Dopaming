<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<div>
	<h4>업로드한 리스트 뷰 </h4><hr>
	<div>
		<INPUT TYPE="text" NAME="name" style="text-align:right"> 
		<button type="button">검색</button>
	</div>
	<div>
		<table>
		  <tr>
		    <th>순번</th>
		    <th>아이디</th>
		    <th>파일명</th>
		    <th>사용횟수</th>
		  </tr>
		  <tr>
		    <td>1</td>
		    <td>Alfreds Futterkiste</td>
		    <td><a href="http://daeguoracle.com">(주)</a></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>2</td>
		    <td>Alfreds Futterkiste</td>
		    <td><a href="http://daeguoracle.com">(주)</a></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>3</td>
		    <td>Alfreds Futterkiste</td>
		    <td><a href="http://daeguoracle.com">(주)</a></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>4</td>
		    <td>Alfreds Futterkiste</td>
		    <td><a href="http://daeguoracle.com">(주)</a></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>5</td>
		    <td>Alfreds Futterkiste</td>
		    <td><a href="http://daeguoracle.com">(주)</a></td>
		    <td>Germany</td>
		  </tr>
		</table>
	</div>
	페이징해야함
	<br>
	<br>
	<br>
</div>
</body>
</html>
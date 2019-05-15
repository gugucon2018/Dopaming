<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
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
	<h4>결제페이지 </h4><hr>
	<div>
		<table>
		  <tr>
		    <th> </th>
		    <th>결제금액 </th>
		  </tr>
<!-- 	  <tr>
		    <td><input type="radio" name="free"></td>
		    <td><input type="text" name="chk_info">원 충천</td>
		  </tr> -->
		  <tr>
		    <td><input type="radio" name="Five"></td>
		    <td>5000원 충천</td>
		  </tr>
		  <tr>
		    <td><input type="radio" name="Ten"></td>
		    <td>10000원 충천</td>
		  </tr>
		  <tr>
			<td><input type="radio" name="TOTEN"></td>
		    <td>20000원 충천</td>
		  </tr>
		  <tr>
		    <td><input type="radio" name="TOFiveTen"></td>
		    <td>25000원 충천</td>
		  </tr>
		</table>
	</div>
	<div>
		<span style="float:right"> 
			<button type="button">결제하기</button>
		</span>
	</div>
	<br>
	<br>
	<br>
</div>
</body>
</html>
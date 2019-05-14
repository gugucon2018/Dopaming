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
	<h4>등급관리 </h4><hr>
	<div>
		<form action="adminlogin" method="post">
		<select>
		  <option value="Select bar">Select bar</option>
		  <option value="Diamond">다이아몬드</option>
		  <option value="gold">골드</option>
		  <option value="sliver">실버</option>
		  <option value="bronze">브론즈</option>
		</select>
		<INPUT TYPE="text" NAME="name" style="text-align:right"> 
		<button type="button">검색</button>
		</form>
	</div>
	<div>
		<table>
		  <tr>
		    <th> </th>
		    <th>아이디</th>
		    <th>총결제액</th>
		    <th>업로드</th>
		    <th>등급</th>
		  </tr>
		  <tr>
		    <td><input type="checkbox" name="chk_info"></td>
		    <td>Alfreds Futterkiste</td>
		    <td>Maria Anders</td>
		    <td>Germany</td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td><input type="checkbox" name="chk_info"></td>
		    <td>Alfreds Futterkiste</td>
		    <td>Maria Anders</td>
		    <td>Germany</td>
		    <td>Germany</td>
		  </tr>
		  <tr>
	    <td><input type="checkbox" name="chk_info"></td>
		    <td>Alfreds Futterkiste</td>
		    <td>Maria Anders</td>
		    <td>Germany</td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td><input type="checkbox" name="chk_info"></td>
		    <td>Alfreds Futterkiste</td>
		    <td>Maria Anders</td>
		    <td>Germany</td>
		    <td>Germany</td>
		  </tr>
		  <tr>
	    	<td><input type="checkbox" name="chk_info"></td>
		    <td>Alfreds Futterkiste</td>
		    <td>Maria Anders</td>
		    <td>Germany</td>
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
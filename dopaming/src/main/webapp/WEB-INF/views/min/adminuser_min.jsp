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
	<h4>사용자관리 </h4><hr>
	<div>
		<form action="adminlogin" method="post">
		<select>
		  <option value="Select bar">Select bar</option>
		  <option value="blacklist">블랙리스트</option>
		  <option value="normaluser">일반회원</option>
		</select>
		<INPUT TYPE="text" NAME="name" style="text-align:right"> 
		<button type="button">검색</button>
		</form>
	</div>
	<div>
		<table>
		  <tr>
		    <th>아이디</th>
		    <th>이메일</th>
		    <th>상태</th>
		    <th>탈퇴</th>
		    <th>날짜</th>
		  </tr>
		  <tr>
		    <td>아이디1</td>
		    <td>Alfreds Futterkiste</td>
		    <td><select>
		  <option value="Select bar">Select bar</option>
		  <option value="blacklist">블랙리스트</option>
		  <option value="normaluser">일반회원</option>
		</select></td>
		    <td><button type="button">회원탈퇴</button></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>아이디2</td>
		    <td>Alfreds Futterkiste</td>
		    <td><select>
		  <option value="Select bar">Select bar</option>
		  <option value="blacklist">블랙리스트</option>
		  <option value="normaluser">일반회원</option>
		</select></td>
		    <td><button type="button">회원탈퇴</button></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>아이디3</td>
		    <td>Alfreds Futterkiste</td>
		    <td><select>
		  <option value="Select bar">Select bar</option>
		  <option value="blacklist">블랙리스트</option>
		  <option value="normaluser">일반회원</option>
		</select></td>
		    <td><button type="button">회원탈퇴</button></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>아이디4</td>
		    <td>Alfreds Futterkiste</td>
		    <td><select>
		  <option value="Select bar">Select bar</option>
		  <option value="blacklist">블랙리스트</option>
		  <option value="normaluser">일반회원</option>
		</select></td>
		    <td><button type="button">회원탈퇴</button></td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>아이디5</td>
		    <td>Alfreds Futterkiste</td>
		    <td><select>
		  <option value="Select bar">Select bar</option>
		  <option value="blacklist">블랙리스트</option>
		  <option value="normaluser">일반회원</option>
		</select></td>
		    <td><button type="button">회원탈퇴</button></td>
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
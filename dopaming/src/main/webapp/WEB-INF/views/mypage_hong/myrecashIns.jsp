<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환급계좌 정보 입력</title>
<style>
.insertbar {
  padding: 8px;
  display: inline-block;
  font-size: 20px;
  width: 97.5%;
  border: none;
  background: #d6d6d6;
}

.insertbar:hover {
  background-color: #fff;
  outline: none;
}

.insertbtn {
  background-color: #fff;
  color: black;
  font-weight:bold;
  padding: 8px;
  margin-top: 20px;
  margin-left: 10%;
  border: none;
  width: 80%;
 
}

.insertbtn:hover {
  background-color: #000;
  color: white;
}
</style>
</head>
<body>
<form action="myrecashIns.do">
	<h3>계좌은행</h3>
		<input type="text" class="insertbar" name="bank"> 
	<h3>계좌번호</h3>
		<input type="text" class="insertbar" name="account_no" placeholder=' "-" 는 생략해주세요.'>
	<h3>예금주</h3>
		<input type="text" class="insertbar" name="account_own">
	<h3>신청환급량</h3>
		<input type="text" class="insertbar" name="reg_recash" id="myacorn">
			<label for="myacorn">현재 아콘 보유량:${memberSession.acorn_stock}</label>
	<button type="submit" class="insertbtn">신청하기</button>
</form>
</body>
</html>
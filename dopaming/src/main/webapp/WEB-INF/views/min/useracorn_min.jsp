<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  --%>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp69493421'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	function payment() {
		//라디오버튼 체크 value변수	
		var radioVal = $('input[name="pay"]:checked').val();
		
		//라디오버튼 value가 0일때(직접입력) inputpay(text)의 val를 사용
		if(radioVal==0){
			radioVal=$('input[name="inputpay"]').val();
		}
		if(radioVal==0){
			alert("값입력");
			return;
		}
		console.log(radioVal);
		IMP.request_pay({

			pg : 'html5_inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : radioVal,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
		/*  m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		})
	};
</script>
</head>
<body>
	<div>
		<h4>결제페이지</h4>
		<hr>
		<div>
		<form name="ha">
			<table style="width: 70%; ">
				<tr>
					<th>선택</th>
					<th>결제금액</th>
				</tr>
				<tr>
				    <td><input type="radio" name="pay" value="0"></td>
				    <td><input type="text" name="inputpay"></td>
				</tr>
				<tr>
					<td><input type="radio" name="pay" value="5000"></td>
					<td>5000원 충천</td>
				</tr>
				<tr>
					<td><input type="radio" name="pay" value="10000"></td>
					<td>10000원 충천</td>
				</tr>
				<tr>
					<td><input type="radio" name="pay" value="20000"></td>
					<td>20000원 충천</td>
				</tr>
				<tr>
					<td><input type="radio" name="pay" value="25000"></td>
					<td>25000원 충천</td>
				</tr>
				<tr>
					<td><input type="radio" name="pay" value="50000"></td>
					<td>50000원 충천</td>
				</tr>
				<tr>
					<td><input type="radio" name="pay" value="100000"></td>
					<td>100000원 충천</td>
				</tr>
				
			</table>
		</div>
		<div>
			<span style="float: right">
				<button type="button" onclick="payment()">결제하기</button>
			</span>
		</div>
		
		<br> <br> <br>
		</form>
	</div>
	
</body>
</html>
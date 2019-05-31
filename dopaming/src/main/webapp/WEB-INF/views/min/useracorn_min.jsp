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
//1.결제방식 radio선택후 버튼클릭하여 value값을 넘기면서 api화면 띄움
//2.IMP.request_pay에 적혀잇는 방식으로 api를 실행함
//3.rsp.imp_uid(결제고유아이디),rsp.merchant_uid(상점거래아이디),
//rsp.paid_amount(결제금액),rsp.apply_num(카드 승인번호) 를 function payresult의 매개변수로 받음
//4.해당 4개의 name.value값을 받아 매개변수(param1,2,3,4)에 넘긴후 submit 실행
//5.값이 넘어가면 컨트롤러에서 vo에 저장후 mapping에서 값을 DB에 insert
//6.또한 값이 무사히 들어갔을시 결제에 성공했다고 alert뜸

	var IMP = window.IMP; // 생략가능
	IMP.init('imp69493421'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	//결제api사용시 넘어가는 값 4개를 매개변수로 받아 저장후 컨트롤러로 넘김
	function payresult(param1,param2,param3,param4){
		$('input[name="pay_code"]').val(param1);
		$('input[name="shop_code"]').val(param2);
		$('input[name="acorn_charge"]').val(param3);
		$('input[name="approval_code"]').val(param4);
		
		
		console.log(param1," ",param2," ",param3," ",param4);
		console.log($('input[name="pay_code"]').val());
		$("#payresult").submit();
	}
	
	function payment() {
		//라디오버튼 체크 value변수	
		var radioVal = $('input[name="pay"]:checked').val();
		
		//라디오버튼 value가 0일때(직접입력) inputpay(text)의 val를 사용
		if(radioVal==0){
			radioVal=$('input[name="inputpay"]').val();
		}
		//직접입력값이 0이면 값입력하라고 alert뜸
		if(radioVal==0){
			alert("직접입력해주세요.");
			return;
		}
		console.log(radioVal);
		//결제 api
		IMP.request_pay({
			pg : 'nice',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : radioVal,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				payresult(rsp.imp_uid,rsp.merchant_uid,rsp.paid_amount,rsp.apply_num);
				/* msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num; */
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
<form id="payresult" action="./acornForm" method="post">
<input type="hidden" name="pay_code" value=""/>
<input type="hidden" name="shop_code" value=""/>
<input type="hidden" name="acorn_charge" value=""/>
<input type="hidden" name="approval_code" value=""/>
</form>
	<div>
		<h4>결제페이지</h4>
		<hr>
		<div>
	
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
		
	</div>
	
</body>
</html>
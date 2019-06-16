<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td {
	width: 60px;
	height: 60px;
	text-align: center;
	font-size: 20px;
	border: 2px dotted #FF5E00;
	border-radius: 13px;
}

.sunday {
	color: red;
}

.sunday:hover {
	background: yellow;
	cursor: pointer;
}

.saturday {
	color: blue;
}

.saturday:hover {
	background: yellow;
	cursor: pointer;
}

.general {
	color: #000;
}

.general:hover {
	background: yellow;
	cursor: pointer;
}
</style>
<script>
	window.onload = function() {
		showCal.onclick = function() {			
			var array = [ "일", "월", "화", "수", "목", "금", "토" ];
			var last_day = [ "31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31" ];
			var sel = new Date(y.value, m.value - 1, 1);
			var calendar = "";
			var d_of_w = "";
			var count = 1;
			var gap = sel.getDay();
			var blank = 0;
			var numb = 1;

			
			d_of_w += "<tr>";
			for (td = 0; td < 7; td++) { //요일을 쓰기위해 따로 반복문 써서 만들어줌
				if (td == 0) {
					d_of_w += "<td class='sunday'>" + array[td] + "</td>";
				} else if (td == 6) {
					d_of_w += "<td class='saturday'>" + array[td] + "</td>";
				} else {
					d_of_w += "<td >" + array[td] + "</td>";
				}
			}
			d_of_w += "</tr>";
			week.innerHTML = "<table align=center>" + d_of_w + "</table>";

			if (((y.value % 4 == 0) && (y.value % 100 != 0)) || (y.value % 400 == 0)) {
				last_day[1] = 29; //윤달이면 2월의 마지막날을 29일로 셋팅
			} else {
				last_day[1] = 28;
			}

			for (tr = 1; tr <= last_day[m.value - 1]; tr++) {
				if (count % 7 == 1) {
					calendar += "<tr>";
				}
				if (gap > blank) {
					for (r = 0; r < gap; r++) { //공백주기 위해 공백만큼 빈칸 반복
						calendar += "<td>" + "</td>";
						count++;
						blank++;
					}
				}
				if (count % 7 == 1) {
					calendar += "<td class='sunday' onclick='thisDate("+numb+")'>" + numb + "</td>";
				} else if (count % 7 == 0) {
					calendar += "<td class='saturday' onclick='thisDate("+numb+")'>" + numb + "</td>";
				} else {
					calendar += "<td class='general' onclick='thisDate("+numb+")'>" + numb + "</td>";
				}
				count++;
				numb++;
				if (count % 7 == 1) { //공백포함 카운트숫자가 7로 나눴을때 나머지가 1이면 줄바꾸기 위해 tr 닫아줌
					calendar += "</tr>";
				}
			}
			con.innerHTML = "<table align=center>" + calendar + "</table>";
		}
	}
	
	function pad(n, width) {
		  n = n + '';
		  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	function thisDate(day) {
		var months = pad(m.value, 2);
		var days = pad(day,2);
		
		var date = y.value + '/' + months + '/' + days;
		
		location.href='${pageContext.request.contextPath}/admin/myReCash?reg_date=' + date;	
/* 		$.ajax({
			url:'${pageContext.request.contextPath}/admin/myReCash',
			type:'GET',
			data: {reg_date: date},
			dataType:'json',
			success:function(data) {
				location.href='${pageContext.request.contextPath}admin/admin_ho/recashList';
			}
			
		}); */
	}
</script>
</head>
<body>
	<select id="y">
		<c:forEach var="year" begin="2010" end="2099" step="1">
			<option>${year}</option>
		</c:forEach>
	</select>년

	<select id="m">
		<c:forEach var="month" begin="1" end="12" step="1">
			<option>${month}</option>
		</c:forEach>
	</select>월
	<input type="button" id="showCal" value="달력보기">
		<div id="week"></div>
		<div id="con"></div>
</body>
</html>
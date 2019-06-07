/*
 **쪽지(msg) script
 */



//전역변수
var oldCnt = 0

//최초 함수 호출
$(document).ready(function () {
	if(id == "") {
		return false;
	}
	msgCnt("0");
	
	setInterval(msgCnt, 100000000);
	
	msgReceive();
		
	msgSent();
	
	msgWrite();
	
	msgKeep();
	
	//쪽지버튼 클릭
	$("#chk_msg").click(function(){
		$("#open_msg").modal();		
		msgOpen();		
	});
});

//쪽지 최초 열기		
function msgOpen() {
	$.ajax({
		url:context+'/msg',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success:msgReceiveResult
	});
}



/*
 * 
 * Receive
 * 
 */

//읽지않은 쪽지 수
function msgCnt(count) {
	$.ajax({
		url:context+'/cnt',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success: function (result) {
			$("#cnt").html(result.cnt)
			if(count != "0" && oldCnt < result.cnt)
				alert("도착")			
			oldCnt = result.cnt	
		}
	});
}

//받은쪽지_버튼
function msgReceive() {
	$("#receive_msg").click(function(){			
		$.ajax({
			url:context+'/msg',
			type:'GET',
			contentType:'application/json;charset=utf-8',
			data: $("#form_receive").serialize(),
			dataType:'json',
			success:msgReceiveResult
		});
	});
}

//받은쪽지_목록
function msgReceiveResult(data) {
	$("#wrap").remove();
	var $tag = "<div id='wrap'>"
	$tag += "<div class='head_receive'>" + "Receive" + "</div>"
	$tag += "<button type='button' class='btn_unselect' onclick='msgUnselect()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_unselect.png' width='22p' height='24px'>"
	$tag += "</button>"
	$tag += "<button type='button' class='btn_keeping' onclick='msgKeeping()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_keeping.png' width='22px' height='24px'>"
	$tag += "</button>"
	$tag += "<button type='button' class='btn_trashing' onclick='msgReceiveTrashing()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_trashing.png' width='22px' height='24px'>"
	$tag += "</button>"
	$tag += "<p>" 
	$tag += "<span class='sender_bar_r'>" + "sender" + "</span>"
	$tag += "<span class='title_bar_r'>" + "title" + "</span>"
	$tag += "</p>"
	$tag += "<div id='list'>" + "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);	
	$("#list").find("span").remove();	
	$.each(data,function(idx,item) {
		if(item.message_check == "N") {
			var color = "color:red;"
		} else var color = ""
		$('<p>')
		.append($('<span class="sender_receive">').html(item.sender_id))
		.append($('<span class="title_receive" onclick="msgSelect('+item.message_no+'); msgChange('+item.message_no+')" style="'+color+'">').html(item.message_title))
		.append($('<input type="checkbox" id="c'+idx+'" name="ck" value="'+item.message_no+'">'))
		.append($('<label id="ck_receive" for="c'+idx+'" />'))
		.appendTo("#list");
	});
}

//쪽지읽음_상태변경
function msgChange(no) {
	$.ajax({
		url:context+'/msg_changing',		
		type:'GET',
		data: {message_no: no},
		dataType:'json',
	});
}

//쪽지읽기_선택 
function msgSelect(no) {
	$.ajax({
		url:context+'/msg_select',		
		type:'GET',
		data: {message_no: no},
		dataType:'json',
		success:msgSelectResult
	});
}

//쪽지읽기_내용확인
function msgSelectResult(result) {
	$("#wrap").remove();
	var $tag= "<div id='wrap'>"
	$tag += "<div class='head_receive'>" + "Read" + "</div>"
	$tag += "<div class='content_position'>"
	$tag += "<span class='sender_r'>" + "보낸이: " + result.sender_id + "</span>"
	$tag += "<span class='blank'>" + "</span>"
	$tag += "<span class='date_r'>" + result.message_date + "</span>"
	$tag += "<div class='content_r'>" + result.message_content + "</div>"
	$tag += "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);	
}

//읽지않은쪽지_버튼
function msgUnselect() {
	$.ajax({
		url:context+'/msg_unselect',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success:msgReceiveResult
	});	
}

//쪽지보관_버튼	
function msgKeeping() {
	$.ajax({
		url:context+'/msg_checking',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		data: $("#form_receive").serialize(),
		dataType:'json',
		success:msgKeepingResult
	});
}	

//쪽지보관_수행
function msgKeepingResult(data) {
	$.each(data,function(idx,item) {
		if(item.message_check == 'N') {
			alert("읽지 않은 쪽지는 보관함으로 이동할 수 없습니다.")
		} else
			$.ajax({
				url:context+'/msg_keeping',
				type:'GET',
				data: {message_no: item.message_no},
				dataType:'json',			
				success:function() { $("#receive_msg").click(); }
			});			
	});
}

//보낸쪽지 휴지통_버튼
function msgReceiveTrashing() {
	$.ajax({
		url:context+'/msg_checking',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		data: $("#form_receive").serialize(),
		dataType:'json',
		success:msgReceiveTrashingResult
	});
}	

//보낸쪽지 휴지통_수행
function msgReceiveTrashingResult(data) {
	$.each(data,function(idx,item) {
		if(item.message_check == 'N') {
			alert("읽지 않은 쪽지는 휴지통으로 이동할 수 없습니다.")
		} else
			$.ajax({
				url:context+'/msg_traching_r',
				type:'GET',
				data: {message_no: item.message_no},
				dataType:'json',			
				success:function() { $("#receive_msg").click(); }
			});			
	});
}

/*
 * 
 * Sent
 * 
 */

//보낸쪽지_버튼	
function msgSent() {	
	$("#sent_msg").click(function(){			
		$.ajax({
			url:context+'/msg',
			type:'POST',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:msgSentResult
		});
	});
}

//보낸쪽지_목록
function msgSentResult(data) {
	$("#wrap").remove();
	var $tag = "<div id='wrap'>"
	$tag += "<div class='head_sent'>" + "Sent" +"</div>"
	$tag += "<h5 style='color:red'>" + '빨간색: 수신자가 읽지 않은 쪽지' + "</h5>" 
	$tag += "<button type='button' class='btn_trashing' onclick=' msgSentTrashing()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_trashing.png' width='22px' height='24px'>"
	$tag += "</button>"
	$tag += "<p>" 
	$tag += "<span class='receiver_bar'>" + "receiver" + "</span>"
	$tag += "<span class='title_bar_s'>" + "title" + "</span>"
	$tag += "</p>"
	$tag += "<div id='list'>" + "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);
	$("#list").find("span").remove();
	$.each(data,function(idx,item){
		if(item.message_check == "N") {
			var color = "color:red;"
		} else var color = ""
		$('<p>')
		.append($('<span class="receiver_sent">').html(item.receiver_id)) 
		.append($('<span class="title_sent" style="'+color+'">').html(item.message_title))
		.append($('<input type="checkbox" id="c'+idx+'" name="ck" value="'+item.message_no+'">'))
		.append($('<label id="ck_sent" for="c'+idx+'" />'))
		.appendTo("#list");
	});
}

//보낸쪽지 휴지통_버튼
function msgSentTrashing() {
	$.ajax({
		url:context+'/msg_traching_s',
		type:'GET',
		dataType:'json',
		data: $("#form_receive").serialize(),
		success:function() { $("#sent_msg").click(); }
	});
}



/*
 * 
 * Write
 * 
 */

//쪽지쓰기
function msgWrite() {
	$("#write_msg").click(function(){			
		$("#wrap").remove();
		var $tag = "<div id='wrap'>"
		$tag += "<div class='head_write'>" + "Write" + "</div>"
		$tag += "<button type='button' class='btn_sending' onclick='msgSending()'>"
		$tag += "<img src='"+context+"/resources/images/ho/icon_sending.png' width='22px' height='24px'>"
		$tag += "</button>"
		$tag += "<div class='content_position'>"
		$tag += "<input type='text' class='receiver_w' name='receiver_id' placeholder='받는이'>"
		$tag += "<input type='text' class='title_w' name='message_title' placeholder='제목'>"
		$tag += "<textarea class='content_w' name='message_content' onKeyUp='checkByte(this.form)' placeholder='내용은 2000byte 이내로 작성해주세요.(한글, 약600자 내외)'>" + "</textarea>"
		$tag += "<div class='byte_position'>"  		
		$tag += "<input type='text' class='lenght_w' name='message_byte' value='0' maxlength='3' readonly>" + " / 2000 byte"
		$tag += "</div>"		
		$tag += "</div>"
		$tag += "</div>"
		$("#form_receive").append($tag);
	});
}

//작성내용 Byte 계산
function checkByte(frm) {
	var totalByte = 0;
	var limitByte = 2000;
	var content = frm.message_content.value;
	
	for(var i=0; i < content.length; i++) {
			var currentByte = content.charCodeAt(i);
			if(currentByte > 128) totalByte +=3;
		else totalByte++;
	}
	frm.message_byte.value = totalByte;	
	
	if(totalByte > limitByte) {
			alert(limitByte + "Byte까지 전송 가능합니다.");
		frm.message_content.value = content.substring(0,limitByte);
	}	
}

//쪽지발송
function msgSending() {
		var receiver_id = $('input:text[name="receiver_id"]').val();
		var message_title = $('input:text[name="message_title"]').val();
		var message_content = $('textarea[name="message_content"]').val();
		$.ajax({
			url:context+'/msg',
			type:'PUT',
			data:JSON.stringify({ receiver_id:receiver_id, message_title:message_title, message_content:message_content }),
			dataType:'json',			
		    contentType: 'application/json',
		    mimeType: 'application/json',
			success:function() { $("#sent_msg").click(); }
		});
}



/*
 * 
 * Keep
 * 
 */

//쪽지보관함_버튼
function msgKeep() {
	$("#keep_msg").click(function(){			
		$.ajax({
			url:context+'/msg',
			type:'PATCH',
			contentType:'application/json;charset=utf-8',
			data: $("#form_receive").serialize(),
			dataType:'json',
			success:msgKeepResult
		});
	});
}

//쪽지보관함_목록
function msgKeepResult(data) {
	$("#wrap").remove();
	var $tag = "<div id='wrap'>"
	$tag += "<div class='head_keep'>" + "Keep" + "</div>"
	$tag += "<button type='button' class='btn_back' onclick='msgKeepReturning()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_back.png' width='22p' height='24px'>"
	$tag += "</button>"
	$tag += "<button type='button' class='btn_trashing' onclick='msgKeepTrashing()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_trashing.png' width='22px' height='24px'>"
	$tag += "</button>"
	$tag += "<p>" 
	$tag += "<span class='sender_bar_k'>" + "sender" + "</span>"
	$tag += "<span class='title_bar_k'>" + "title" + "</span>"
	$tag += "</p>"
	$tag += "<div id='list'>" + "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);	
	$("#list").find("span").remove();	
	$.each(data,function(idx,item) {
		$('<p>')
		.append($('<span class="sender_keep">').html(item.sender_id))
		.append($('<span class="title_keep">').html(item.message_title))
		.append($('<input type="checkbox" id="c'+idx+'" name="ck" value="'+item.message_no+'">'))
		.append($('<label id="ck_keep" for="c'+idx+'" />'))
		.appendTo("#list");
	});
}

//보관함 이전으로 복원	
function msgKeepReturning() {
		$.ajax({
			url:context+'/msg_returning_k',
			type:'GET',
			data: $("#form_receive").serialize(),
			dataType:'json',			
			success:function() { $("#keep_msg").click(); }
		});
}

//보낸쪽지 휴지통_버튼
function msgKeepTrashing() {
	$.ajax({
		url:context+'/msg_traching_k',
		type:'GET',
		dataType:'json',
		data: $("#form_receive").serialize(),
		success:function() { $("#keep_msg").click(); }
	});
}



/*
 * 
 * Trach
 * 
 */
 
 //휴지통_버튼
function msgTrash() {
	$("#trash_msg").click(function(){			
		$.ajax({
			url:context+'/msg',
			type:'DELETE',
			contentType:'application/json;charset=utf-8',
			data: $("#form_receive").serialize(),
			dataType:'json',
			success:msgTrashResult
		});
	});
}

//쪽지보관함_목록
function msgTrashResult(data) {
	$("#wrap").remove();
	var $tag = "<div id='wrap'>"
	$tag += "<div class='head_trash'>" + "Trash" + "</div>"
	$tag += "<button type='button' class='btn_back' onclick='msgTrashReturning()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_back.png' width='22p' height='24px'>"
	$tag += "</button>"
	$tag += "<button type='button' class='btn_trashing' onclick='msgTrashTrashing()'>"
	$tag += "<img src='"+context+"/resources/images/ho/icon_trashing.png' width='22px' height='24px'>"
	$tag += "</button>"
	$tag += "<p>" 
	$tag += "<span class='sender_bar_t'>" + "sender" + "</span>"
	$tag += "<span class='title_bar_t'>" + "title" + "</span>"
	$tag += "</p>"
	$tag += "<div id='list'>" + "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);	
	$("#list").find("span").remove();	
	$.each(data,function(idx,item) {
		$('<p>')
		.append($('<span class="sender_trash">').html(item.sender_id))
		.append($('<span class="title_trash">').html(item.message_title))
		.append($('<input type="checkbox" id="c'+idx+'" name="ck" value="'+item.message_no+'">'))
		.append($('<label id="ck_keep" for="c'+idx+'" />'))
		.appendTo("#list");
	});
}
 
 
 
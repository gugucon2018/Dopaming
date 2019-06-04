//최초 함수 호출
$(document).ready(function () {
	
	msgCnt();
	
	msgReceive();
		
	msgSent();
	
	msgWrite();
	
	msgSending();
		
	msgKeeping();
	
	//쪽지버튼 클릭
	$("#chk_msg").click(function(){
		$("#open_msg").modal();		
		msgOpen();		
	});
});

//쪽지 최초 open		
function msgOpen() {
	$.ajax({
		url:'msg',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success:msgReceiveResult
	});
}

//확인되지 않은 받은 쪽지 수
function msgCnt() {
	$.ajax({
		url:'cnt',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success: function (result) {
			$("#cnt").html(result.cnt)
		}
	});
}

//쪽지 receive 버튼
function msgReceive() {
	$("#receive_msg").click(function(){			
		$.ajax({
			url:'msg',
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:msgReceiveResult
		});
	});
}

//쪽지 receive 출력
function msgReceiveResult(data) {
	$("#wrap").remove();
	var $tag = "<div id='wrap'>"
	$tag += "<div class='head_receive'>" + "Receive" + "</div>"
	$tag += "<p>" 
	$tag += "<span class='sender_bar'>" + "sender" + "</span>"
	$tag += "<span class='title_bar_r'>" + "title" + "</span>"
	$tag += "</p>"
	$tag += "<div id='list'>" + "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);	
	$("#list").find("span").remove();	
	//결과출력
	$.each(data,function(idx,item) {
		$('<p>')
		.append($('<span class="sender_receive">').html(item.sender_id)) 
		.append($('<span class="title_receive" onclick="msgSelect('+item.message_no+'); msgChange('+item.message_no+')">').html(item.message_title))
		.append($('<input type="checkbox" id="c'+idx+'" name="ck" value="'+item.message_no+'">'))
		.append($('<label id="ck_receive" for="c'+idx+'" />'))
		.appendTo("#list");
	});
}

//쪽지 Sent 버튼	
function msgSent() {	
	$("#sent_msg").click(function(){	
	//보낸쪽지 검색 		
		$.ajax({
			url:'msg',
			type:'POST',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:msgSentResult
		});
	});
}

//쪽지 Sent 출력
function msgSentResult(data) {
	$("#wrap").remove();
	var $tag = "<div id='wrap'>"
	$tag += "<div class='head_sent'>" + "Sent" + "</div>"
	$tag += "<p>" 
	$tag += "<span class='receiver_bar'>" + "receiver" + "</span>"
	$tag += "<span class='title_bar_s'>" + "title" + "</span>"
	$tag += "</p>"
	$tag += "<div id='list'>" + "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);
	$("#list").find("span").remove();
	//결과출력
	$.each(data,function(idx,item){
		$('<p>')
		.append($('<span class="receiver_sent">').html(item.receiver_id)) 
		.append($('<span class="title_sent">').html(item.message_title))
		.append($('<input type="checkbox" id="c'+idx+'">'))
		.append($('<label id="ck_sent" for="c'+idx+'" />'))
		.appendTo("#list");
	});
}

//쪽지 write 버튼
function msgWrite() {
	$("#write_msg").click(function(){			
		$("#wrap").remove();
		var $tag = "<div id='wrap'>"
		$tag += "<div class='head_write'>" + "Write" + "</div>"
		$tag += "<div class='position'>"
		$tag += "<input type='text' class='receiver_w' name='receiver_id' placeholder='받는이'>"
		$tag += "<input type='text' class='title_w' name='message_title' placeholder='제목'>"
		$tag += "<textarea class='content_w' name='message_content' onKeyUp='checkByte(this.form)' placeholder='내용은 2000byte 이내로 작성해주세요.(한글, 약600자 내외)'>" + "</textarea>"
		$tag += "<div class='position_2'>"  		
		$tag += "<input type='text' class='lenght_w' name='message_byte' value='0' maxlength='3' readonly>" + " / 2000 byte"
		$tag += "</div>"		
		$tag += "</div>"
		$tag += "</div>"
		$("#form_receive").append($tag);
	});
}

//쪽지 내용 Byte 계산
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

//쪽지 보내기
function msgSending() {
	$('#sending_msg').click(function() {
		var receiver_id = $('input:text[name="receiver_id"]').val();
		var message_title = $('input:text[name="message_title"]').val();
		var message_content = $('textarea[name="message_content"]').val();
		$.ajax({
			url:'msg',
			type:'PUT',			
			dataType:'json',
			data:JSON.stringify({ receiver_id:receiver_id, message_title:message_title, message_content:message_content }),
		    contentType: 'application/json',
		    mimeType: 'application/json',
			success:function() { $("#sent_msg").click(); }
		});
	})
}


//쪽지 Keeping 버튼	
function msgKeeping() {
	$("#keeping_msg").click(function(){
		$.ajax({
			url:'msg_keeping',
			type:'GET',
			dataType:'json',
			data: $("#form_receive").serialize(),
			success:function() { $("#receive_msg").click(); }
		});
	});
}

//받은 쪽지 확인상태 변경
function msgChange(no) {
	$.ajax({
		url:'msg_changing',
		data: {message_no: no},
		type:'GET',
		dataType:'json',
	});
}

//받은 쪽지 선택
function msgSelect(no) {
	$.ajax({
		url:'msg_select',
		data: {message_no: no},
		type:'GET',
		dataType:'json',
		success:msgSelectResult
	});
}

//선택된 받은 쪽지 내용 확인
function msgSelectResult(result) {
	$("#wrap").remove();
	var $tag= "<div id='wrap'>"
	$tag += "<div class='head_receive'>" + "Read" + "</div>"
	$tag += "<div class='position'>"
	$tag += "<span class='sender_r'>" + "보낸이: " + result.sender_id + "</span>"
	$tag += "<span class='blank'>" + "</span>"
	$tag += "<span class='date_r'>" + result.message_date + "</span>"
	$tag += "<div class='content_r'>" + result.message_content + "</div>"
	$tag += "</div>"
	$tag += "</div>"
	$("#form_receive").append($tag);	
}

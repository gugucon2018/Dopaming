<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./resources/css/msg.css">
<script src="./resources/js/msg.js"></script>
</head>
<body>
<div class="modal fade" id="open_msg" role="dialog">
	<div class="modal-dialog msg_modal" role="document">
		<div class="modal-content">
			<div class="modal-header">
            <button class="btn btn-danger btn_size" id="write_msg" type="button">Write</button>
            <button class="btn btn-warning btn_size" id="receive_msg" type="button">Receive</button>
            <button class="btn btn-success btn_size" id="sent_msg" type="button">Sent</button>
            <button class="btn btn-primary btn_size" type="button">Keep</button>
            <button class="btn btn-default btn_size" type="button">Trash</button>
			</div>
			<div class="modal-body">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
				<form id="form_receive"></form>			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger btn_size_2" id="sending_msg">Sending</button>
			    <button type="button" class="btn btn-primary btn_size_2" id="keeping_msg">Keeping</button>
			    <button type="button" class="btn btn-default btn_size_2">Trashing</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
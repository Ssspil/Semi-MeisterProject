<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String nickName = (String) request.getAttribute("nickname");
	int sender = (Integer) request.getAttribute("sender");
%>
<!DOCTYPE html>
<html>
<head>
<style>
	.outer {
        color: black;
        width: 700px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 150px;
        height: 1000px;
    }
</style>
<title>Web Socket Example</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="outer">
		<form action="<%=contextPath%>/chatting.me" method="post">
			<input id="user" type="text" value="<%=nickName%>" readonly> 
			<input id="sender" type="hidden" value="<%=sender%>" readonly> 
			<input id="textMessage" type="text"> 
			<input id="opponent" type="text" value="admin" readonly>
			<input id="receiver" type="hidden" value="2" readonly> 
			<input onclick="sendMessage()" value="Send" type="button"> 
			<input onclick="disconnect()" value="Disconnect" type="button"> 
			<br>
			<input id="chatData" name="chatData" value="" size="50" placeholder="대화내용확인 용도" readonly>
			<button type="submit">나가기</button>
		</form>
		<br>
		<textarea id="messageTextArea" rows="10" cols="50"></textarea>
	</div>
	<script type="text/javascript">
		var webSocket = new WebSocket("ws://localhost:8888/meister/broadsocket");
		var messageTextArea = document.getElementById("messageTextArea");
		let msgArr = [];
		webSocket.onopen = function(message) {
			messageTextArea.value += "연결되었습니다...\n";
		};
		webSocket.onclose = function(message) {
			messageTextArea.value += "Server Disconnect...\n";
		};
		webSocket.onerror = function(message) {
			messageTextArea.value += "error...\n";
		};
		webSocket.onmessage = function(message) {
			messageTextArea.value += message.data + "\n";
		};
		function sendMessage() {
			var user = document.getElementById("user");
			var sender = document.getElementById("sender");
			var opponent = document.getElementById("opponent");
			var receiver = document.getElementById("receiver");
			var message = document.getElementById("textMessage");
			var data = document.getElementById("chatData");

			messageTextArea.value += user.value + "(나) => " + message.value
					+ "\n";

			if (data.value != "") {
				data.value += ",";
			}

			data.value += sender.value;
			data.value += ",";
			data.value += receiver.value;
			data.value += ",";
			data.value += message.value;

			webSocket.send("{{" + user.value + "}}" + message.value);
			message.value = "";
		}
		function disconnect() {
			webSocket.close();
		}
	</script>
</body>
</html>
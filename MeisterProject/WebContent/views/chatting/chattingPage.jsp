<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.chatting.model.vo.Chatting" %>
<%
	String nickName = (String) request.getAttribute("nickname");
	int userNo = (Integer) request.getAttribute("userNo");
	ArrayList<Chatting> list = (ArrayList<Chatting>) request.getAttribute("list");
	String[] nickNameList = (String[]) request.getAttribute("nickNameList");
	int count = 0;
	int	myCnt = 0;
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
        height: 500px;
        background: "aliceblue";
        border: "1px solid black";
    }
    .chat-format {
        color: black;
        width: 700px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 150px;
        height: 100px;
    }
    #textMessage{
    	width: 500px;
    }
    #profile{
    	width: 50px;
    	height: 50px;
    	border-radius:100px / 100px;
    	line-height: 120px;
    	margin-left: 10px;
    	margin-right: 5px;
    	border: 1px solid black;
    }
    #triangle{
	   	width: 0;
		height: 0;
		margin-top: 15px;
		border-bottom: 10px solid transparent;
		border-top: 10px solid transparent;
		border-left: 10px solid black;
		border-right: 10px solid transparent;
    }
    #triangleLeft{
	   	width: 0;
		height: 0;
		margin-top: 15px;
		border-bottom: 10px solid transparent;
		border-top: 10px solid transparent;
		border-left: 10px solid transparent;
		border-right: 10px solid black;
    }
    #myDiv{
    	width: 300px;
    	height: 50px;
    	line-height: 50px;
    	margin: auto;
    	border: 1px solid black;
    	position: static;
    }
    #nickName{
    	width: 700px;
    	height: 30px;
    	text-align: right;
    }
    #oppNickName{
    	width: 700px;
    	height: 30px;
    	text-align: left;
    }
</style>
<title>Web Socket Example</title>
</head>

<body>
	<%@include file="../common/header.jsp"%>
	<script>
		
		<% if(!list.isEmpty()){ %>
			<%for(Chatting c : list){ %>
				<%if(c.getSender() == userNo){%>
					$(document).ready(function() {	
						$('.outer').append(
							$('<div>').prop({
								id: 'divEntry<%=c.getChatNo()%>'
							})
						);
							
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'profile'
							})
						);
						    
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'triangle'
							})
						);
						    
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'myDiv',
								innerHTML: '<%=c.getChatContent()%>'
							})
						);
						    
						$('#divEntry<%=c.getChatNo()%> >div').css({'float': 'right'});	
						$('#divEntry<%=c.getChatNo()%>').css({'width': '700px', 'height': '50px'});
						
						$('.outer').append(
							$('<div>').prop({
								id: 'nickName',
								innerHTML: '<%=nickNameList[count]%>'
							})
						);
					});
				<%} else{%>
					$(document).ready(function() {	
						$('.outer').append(
							$('<div>').prop({
								id: 'divEntry<%=c.getChatNo()%>'
							})
						);
							
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'profile'
							})
						);
						
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'triangleLeft'
							})
						);
						
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'myDiv',
								innerHTML: '<%=c.getChatContent()%>'
							})
						);    
						    
						$('#divEntry<%=c.getChatNo()%> >div').css({'float': 'left'});	
						$('#divEntry<%=c.getChatNo()%>').css({'width': '700px', 'height': '50px'});
						
						$('.outer').append(
							$('<div>').prop({
								id: 'oppNickName',
								innerHTML: '&nbsp;&nbsp;<%=nickNameList[count]%>'
						})
					);
				});
				<%} %>
				<% count += 1;%>
			<%}%>
		<%} %>
	</script>
	<div class="outer">
		<form action="<%=contextPath%>/chatting.me" method="post">
<%-- 			<input id="user" type="text" value="<%=nickName%>" readonly>  --%>
			<input id="sender" type="hidden" value="<%=userNo%>" readonly> 
			<input id="opponent" type="text" value="admin" readonly>
			<input id="receiver" type="hidden" value="1" readonly>  
<!-- 			<input onclick="disconnect()" value="Disconnect" type="button">  -->
			<br>
			<input id="chatData" type="hidden" name="chatData" value="" size="50" placeholder="대화내용확인 용도" readonly>
		</form>
		<br>
	</div>
	<div class="chat-format">
		<input id="textMessage" type="text" value=""> 
		<input onclick="sendMessage()" value="Send" type="button">
		<button type="submit">저장하기</button>	
	</div>
	<script type="text/javascript">
		var webSocket = new WebSocket("ws://localhost:8888/meister/broadsocket");
		let count = 0;
		var data = document.getElementById("chatData");
		let cnt = 0;
		let oppCnt = 0;
		if(<%=!list.isEmpty()%>){
			count = <%=list.get(list.size()-1).getChatNo()%>+1;
		}
		console.log(count);
		
		webSocket.onopen = function(message) {
			console.log("onopen");
		};
		webSocket.onclose = function(message) {
			console.log("onclose");
		};
		webSocket.onerror = function(message) {
			console.log("onerror");
		};	
		webSocket.onmessage = function(message) {
			var msg = message.data.indexOf('>');
			let text = message.data.substr(msg+2);
			let name = message.data.substr(0, msg-2);
			var data = document.getElementById("chatData");
			
			$(document).ready(function() {	
				$('.outer').append(
					$('<div>').prop({
						id: 'divOpp'+oppCnt
					})
				);
				
				$('#divOpp'+oppCnt).append(
					$('<div>').prop({
						id: 'profile'
					})
				);
				
				$('#divOpp'+oppCnt).append(
					$('<div>').prop({
						id: 'triangleLeft'
					})
				);
				
				$('#divOpp'+oppCnt).append(
					$('<div>').prop({
						id: 'myDiv',
						innerHTML: text
					})
				);    
				
				$('#divOpp'+oppCnt+'>div').css({'float': 'left'});	
				$('#divOpp'+oppCnt).css({'width': '700px', 'height': '50px'});
				
				$('.outer').append(
					$('<div>').prop({
						id: 'oppNickName',
						innerHTML: name
					})
				);
				oppCnt += 1;
			});
			
			if (data.value != "") {
				data.value += ",";
			}
			data.value += receiver.value;
			data.value += ",";
			data.value += sender.value;
			data.value += ",";
			data.value += text;
		};
		
		function sendMessage() {
			var user = document.getElementById("user");
			var sender = document.getElementById("sender");
			var opponent = document.getElementById("opponent");
			var receiver = document.getElementById("receiver");
			var message = document.getElementById("textMessage");
			var data = document.getElementById("chatData");
			if (data.value != "") {
				data.value += ",";
			}

			data.value += sender.value;
			data.value += ",";
			data.value += receiver.value;
			data.value += ",";
			data.value += message.value;
			webSocket.send("{{" + user.value + "}}" + message.value);
			
			let msgVal = message.value;
			
			console.log(cnt);
			$(document).ready(function() {			
				$('.outer').append(
				    $('<div>').prop({
				        id: 'divMe'+cnt
				    })
				);
			    
			    $('#divMe'+cnt).append(
			    	$('<div>').prop({
			    		id: 'profile'
			    	})
			    );
			    
			    $('#divMe'+cnt).append(
				    $('<div>').prop({
				        id: 'triangle'
				    })
				);
			    
			    $('#divMe'+cnt).append(
			        $('<div>').prop({
			            id: 'myDiv',
			            innerHTML: msgVal
			        })
			    );
			   
			    $('#divMe'+cnt+'>div').css({'float': 'right'});	
			    $('#divMe'+cnt).css({'width': '700px', 'height': '50px'});
			    
			    $('.outer').append(
				    $('<div>').prop({
				    	id: 'nickName',
				    	innerHTML: user.value
				    })
				);
			    cnt += 1;
			    console.log(cnt);
			});
			message.value = "";
		}
		function disconnect() {
			webSocket.close();
		}
		 window.onpopstate = function(event) {
			  history.back();
			  console.log('뒤로가기 체크'); 
		};

	</script>
</body>
</html>
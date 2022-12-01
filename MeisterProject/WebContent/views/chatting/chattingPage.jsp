<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.chatting.model.vo.Chatting, com.kh.common.model.vo.Attachment, java.time.LocalDate" %>
<%
	String nickName = (String) request.getAttribute("nickname");
	ArrayList<Chatting> list = (ArrayList<Chatting>) request.getAttribute("list");
	String[] nickNameList = (String[]) request.getAttribute("nickNameList");
	String oppNick = "";
	ArrayList<String> chatDate = (ArrayList<String>) request.getAttribute("dateList");
	ArrayList<String> timeList = new ArrayList<String>();
	ArrayList<String> dateList = new ArrayList<String>();
	int userNo = (Integer) request.getAttribute("userNo");
	int sellNo = (Integer) request.getAttribute("sellNo");
	int status = (Integer) request.getAttribute("status");
	int receiver = (Integer) request.getAttribute("receiver");
	int sender = (Integer) request.getAttribute("sender");
	
	if(userNo == receiver){
		receiver = sender;
	}
	
	LocalDate today = LocalDate.now();
	String nowDate = today.toString();
	nowDate = nowDate.replace("-", "");
	int idx  = 0;
	if(!chatDate.isEmpty()){
		idx = chatDate.get(0).indexOf(" ");
	}
	int hour = 0;
	String time = "";
	String date = "";
	
	for(int i = 0; i < chatDate.size(); i++){
		date = chatDate.get(i).substring(0, idx);
		date = date.replace("-", "");
		dateList.add(date);
	}
	
	for(int i = 0; i < chatDate.size(); i++){
		hour = Integer.parseInt(chatDate.get(i).substring(idx+1,idx+3));
		time = chatDate.get(i).substring(idx+3, chatDate.get(i).length());
		if(hour > 12){
			hour = hour - 12;
			time = ("오후 ".concat(Integer.toString(hour))).concat(time);
		}
		else{
			time = ("오전 ".concat(Integer.toString(hour))).concat(time);
		}
		timeList.add(time);
	}

	oppNick = (String) request.getAttribute("oppNick");
	
	Attachment opp = (Attachment) request.getAttribute("profileOpp");
	if(opp == null){
		opp = new Attachment();
	}
	int count = 0;
	int	myCnt = 0;
%>

<!DOCTYPE html>
<html>
<head>
<style>
	.outer {
        color: black;
        width: 800px;
        margin: auto;
        margin-top: 55px;
        margin-bottom: 50px; 
        height: 600px;
        overflow: scroll;
 		overflow-x: hidden;
    }
    .upside {
        color: black;
        width: 800px;
        margin: auto;
        margin-top: 100px;
        height: 100px;
    }
    .chat-format {
        color: black;
        width: 700px;
        margin: auto;
        margin-bottom: 50px;
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
		border-left: 10px solid orange;
		border-right: 10px solid transparent;
    }
    #triangleLeft{
	   	width: 0;
		height: 0;
		margin-top: 15px;
		border-bottom: 10px solid transparent;
		border-top: 10px solid transparent;
		border-left: 10px solid transparent;
		border-right: 10px solid skyblue;
    }
    #myDiv{
    	width: 300px;
    	height: 50px;
    	line-height: 50px;
    	margin: auto;
    	border: 2px solid orange;
    	position: static;
    	border-radius:30px / 100px;
    }
    #oppDiv{
    	width: 300px;
    	height: 50px;
    	line-height: 50px;
    	margin: auto;
    	border: 2px solid skyblue;
    	position: static;
    	border-radius:30px / 100px;
    }
    #divOpp{
    	width: 300px;
    	height: 50px;
    	line-height: 50px;
    	margin: auto;
    	border: 2px solid skyblue;
    	position: static;
    	border-radius:30px / 100px;
    }
    #divDate{
    	width: 700px;
    	height: 30px;
    	margin-bottom: 10px;
    	text-align: right;
    	border: 1px solid black;
    }
    #myTime{
    	width: 700px;
    	height: 30px;
    	margin-bottom: 10px;
    	text-align: right;
    }
    #oppTime{
    	width: 700px;
    	height: 30px;
    	margin-bottom: 10px;
    	text-align: left;
    }
    #profileImg{
    	margin-top: 50px;
    	width: 100px;
    	height: 100px;
    	margin: auto;
    	border: 1px gray solid; 
    	border-radius:100px / 100px;
    }
    #profileImg>img{
    	width: 100%;
    	height: 100%;
    	object-fit:cover;
    	border-radius:100px / 100px;
    	margin-bottom: 10px;
    }
    #opponent{
    	margin-top: 10px;
    	margin: auto;
    	width: 780px;
    	height: 30px;
    	text-align: center;
		border: none;
    }
</style>
<title>Web Socket Example</title>
</head>

<body>
	<%@include file="../common/header.jsp"%>
	<script>
		console.log('<%=oppNick%>');
		<% if(!list.isEmpty()){ %>
			<%for(Chatting c : list){ %>
				<%if(c.getSender() == userNo){%>
					$(document).ready(function() {	
						$('.outer').append(
							$('<div>').prop({
								id: 'divDate<%=c.getChatNo()%>',
								innerHTML: '<%=dateList.get(count).substring(0,4)%>' + '년 '+'<%=dateList.get(count).substring(4,6)%>'+'월 '+'<%=dateList.get(count).substring(6,8)%>'+'일'
							})
						);
						$('.outer').append(
							$('<hr>').prop({
								id: 'hr<%=c.getChatNo()%>'
							})
						);	
						$('.outer').append(
							$('<div>').prop({
								id: 'divEntry<%=c.getChatNo()%>'
							})
						);
<%-- 						$('#divEntry<%=c.getChatNo()%>').append( --%>
// 							$('<div>').prop({
// 								id: 'profile'
// 							})
// 						);
						
						$('#profile').append(
							$('<img>').prop({
								id: 'imgUser'
							})		
						)
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'triangle'
							})
						);
						    
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'myDiv',
								innerHTML: '&nbsp;&nbsp;&nbsp;<%=c.getChatContent()%>'
							})
						);
						<%if(count != 0 && dateList.get(count).equals(dateList.get(count-1))){%>
							$('#divDate<%=c.getChatNo()%>').hide();
							$('#hr<%=c.getChatNo()%>').hide();
						<%}%>

					    $('#divDate<%=c.getChatNo()%>').css({'width': '700px', 'height': '30px','margin-bottom': '10px', 'text-align': 'center'});
						$('#divEntry<%=c.getChatNo()%> >div').css({'float': 'right'});	
						$('#divEntry<%=c.getChatNo()%>').css({'width': '700px', 'height': '50px'});
						$('.outer').append(
							$('<div>').prop({
								id: 'myTime',
								innerHTML: '<%=timeList.get(count)%>&nbsp;&nbsp;&nbsp;&nbsp;'
							})
						);
					});
				<%} else{%>
					$(document).ready(function() {	
						$('.outer').append(
							$('<div>').prop({
								id: 'divDate<%=c.getChatNo()%>',
								innerHTML: '<%=dateList.get(count).substring(0,4)%>' + '년 '+'<%=dateList.get(count).substring(4,6)%>'+'월 '+'<%=dateList.get(count).substring(6,8)%>'+'일'
							})
						);	
						$('.outer').append(
								$('<hr>').prop({
								id: 'hr<%=c.getChatNo()%>'
							})
						);	
						$('.outer').append(
							$('<div>').prop({
								id: 'divEntry<%=c.getChatNo()%>'
							})
						);
							
<%-- 						$('#divEntry<%=c.getChatNo()%>').append( --%>
// 							$('<div>').prop({
// 								id: 'profile'
// 							})
// 						);
						
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'triangleLeft'
							})
						);
						
						$('#divEntry<%=c.getChatNo()%>').append(
							$('<div>').prop({
								id: 'oppDiv',
								innerHTML: '&nbsp;&nbsp;&nbsp;<%=c.getChatContent()%>'
							})
						);
						<%if(count != 0 && dateList.get(count).equals(dateList.get(count-1))){%>
							$('#divDate<%=c.getChatNo()%>').hide();
							$('#hr<%=c.getChatNo()%>').hide();
						<%}%>

				   		$('#divDate<%=c.getChatNo()%>').css({'width': '700px', 'height': '30px','margin-bottom': '10px', 'text-align': 'center'});
						$('#divEntry<%=c.getChatNo()%> >div').css({'float': 'left'});
						$('#divEntry<%=c.getChatNo()%>').css({'width': '700px', 'height': '50px'});
						$('.outer').append(
							$('<div>').prop({
								id: 'oppTime',
								innerHTML: '&nbsp;&nbsp;&nbsp;&nbsp;<%=timeList.get(count)%>'
						})
					);
				});
				<%} %>
				<% count += 1;%>
			<%}%>
		<%} else{%>
			조회된 문의가 없습니다
		<%}%>
	</script>
	<div class="upside">
		<br>
		<div id="profileImg">
			<img id="titleImage" src="<%=contextPath %>/<%=opp.getFilePath() %>/<%=opp.getChangeName() %>" alt="프로필">
		</div>
		<input id="user" type="hidden" value="<%=nickName%>" readonly> 
		<input id="sender" type="hidden" value="<%=userNo%>" readonly> 
		<input id="opponent" type="text" value="<%=oppNick %>" readonly>
	</div>
	<form action="<%=contextPath%>/chatting.me" method="post">
		<div class="outer">
				<input id="user" type="hidden" value="<%=nickName%>" readonly> 
				<input id="sender" type="hidden" value="<%=userNo%>" readonly> 
				<input id="opponent" type="hidden" value=<%=nickName %> readonly>
				<input id="receiver" name="receiver" type="hidden" value=<%=receiver %> readonly> 
				<input id="sellNo" name="sellNo" type="hidden" value=<%=sellNo %> readonly>  
	<!-- 			<input onclick="disconnect()" value="Disconnect" type="button">  -->
				<br>
				<input id="chatData" type="hidden" name="chatData" value="" size="50" placeholder="대화내용확인 용도" readonly>
			<br>
		</div>
		<div class="chat-format">
			<input id="textMessage" type="text" value=""> 
			<input id="sendBtn" onclick="sendMessage(); moveScroll();" value="Send" type="submit">
			<button type="submit">저장하기</button>	
		</div>
	</form>
	<script type="text/javascript">
		var webSocket = new WebSocket("ws://192.168.20.13:8888/meister/broadsocket");
		console.log(webSocket);
		let count = 0;
		let cnt = 0;
		let oppCnt = 0;
		var user = document.getElementById("user");
		var sender = document.getElementById("sender");
		var opponent = document.getElementById("opponent");
		var receiver = document.getElementById("receiver");
		var sellNo = document.getElementById("sellNo");
		var message = document.getElementById("textMessage");
		var data = document.getElementById("chatData");
		<% if (!list.isEmpty()) {%>
			count = <%=list.get(list.size()-1).getChatNo()%>+1;
		<% }%>
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
			let now = new Date();
			
			console.log(name == '<%=oppNick%>');
			$(document).ready(function() {
				$('.outer').append(
					$('<div>').prop({
						id: 'divOpp'+oppCnt
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
						innerHTML: '&nbsp;&nbsp;'+text
					})
				);    
				
				$('#divOpp'+oppCnt+'>div').css({'float': 'left'});	
				$('#divOpp'+oppCnt).css({'width': '700px', 'height': '50px'});
				
				
				$('.outer').append(
					$('<div>').prop({
						id: 'oppTime'+oppCnt,
						innerHTML: '&nbsp;&nbsp;&nbsp;&nbsp;'+now.toLocaleTimeString()
					})
				);
				
				$('#oppTime'+oppCnt).css({'width': '700px', 'height': '30px', 'margin-bottom': '10px', 'text-align': 'left'})
				
				if(<%=oppNick%> != name){
					$('#divOpp'+oppCnt).hide();
					$('#divOpp'+oppCnt+'>div').hide();
					$('#oppTime'+oppCnt).hide();
				}
				
				oppCnt += 1;
			});
			
			if (data.value != "") {
				data.value += ",";
			}
			data.value += receiver.value;
			data.value += ",";
			data.value += sender.value;
			data.value += ",";
			data.value += sellNo.value;
			data.value += ",";
			data.value += text;
		};
		
		function sendMessage() {
			let now = new Date();
			
			if (data.value != "") {
				data.value += ",";
			}

			data.value += sender.value;
			data.value += ",";
			data.value += receiver.value;
			data.value += ",";
			data.value += sellNo.value;
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
				        id: 'triangle'
				    })
				);
			    
			    $('#divMe'+cnt).append(
			        $('<div>').prop({
			            id: 'myDiv',
			            innerHTML: '&nbsp;&nbsp;'+msgVal
			        })
			    );
			   
			    $('#divMe'+cnt+'>div').css({'float': 'right'});	
			    $('#divMe'+cnt).css({'width': '700px', 'height': '50px'});			 
				
			    $('.outer').append(
				    $('<div>').prop({
				    	id: 'myTime',
				    	innerHTML: now.toLocaleTimeString()+'&nbsp;&nbsp;&nbsp;&nbsp;'
				    })
				);
			    cnt += 1;
			});
			message.value = "";
		}
		
		function disconnect() {
			webSocket.close();
		}
//  		const beforeUnloadListener = (event) => {
//  		  event.preventDefault();
//  		  return event.returnValue = "Are you sure you want to exit?";
//  		};
//  		window.addEventListener("beforeunload", beforeUnloadListener, {capture: true});
 		
 		function moveScroll(){
 			$(".outer").scrollTop($(".outer")[0].scrollHeight);
 		}
 		
		$(document).ready(function(){
			$(".outer").scrollTop($(".outer")[0].scrollHeight);
		});
	</script>
</body>
</html>
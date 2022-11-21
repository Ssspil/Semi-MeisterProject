<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.chatting.model.vo.Chatting" %>
<%
	ArrayList<Chatting> list = (ArrayList<Chatting>) request.getAttribute("list");
	String[] nickNameList = (String[]) request.getAttribute("nickNameList");
	int count = 0;
	int last = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
        color: black;
        width: 500px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 150px;
        height: 1000px;
    }
    #list{
    	width: 500px;
    	height: 150px;
    	margin: auto;
    	margin-top: 5px;
    	border-radius:30px / 100px;
    }
    #list>div{
    	width:100%;
    	height:100%;
    	margin-top:10px;
    	margin-left: 10px;
    }
    #list>div>input{
    	margin-top:5px;
    	border: none;
    	background-color: white;
    }
    #inputNick{
    	width: 200px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    }
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<script>
		<% if(!list.isEmpty()){ %>
			<%for(Chatting c : list){ %>
				$(document).ready(function() {				
					$('.outer').append(
						$('<div>').prop({
							id: 'divList<%=count%>'
						})
					);
					
					$('#divList<%=count%>').append(
						$('<form>').prop({
							method: 'post',
							action: '<%=contextPath %>/askToSeller.ch', 
							id: 'selectForm<%=count%>'
						})
					);
					$('#selectForm<%=count%>').append(
						$('<input>').prop({
							id: 'input',
							type: 'hidden',
							value: "<%=c.getSender() %>",
							name: 'sender'
						})
					);
					$('#selectForm<%=count%>').append(
						$('<input>').prop({
							id: 'inputNick',
							type: 'text',
							value: '            <%=nickNameList[count] %>',
							name: 'receiverNick'
						})
					);
					$('#selectForm<%=count%>').append(
						$('<input>').prop({
							id: 'input',
							type: 'hidden',
							value: "<%=c.getReceiver() %>",
							name: 'receiver'
						})
					);
					$('#selectForm<%=count%>').append(
						$('<input>').prop({
							id: 'input',
							type: 'text',
							value: "<%=c.getChatContent() %>",
							name: 'content'
						})
					);
					$('#selectForm<%=count%>').append(
						$('<input>').prop({
							id: 'input',
							type: 'hidden',
							value: "<%=c.getSellNo() %>",
							name: 'sellNo'
						})
					);
					$('#divList<%=count%>').css({'width': '500px', 'height': '50px', 'background-color': 'aliceblue', 'margin' :'auto', 'margin-bottom' : '5px'});
					$('#selectForm<%=count%>>input').css({'border': 'none', 'background-color': 'aliceblue'});
					$('#selectForm<%=count%>>input').attr({'readonly': 'true'});
					
					$('.outer').append(
						$('<hr>').prop({
							id: 'hr'
						})
					);
				});
				
				
				<%count += 1;%>
			<%}%>
		<%} %>
		

	</script>
	<div class="outer">
		<br>
		<h2><b>&nbsp;판매자 문의하기</b></h2>
		<br><hr><br>

	</div>
	<script>
		$(function(){
			$('[id^=divList]').click(function(){
				 $(this).find('form').submit();
				 console.log("div clicked");
			});
		})
	</script>
</body>
</html>
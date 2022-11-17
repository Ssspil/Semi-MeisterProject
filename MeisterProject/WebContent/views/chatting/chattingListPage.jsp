<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.chatting.model.vo.Chatting" %>
<%
	ArrayList<Chatting> list = (ArrayList<Chatting>) request.getAttribute("list");
	String[] nickNameList = (String[]) request.getAttribute("nickNameList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
        color: black;
        width: 700px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 150px;
        height: 1000px;
    }
    #list{
    	border: 1px solid black;
    	width: 500px;
    	height: 150px;
    	margin: auto;
    	margin-top: 15px;
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
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="outer">
	<br>
	<h2><b>&nbsp;판매자 문의하기</b></h2>
	<br><hr><br>
	<% if(list.isEmpty()){ %>
		<div>조회된 문의가 없습니다</div>
	<%} else{ %>
		<%for(Chatting c : list){ %>
			<form method="post" action="<%=contextPath %>/askToSeller.ch" id="selectForm">
				<div id="list">
					<div>
						&nbsp;&nbsp;
						<input type="hidden" name="sender" value="<%=c.getSender() %>">
						&nbsp;판매자 : <input type="text" name="receiverNick" value="" size="2" readonly><br>
						<input type="hidden" name="receiver" value="<%=c.getReceiver() %>" size="2" readonly>
						&nbsp;&nbsp;&nbsp;<input type="text" name="content" value="<%=c.getChatContent() %>" readonly><br>
						&nbsp;&nbsp;&nbsp;판매글 번호 : <input type="text" name="sellNo" value="<%=c.getSellNo() %>" size="2" readonly>
					</div>
				</div>
			</form>
		<%} %>
	<%} %>
	</div>
	<script>
		$('#list').click(function(){
			$('#selectForm').submit();
			console.log("div clicked");
		
		});
		
		$(document).ready(function({
			<%for(int i =0; i < nickNameList.length; i++){%>
			
				$('#receiverNick').attr('value', '<%=nickNameList[i] %>');
			<%} %>
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.chatting.model.vo.Chatting, java.time.LocalTime, java.time.LocalDate" %>
<%
	ArrayList<Chatting> list = (ArrayList<Chatting>) request.getAttribute("list");
	String[] nickNameList = (String[]) request.getAttribute("nickNameList");
	int userNo = (Integer) request.getAttribute("userNo");
	int count = 0;
	int last = 0;
	
	int idx = list.get(0).getChatDate().indexOf(" ");
	
	ArrayList<Integer> timeList = new ArrayList<Integer>();
	ArrayList<String> dateList = new ArrayList<String>();
	
	LocalDate today = LocalDate.now();
	LocalTime now = LocalTime.now();
	String nowDate = today.toString();
	
	int hour = 0;
	int min = 0;
	
	int currHour = now.getHour(); 
	int currMin = now.getMinute();
	
	int diffDate = 0;
	int diffHour = 0;
	int diffMin = 0;

	String date = "";
	
	for(int i = 0; i < list.size(); i++){
		date = list.get(i).getChatDate().substring(0, idx);
		date = date.replace("-", "");
		nowDate = nowDate.replace("-", "");
		diffDate = Integer.parseInt(nowDate) - Integer.parseInt(date);
		if(diffDate == 0){
			hour = Integer.parseInt(list.get(i).getChatDate().substring(idx+1, idx+3));
			diffHour = currHour - hour;
			
			if(diffHour == 0){
				min = Integer.parseInt(list.get(i).getChatDate().substring(idx+4, idx+6));
				diffMin = currMin - min;
				
				if(diffMin == 0){
					dateList.add("0분 전");
				}
				else{
					dateList.add(diffMin+"시간 전");
				}
			}
			else{
				dateList.add(diffHour+"시간 전");
			}
		}
		else{
			dateList.add(diffDate+"일 전");
		}
	}
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
    	width: 100px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    	margin-right: 30px;
    }
    #inputDate{
    	width: 400px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    	text-align: center;
    }
    #inputDate{
    	width: 130px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    	text-align: right;
    }
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<script>
		console.log('<%=dateList%>');

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
							value: '    <%=nickNameList[count] %>',
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
							id: 'inputContent',
							type: 'text',
							value: "<%=c.getChatContent() %>",
							name: 'content'
						})
					);
					$('#selectForm<%=count%>').append(
						$('<input>').prop({
							id: 'inputDate',
							type: 'text',
							value: "<%=dateList.get(count) %>",
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
							id: 'hr<%=count%>'
						})
					);
					
					<%if(userNo != c.getSender() && userNo != c.getReceiver()){%>
						$('#divList<%=count%>').hide();
						$('#selectForm<%=count%>').hide();
						$('#selectForm<%=count%>>input').hide();
						$('#hr<%=count%>').hide();
					<%}%>
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
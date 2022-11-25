<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.kh.sellboard.model.vo.*, com.kh.common.model.vo.*, java.util.ArrayList"%>
<%
    String cssPath = request.getContextPath();
	ArrayList<SellBoard> s = (ArrayList<SellBoard>) request.getAttribute("s");
	ArrayList<Attachment> at = (ArrayList<Attachment>) request.getAttribute("at");
	if(at == null){
		at.add(new Attachment());
	}
	int count = 0;
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
</head>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
   <style>
.header{
  box-sizing: border-box;
  height: 130px;
}
#main{
height:100%;
margin: auto;
width: 60%;
}
#main2{
    box-sizing: border-box;
    margin: auto;
    width: 95%;
}
#titleName{
font-size: 30px;
position: relative;
top: 10px;
left: 36px;
font-family: 'Nanum Gothic', sans-serif;
}
#body1{
    box-sizing: border-box;
    border-bottom: 3px solid black;
    height: 70px;
    margin: auto;
}
#contenthead{
    box-sizing: border-box;
    height: 60px;
}
#sellboard{
    height:230px;
    width: 220px;
    display: inline-block;
    margin-right:56px;
}
#page{
box-sizing: border-box;
border-bottom: 2px solid black;
border-top: 2px solid black;
margin: auto;
height: 50px;
}
#img{  
      width: 230px;
    height: 160px;

}
#title{
    float: right;
    font-family: 'Nanum Gothic', sans-serif;
    font-weight: bold;
}
#price{
    float: right;
    font-family: 'Nanum Gothic', sans-serif;
}
#category{
    color: lightgray;
}





</style>
</head>
<body>

<%@include file="../common/header.jsp" %>
  <div class="header"></div>
    <div id=main>        
        <div id="body1">
          <span id="titleName">내가 작성한 판매글</span>
        </div>    
        <div id="contenthead"></div>
        <div id="main2">                                                  

        </div>
        
	   <script>
	   		<%if(!s.isEmpty()){ %>
   				<%for(int i = 0; i < s.size(); i++){ %>  
   					$(document).ready(function() {
   						$('#main2').append(
   							$('<div>').prop({
   								id: 'sellboard<%=count%>'
   							})
   						);
   						
   						$('#sellboard<%=count%>').append(
   	   	   	   				$('<div>').prop({ 
   	   	   	   					id: 'category',
   	   	   	   					innerHTML: '분야>'+'<%=s.get(i).getInterestName() %>'
   	   	   	   				})
   	   	   	   			);
   						$('#sellboard<%=count%>').append(
   	   						$('<img>').prop({ 
   	   							id: 'img',
   	   							src: '<%=contextPath %>/<%=at.get(i).getFilePath() %>/<%=at.get(i).getChangeName() %>'
   	   						})
   	   					);
   						$('#sellboard<%=count%>').append(
   	   	   	   	   	   		$('<br>').prop({ 
   	   	   	   	   	   		})
   	   	   	   	   	   	);
   						$('#sellboard<%=count%>').append(
   	   	   	   	   			$('<div>').prop({ 
   	   	   	   	   				id: 'title',
   	   	   	   	   				innerHTML: '<%=s.get(i).getSellTitle() %>'
   	   	   	   	   			})
   	   	   	   	   		);
   						$('#sellboard<%=count%>').append(
   	   	   	   	   			$('<br>').prop({ 
   	   	   	   	   			})
   	   	   	   	   		);
   						$('#sellboard<%=count%>').append(
   	   	   	   	   	   		$('<div>').prop({ 
   	   	   	   	   	   			id: 'price',
   	   	   	   	   				innerHTML: '<%=s.get(i).getPrice() %>'+'원'
   	   	   	   	   	   		})
   	   	   	   	   	   	);
   						$('#sellboard<%=count%>').append(
   	   	   	   	   	   		$('<br>').prop({ 
   	   	   	   	   	   		})
   	   	   	   	   	   	);
   						$('#sellboard<%=count%>').append(
   	   	   	   	   	   	   	$('<input>').prop({ 
   	   	   	   	   	   	   		id: 'sno<%=count%>',
   	   	   	   	   	   	   		type: 'hidden',
   	   	   	   	   	   	   		name: 'sno',
   	   	   	   	   	   	   		value: '<%=s.get(i).getSellNo() %>'
   	   	   	   	   	   	   	})
   	   	   	   	   	   	);
   						$('#sellboard<%=count%>').css({'display': 'inline-block','height':'230px', 'width': '220px', 'margin-right':'56px'});

   					});
   					<%count += 1;%>
       			<%} %>
   			<%} else{%>
       			조회된 게시글이 없습니다
   			<%} %>

			
			$(function(){
				$('[id^=sellboard]').click(function(){	
					let sno = $(this).find('input').val();
					location.href = "<%=contextPath%>/detail.se?sno="+sno;					
				})	
			});
	   </script>
	   <br><br><br>
	   <div id="page">
	   페이징 처리 공간
	   </div>
	  
    </div>




<%@ include file="../common/footer.jsp"%>

</body>
</html>
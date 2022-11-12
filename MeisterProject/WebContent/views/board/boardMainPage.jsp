<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo" %>
<%
   ArrayList<Board> hotList = (ArrayList<Board>)request.getAttribute("hotList"); //핫 게시글 순위용
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   /*PageInfo pi = (PageInfo) request.getAttribute("pi");
   
   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style>
      .body{
            box-sizing: border-box;
            height: 100%;
            margin: auto;
            width: 800px;
        }
        .body2{
         box-sizing: border-box;
            height: 2000px;
        }
        #line{
            border: 4px solid rgb(255, 212, 0);
            }
        #body-1{
            box-sizing: border-box;
            height: 58px;
        }
        .bodyClick{
        	background-color:orange;
        }
        .bodyWrite_wrap{
        	box-sizing: border-box; 
        	margin: auto;
        	width: 800px;
        	
        }
        #body2-1{
            box-sizing: border-box; 
            margin: auto; 
            height: 1400px;
            width: 800px;
        }
        #body2-2{
            box-sizing: border-box;
            margin: auto; 
            height: 8%;
            padding: 5%;
        }
        #body2-3{
            box-sizing: border-box;
            margin: auto;
            height: 19%;
    
        }
        #body2-3-1{
            box-sizing: border-box;
            height: 100%;
            width: 33.3%;
            float: left;
        }
         #hot1{
            box-sizing: border-box;
             border: 2px solid black;
             background-color:  #f4f4f4;
            height: 200px;
            width: 225px;
            margin: auto;
            border-style: groove;
            border-radius: 18px;
        }
        #hot2{
           position: relative;
          top:28px;
           
        }
        #hotfooter{
            position: relative;
            left: 15px;
        }
        #body2-4{
            box-sizing: border-box;
            height: 19%;
            width: 100%;
            padding: 20px;
        }
        #date{
            color: grey;
            font-size: 14px;
            float: right;
        }
        #mainid{
            text-align: center;
            font-weight:bold;
            font-size: 50px;
            padding:120px;
        }
        #ge{
            box-sizing: border-box;
            border: 1px solid black;
            font-size: 27px;
            padding:8px 16px;
            float: left;
            border-style: groove;
            border-radius: 10px;
        }
        #ge:hover{
            background-color: orange;
        }
        #gung{
            border: 1px solid black;
            box-sizing: border-box;
            font-size:27px;
            padding:8px 12px;
            float: left;
            border-style: groove;
            border-radius: 10px;
        }
        #gung:hover{
            background-color: orange;
        }
        #textmade{
            float: right;
            margin: auto;
            padding: 15px;
        }
     
        #img1{
            position: relative;
            top: -35px;
            float: right;
            width: 10rem;
            height: 10rem;
        }
        #icon1,#ask{
            float: left;
        }
        #hottitle{
            margin: auto;
            text-align: center;
            padding-top: 30px;
        }
        #text{
            width:500px;
            height: 45px;
            overflow:hidden;
            text-overflow:ellipsis;
            display: -webkit-inline-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;  
        }
        #hottext{
            width:170px;
            height: 77px;
            display: -webkit-inline-box;
            overflow:hidden;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            position: relative;
            top:-20px;
            left: 15px;
            word-break: break-word;
            margin:auto;
        }
         .font{
            width:400px;
            display: -webkit-inline-box;
            overflow:hidden;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;
            font-weight:bold;
            font-size: 20px;
        }
          #hotfont{
            width:150px;
            display: -webkit-inline-box;
            overflow:hidden;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;
            font-weight:bold;
            font-size: 20px;
            position: relative;
            top: -20px;
            left: 18px;
        }
         .header2{
            box-sizing: border-box;
            width: 500px;
            height: 140px;
        }
        .header2{
            position: relative;
           
            box-sizing: border-box;
            margin: auto;
            top: -120px;
        }
       #search_form{
            width: 80%;
            height: 25%;
            margin: auto;
            position: relative;
            top: 150%;
        }
        #search_form > div {
            height: 100%;
            float: left;
        }
        #search_text{
            width: 80%;
        }
        #search_btn{
            box-sizing: border-box;
            width: 20%;
        }
        #search_form input{
            box-sizing: border-box;
            width: 100%;
            height: 100%;
        }
           .page{
            box-sizing: border-box;
            
            position: relative;
            
            
        }
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>



   <body>
    <div class="body">
        <h1 id="mainid">커뮤니티</h1>
        <div id="body-1" >
            <button id="ge" class="bodyClick" onclick="menuClick('ge')"><i class="bi bi-chat-square-text"></i> 게시판</button>
            <button id="gung" onclick="menuClick('gung')"><i class="bi bi-wechat" style="color:deepskyblue"></i> 궁금해요</button>
        </div>
    </div>
    <div id="line"></div>
       
       <div class="bodyWrite_wrap">     
       <div id="body2-2" align="right">
          <a href="<%=contextPath %>/insert.bo" class="btn btn-secondary" style="background-color:orange;"><i class="bi bi-pencil-square "> 글작성
          </i></a></div><hr>
        </div>
        <div class="body2" id="geBody">
            <div id="body2-1"> 
              <div id="body2-3">
                    <div id="body2-3-1"><br>
                         <a id="hotfont">어제 핫한글<i class="bi bi-fire" style="color:red;"></i></a><br>
                            <div id="hot1">
                                <div id="hot2">
                                <p id="hotfont"><%=hotList.get(0).getBoardTitle() %></p>
                                <p id="hottext"><%=hotList.get(0).getBoardContent() %></p>
                                <div id="hotfooter"><i class="bi bi-eye"></i> <%=hotList.get(0).getBoardCount() %>
                                <i class="bi bi-hand-thumbs-up"></i> <%=hotList.get(0).getBoardRecommend() %></div>
                                </div>
                            </div>
                    </div>
                    <div id="body2-3-1"><br><br>
                           <div id="hot1">
                              <div id="hot2">
                               <p id="hotfont"><%=hotList.get(1).getBoardTitle() %></p>
                               <p id="hottext"><%=hotList.get(1).getBoardContent() %></p>
                               <div id="hotfooter"><i class="bi bi-eye"></i> <%=hotList.get(1).getBoardCount() %>
                               <i class="bi bi-hand-thumbs-up"></i> <%=hotList.get(1).getBoardRecommend() %></div>
                               </div>
                           </div>
                   </div>
                    <div id="body2-3-1"><br><br>
                            <div id="hot1">
                                <div id="hot2">
                                <p id="hotfont"><%=hotList.get(2).getBoardTitle() %></p>
                                <p id="hottext"><%=hotList.get(2).getBoardContent() %></p>
                                <div id="hotfooter"><i class="bi bi-eye"></i> <%=hotList.get(2).getBoardCount() %>
                                <i class="bi bi-hand-thumbs-up"></i> <%=hotList.get(2).getBoardRecommend() %></div>
                                </div>
                            </div>
                        </div>
                    </div>
           
                <div id="body2-4"><hr>
                     <span class="font"><%=hotList.get(0).getBoardTitle() %> </span>
                    <div>
                        <br>
                  <p id="text"><%=hotList.get(0).getBoardContent() %></p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-eye"></i><%=hotList.get(0).getBoardCount() %>
                    <i class="bi bi-hand-thumbs-up"></i><%=hotList.get(0).getBoardRecommend() %></div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
                <div id="body2-4"><hr>
                     <span class="font">글제목</span>
                    <div>
                        <br>
                  <p id="text">글내용입니다</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-eye"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
                <div id="body2-4"><hr>
                    <span class="font"></span>
                    <div>
                        <br>
                  <p id="text">글작성</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-eye"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
                   <div id="body2-4"><hr>
                    <span class="font"></span>
                    <div>
                        <br>
                  <p id="text">글작성</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-eye"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
                   <div id="body2-4"><hr>
                    <span class="font"></span>
                    <div>
                        <br>
                  <p id="text">글작성</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-eye"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
                   <div id="body2-4"><hr>
                    <span class="font"></span>
                    <div>
                        <br>
                  <p id="text">글작성</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-eye"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
           
                <br>
                <hr>
            </div>
         
<!--       <div align="center" class="page"> -->
      
<%--          <% if(currentPage != 1) {%> --%>
<%--          <button onclick="doPageClick(<%=currentPage-1 %>)">&lt;</button> --%>
<%--          <%} %> --%>
         
<%--          <% for(int i = startPage; i <= endPage; i++) { %> --%>
<%--          	<% if(i != currentPage) { %> --%>
<%--          	<button onclick="doPageClick(<%=i%>)"><%=i %></button> --%>
<%--          <% } else{%> --%>
<%--          <button disabled><%=i %></button> --%>
<%--          <%} %> --%>
<%--         <%} %> --%>
        
<%--         <% if(currentPage != maxPage) { %> --%>
<%--         <button onclick="doPageClick(<%=currentPage+1 %>)">&gt;</button> --%>
<%--         <%} %> --%>
         
<!--      	 </div> -->
      
<!--       	<script> -->
<!--     	function doPageClick(currentPage) { -->
    	  
<%--     	  location.href = "<%=contextPath%>/list.bo?currentPage="+currentPage; --%>
<!--       }
<!--       </script> -->

        
        </div>
	<%@ include file="../board/pageMove.jsp" %>
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>

<script>
function menuClick(type){
	/* body2 : 게시판 , */
	if(type == "ge"){
		$("#geBody").show();
		$("#gungBody").hide();
		$("#ge").addClass("bodyClick");
		$("#gung").removeClass("bodyClick");
	}else if(type == "gung"){
		$("#geBody").hide();
		$("#gungBody").show();
		$("#gung").addClass("bodyClick");
		$("#ge").removeClass("bodyClick");
	}
}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.board.model.vo.*" %>
    
  <% 
  Board b = (Board) request.getAttribute("b"); %>
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
        #line{
            border: 4px solid rgb(255, 212, 0);
            }
        #body-1{
            box-sizing: border-box;
            height: 60px;
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
            width: 33%;
            float: left;
        }
        #body2-3-2{
        box-sizing: border-box;
        height: 100%;
        width: 33%;
        margin:auto;
        float: left;
        }
        #body2-3-3{
        box-sizing: border-box; 
        height: 100%;
        width: 34%;
        
        float: left;
        }
        #hot1{
            box-sizing: border-box;
             
             background-color:  #f4f4f4;
            height: 78%;
            width: 82%;
            margin: auto;
            border-style: groove;
            border-radius: 18px;
            box-shadow: 5px 5px 5px 5px gray;
        }
           #hottext{
            width: 220px;
            height: 217px;
            padding: 8px;
        } 
        #body2-4{
            box-sizing: border-box;
            height: 19%;
            width: 100%;
            padding: 20px;
        }
        #body2-4-1{
          position: relative;
          float:right;
          top:-28%;
        }
        #date{
            color: grey;
            font-size: 14px;
            position: relative;
            top:58%;
            left: 78%;
        }
        #body2-5{
            box-sizing: border-box;
            height: 19%;
            padding: 20px
        }
        #body2-6{
            box-sizing: border-box;
            height: 19%;
            padding: 20px
        }
        .spantext{
            box-sizing: border-box;
        }
        #mainid{
            text-align: center;
            font-weight:bold;
            font-size: 50px;
            padding:120px
        }
        #ge{
            box-sizing: border-box;
            font-size: 27px;
            background-color: orange;
            padding:8px 16px;
            float: left;
            border-style: groove;
            border-radius: 10px;
        }
        #ge:hover{
            background-color: orange;
        }
        #gung{
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
          width: 11rem;
          height: 11rem;
            vertical-align: middle;
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
            width: 450px;
            position: relative;
            top: 15%;
        }
        #titlefooter{
            position: relative;
            top:50%;
        }
        .font{
            font-weight:bold;
            font-size: 20px;
        }
     #hotfont{
            font-weight:bold;
            font-size: 20px;
            position: relative;
            top: -15px;
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
            position: absolute;
            right: 0;
            left: 0;
            top: 0;
            bottom: 0;
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
            margin: auto;
            position: relative;
            top: -80px;
        }
        
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>



    <div class="body" >
        <h1 id="mainid">커뮤니티</h1>
        <div id="body-1" >
            <button id="ge"><i class="bi bi-chat-square-text"></i> 게시판</button>
            <button id="gung"><i class="bi bi-wechat" style="color:deepskyblue"></i> 궁금해요</button>
        </div>
    </div>
    <div id="line"></div>
            
        <div class="body2">
            <div id="body2-1"> 

                <div id="body2-2" align="right">
                <a href="<%=contextPath %>/insert.bo" class="btn btn-secondary" style="background-color:orange;"><i class="bi bi-pencil-square "> 글작성
                </i></a></div><hr>
                <div id="body2-3">
                    <div id="body2-3-1"><br>
                         <a id="hotfont">어제 핫한글<i class="bi bi-fire" style="color:red;"></i></a><br>
                            <div id="hot1">
                                <div id="hottext">
                                <p class="font">글 제목</p>
                                <p>글 내용글 내용글 내용글 내용내용글 내용</p><br>
                                <p id="hotfooter"><i class="bi bi-chat-dots"></i> 5 <i class="bi bi-hand-thumbs-up"></i> 5</p>
                               </div>
                            </div>
                    </div>
                    <div id="body2-3-2"><br><br>
                        <div id="hot1">
                            <div id="hottext">
                            <p class="font">글 제목</p>
                            <p>글 내용글 내용글 내용글 내용내용글 내용</p><br>
                            <p id="hotfooter"><i class="bi bi-chat-dots"></i> 5 <i class="bi bi-hand-thumbs-up"></i> 5</p>
                           </div>
                        </div>
                    </div>
                    
                    <div id="body2-3-3" ><br><br>
                        <div id="hot1">
                            <div id="hottext">
                            <p class="font">글 제목</p>
                            <p>글 내용글 내용글 내용글 내용내용글 내용</p><br>
                            <p id="hotfooter"><i class="bi bi-chat-dots"></i> 5 <i class="bi bi-hand-thumbs-up"></i> 5</p>
                           </div>
                        </div>
                    </div>
                </div>
                <div id="body2-4"><hr>
                  
                    <a class="font">글제목</a>
                  <p id="text">ㅇㅇ
                 </p>
                   <span id="titlefooter"><i class="bi bi-chat-dots"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</span>
                   <span id="date">2시간전</span>
                <div id="body2-4-1">
                        <img src="resources/image/peng.jpg" id="img1">
                        
                    </div>
                </div>
                <div id="body2-5"><hr>
                     <a class="font">글제목</a>
                  <p id="text">글내용글내용글내용</p>
                   <span id="titlefooter"><i class="bi bi-chat-dots"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</span>
                   <span id="date">2시간전</span>
               
                <div id="body2-4-1">
                        <img src="resources/image/peng.jpg" id="img1">
                </div>
                </div>
                <div id="body2-6"><hr>
                    <a class="font">글제목</a>
                  <p id="text">글내용</p>
                   <span id="titlefooter"><i class="bi bi-chat-dots"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</span>
                   <span id="date">2시간전</span>
               
                <div id="body2-4-1">
                        <img src="resources/image/peng.jpg" id="img1">
                	</div>
                </div>
                <hr>
            </div>
             <div class="search_main">
                    <div class="header2">
                        <form action="test.do" id="search_form">
                            <div id="search_text">
                            <input type="text" name="keyword">
                        </div>
                        <div id="search_btn">
                           <button type="button"  class="btn btn-secondary" style="background-color: orange;"><i class="bi bi-search"></i>검색</button>
                    </div>
                    </form>
                
                </div>
                <div class="page" align="center" ><i class="bi bi-caret-left-square"></i>
                <input type="button">
                <input type="button">
                <input type="button">
                <input type="button">
                <input type="button">
                <input type="button">
                <input type="button">
                <input type="button">
                <input type="button">
           	<i class="bi bi-caret-right-square"></i>

                </div>
            
           
            
        </div>
        
        
  
        
   
  
   
















	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
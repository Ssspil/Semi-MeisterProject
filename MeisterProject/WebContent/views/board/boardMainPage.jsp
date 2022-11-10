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
            height: 58px;
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
            top: -30px;
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
            height: 65px;
            display: -webkit-inline-box;
            overflow:hidden;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            position: relative;
            top:-14%;
            left: 15px;
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



   <body>
  
    <div class="body" >
        <h1 id="mainid">커뮤니티</h1>
        <div id="body-1" >
            <button id="ge"><i class="bi bi-chat-square-text"></i> 게시판</button>
            <button id="gung"><i class="bi bi-wechat" style="color:deepskyblue"></i> 궁금해요</button>
        </div>
    </div>
    <div id="line"></div>
            <div class="body-2">
                
            </div>
        <div class="body2">
            <div id="body2-1"> 

                
                <div id="body2-2" align="right">
                <a href="<%=contextPath %>/insert.bo" class="btn btn-secondary" style="background-color:orange;"><i class="bi bi-pencil-square "> 글작성
                </i></a></div><hr>
              <div id="body2-3">
                    <div id="body2-3-1"><br>
                         <a id="hotfont">어제 핫한글<i class="bi bi-fire" style="color:red;"></i></a><br>
                            <div id="hot1">
                                <div id="hot2">
                                <p id="hotfont">글 제목</p>
                                <p id="hottext">글내용입니다</p>
                                <div id="hotfooter"><i class="bi bi-chat-dots"></i> 5 <i class="bi bi-hand-thumbs-up"></i> 5</div>
                                </div>
                            </div>
                    </div>
                    <div id="body2-3-1"><br><br>
                           <div id="hot1">
                              <div id="hot2">
                               <p id="hotfont">글 제목</p>
                               <p id="hottext">글내용입니다</p>
                               <div id="hotfooter"><i class="bi bi-chat-dots"></i> 5 <i class="bi bi-hand-thumbs-up"></i> 5</div>
                               </div>
                           </div>
                   </div>
                    <div id="body2-3-1"><br><br>
                            <div id="hot1">
                                <div id="hot2">
                                <p id="hotfont">글 제목</p>
                                <p id="hottext">글내용입니다</p>
                                <div id="hotfooter"><i class="bi bi-chat-dots"></i> 5 <i class="bi bi-hand-thumbs-up"></i> 5</div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div id="body2-4"><hr>
                    <a class="font">글제목</a>
                    <div>
                        <br>
                  <p id="text">글내용입니다</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-chat-dots"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
                <div id="body2-4"><hr>
                    <a class="font">글제목</a>
                    <div>
                        <br>
                  <p id="text">글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-chat-dots"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div>
                <div id="body2-4"><hr>
                    <a class="font">글제목</a>
                    <div>
                        <br>
                  <p id="text">글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다글내용입니다</p>
                  <img src="resources/image/peng.jpg" id="img1">
                </div><br><br><br>
                <div id="titlefooter">
                    <div><i class="bi bi-chat-dots"></i> 6 <i class="bi bi-hand-thumbs-up"></i> 6</div>
                    <span id="date">2시간전</span>
                 </div>
                </div><br>
                <hr>
            </div>
             <div class="search_main">
                    <div class="header2">
                        <form action="test.do" id="search_form">
                            <div id="search_text">
                            <input type="text" name="keyword">
                        </div>
                        <div id="search_btn">
                            <input type="button" value="검색" style="background-color: orange;">
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
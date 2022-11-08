<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      .body{
            box-sizing: border-box;
            height: 100%;
            margin: auto;
            width: 800px;
        }
        #body-1{
            box-sizing: border-box;
            height: 53px;
            
        }
        #body2-1{
            box-sizing: border-box; 
            margin: auto; 
            height: 1000px;
            width: 800px;
            
        }
        #body2-2{
            box-sizing: border-box;
            margin: auto; 
            height: 10%;
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
            background-color: lightgray;
            height: 75%;
            width: 80%;
            margin: auto;
            padding-top : 110px;
            padding-left : 140px;
            border-style: groove;
            border-radius: 25px;
        }
        #body2-4{
            box-sizing: border-box;
            height: 19%;
            width: 100%;
            padding: 15px;
        }
        #body2-4-1{
            box-sizing: border-box;
            height: 100%;
            width: 50%;
            padding: 5px;
            float: left;
        } 
        #body2-4-2{
            box-sizing: border-box;
            height: 100%;
            width: 50%;
            float: left;
        } 
        #date{
            border: 1px solid black;
            color: grey;
            font-size: 14px;
            
            
            
           
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
            border: 1px solid black;
            font-size: 27px;
            background-color: orange;
            padding:8px 16px;
            float: left;
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
            float: right;
            margin: auto;
            padding-top : 15px;
            padding-right : 40px;
        }
        #ddobong,#ask{
            float: left;
        }
        #hottitle{
            margin: auto;
            text-align: center;
            padding-top: 30px;
        }
    
</head>
<body>
<%@ include file="../common/header.jsp" %>

	
  <div class="body">
        <h1 id="mainid">커뮤니티</h1>
        <div id="body-1">
            <a id="ge">게시판</a>
            <a id="gung">궁금해요</a>
        </div>
            <div class="body-2">
                <div></div>
                <div></div>
            </div>
        </div>
        <div class="body2">
            <div id="body2-1"> 

                <div id="body2-2" align="right"><a href="<%=contextPath %>/insert.bo" class="btn btn-secondary">글작성</a></div><hr>
                <div id="body2-3">
                    <div id="body2-3-1"><br>
                        <span class="hotfont">어제 핫한글</span><br>
                        
                            <div id="hot1"></div>
                    </div>
                    <div id="body2-3-2"><br><br>
                        <div id="hot1"></div>
                    </div>
                    
                    <div id="body2-3-3"><br><br>
                        <div id="hot1"></div>
                    </div>
                </div>
                <div id="body2-4"><hr>
                    <div id="body2-4-1">
                        <a class="font">글제목</a><br><br>
                        <a>글내용</a><br><br>
                        <span class="spantext">
                            <input type="submit" id="ddabong">
                        </span>
                    </div>
                    <div id="body2-4-2">
                       <img src="resources/image/nuguri1.gif" id="img1" height="100px" width="350px">
                        <span id="date">1시간전</span>
                    </div>
                </div>
                <div id="body2-5"><hr>
                    <a class="font">글제목</a>
                </div>
                <div id="body2-6"><hr>
                    <a class="font">글제목</a>
                </div>
                <hr>
            </div>
           
            
        </div>
        
  
        
   
  
   














	<%@ include file="../common/footer.jsp" %>
</body>
</html>
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
        }
    
        .body-1{
            box-sizing: border-box;
            border: 1px solid black;  
            height: 20%;
            width: 100%;
        }
        .body2-1{
            box-sizing: border-box;
            border: 1px solid black; 
            margin: auto; 
            height: 960px;
            width: 50%;
        }
        .body2-2{
            box-sizing: border-box;
            border: 1px solid black;
            margin: auto; 
            height: 12%;
            padding: 4%;
           
        }
        .body2-3{
            box-sizing: border-box;
            
            height: 19%;
            padding: 20px
        }
        .body2-4{
            box-sizing: border-box;
             
            height: 19%;
            padding: 20px
        }
        .body2-5{
            box-sizing: border-box;
            height: 19%;
            padding: 20px
        }
        .body2-6{
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
        #ge, #gung{
            box-sizing: border-box;
            border: 1px solid black;
           margin: 150px;
        }
        #textmade{
            float: right;
            margin: auto;
            padding: 15px
        }


</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
여긴 커뮤니티 메인 페이지입니다.
	
 <div class="body">
        <div class="body-1">
            <h1 id="mainid">
                커뮤니티
            </h1>
            <span id="ge">게시판</span>
            <span id="gung">궁금해요</span>
            <div class="body-2">
                <div></div>
                <div></div>
            </div>
        </div>
        <div class="body2">
            <div class="body2-1"> 

                <div class="body2-2"><button type="button" id="textmade" >글작성</button></div>
                <div class="body2-3">
                    <a class="font">글제목</a><br><br>
                    <a>글내용글내용글내용글내용글내용</a><br><br><br><br><br>
                    <span><img src ="resources/image/passion.jpg" width="1px" height="25" alt ="6"></span>
                    
                    <span class="spantext"></span>
                </div>
                <div class="body2-4"><hr>
                    <a class="font">글제목</a>
                </div>
                <div class="body2-5"><hr>
                    <a class="font">글제목</a>
                </div>
                <div class="body2-6"><hr>
                    <a class="font">글제목</a>
                </div>
                <hr>
            </div>
           
            
        </div>
        
    </div>















	<%@ include file="../common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   <style>
   .header{
    box-sizing: border-box;
    height: 130px;
}
#main{

height:1400px;

}
#titlename{
    position: relative;
    left: 295px;
    height: 80px;
}
#body1{
    box-sizing: border-box;
    border-top: 2px solid black;
    border-bottom: 2px solid black;
    height: 80px;
    margin: auto;
    width: 60%;
}
#contenthead{
    box-sizing: border-box;
    height: 80px;
}
.content{
    box-sizing: border-box;
    border: 3px solid orange;
    border-radius: 30px;
    height:210px;
    width: 60%;
    margin: auto;
    padding: 15px;
}
#name1{
    box-sizing: border-box;
    margin: auto;
    height: 77px;
    width: 200px;
    float: left;
    background-color: white;
    border: 3px solid yellow;
    color:black;
}
#name1:hover{
    background-color: orange;
}
#name2{
    box-sizing: border-box;
    height: 77px;
    width: 200px;
    float: left;
    background-color: white;
     border: 3px solid yellow;
    color:black;
}
#name2:hover{
    background-color: orange;
}
#title{
float: left;
}
#titlepost{
float: left;
}
#titlepost1{
float: left;
position: relative;
left:100px;
width: 470px;
display: -webkit-inline-box;
overflow: hidden;
-webkit-box-orient: vertical;
-webkit-line-clamp: 1;

}
#body{
float: left;
}
#bodypost{
float: left;
}
#bodypost1{
float: left;
position: relative;
left:100px;
width: 470px;
display: -webkit-inline-box;
overflow: hidden;
-webkit-box-orient: vertical;
-webkit-line-clamp: 2;

}
#footer{
float: left;
width: 820px;
position: relative;
top: -15px;
}
#footerpost{
float: left;
}
#footerpost1{
float: left;
position: relative;
left:115px;
}
#footerpost2{
float: right;
}
#page{
box-sizing: border-box;
border-bottom: 2px solid black;
border-top: 2px solid black;
width: 60%;
margin: auto;
height: 50px;
}
</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
  <div class="header"></div>
    <div id=main>
    <h1 id="titlename">나의 커뮤니티</h1>

        <div id="body1">
            <div>
            <button class="bodyClick" id="name1" onclick="menuClick('name1')">내가 쓴 게시물</button>
        </div>
        <div>
            <button class="bodyClick" id="name2"  onclick="menuClick('name2')">내가 쓴 댓글</button>
            
        </div>

        </div>
        <div id="contenthead"></div>
        <div class="content" id="name1Body" >
            <div id="title"> 
                <div id="titlepost">커뮤니티 게시글 제목</div>
                <div id="titlepost1">게시글 제목d게시글 제목d게시글 제목d게시글 제목d게시글 제목d게시글 제목d게시글 제목d게시글 제목d게시글 제목d</div>
            </div>
            <br><br>
            <div id="body">
                <div id="bodypost">커뮤니티 게시글 내용</div>
                <div id="bodypost1">게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용</div>
            </div>
            <br><br><br><br><br>
            <div id="footer">
                <div id="footerpost">커뮤니티 작성 날짜</div>
                <div id="footerpost1">2022/11/18</div>
                <div id="footerpost2"><i class="bi bi-chat-dots"></i> 5 <i class="bi bi-hand-thumbs-up"></i> 5 </div>
            </div>
        </div>
        <%@ include file="../mypagein/myPageInMyReply.jsp"%>
<!--        여기부턴 댓글 -->
        
<br><br>
        <div id="page">
            페이징 처리공간
        </div>

</div>











<%@ include file="../common/footer.jsp"%>
<script>

   function menuClick(type) {
      /* body2 : 게시판 , */
      if (type == "name1") {
         $("#name1Body").show();
         $("#name2Body").hide();
         $("#name1").addClass("bodyClick");
         $("#name2").removeClass("bodyClick");
<!--          $("#type").val("1"); -->
<!--          $("#boardType").val("name1"); -->

      } else if (type == "name2") {
         $("#name2Body").show();
         $("#name1Body").hide();
         $("#name2").addClass("bodyClick");
         $("#name1").removeClass("bodyClick");
<!--          $("#type").val("2"); -->
<!--          $("#boardType").val("name2"); -->

      }
   }
   </script>
</body>
</html>
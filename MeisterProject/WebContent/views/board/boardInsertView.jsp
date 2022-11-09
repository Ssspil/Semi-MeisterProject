<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>

<%@ include file="../common/header.jsp" %>
  <style>
       
#header{
    box-sizing: border-box;
    width: 700px;
    height: 850px;
    margin: auto;
}
#header2{
    box-sizing: border-box;
    height: 130px;
  
}
#made{
    position: relative;
    top: -40px;
    left: 90%;
}
#file{
    box-sizing: border-box;
    background-color: lightblue;
    width: 700px;
    height: 50px;
}
#line{
    border: 4px solid rgb(255, 212, 0);
}
#icon{
    padding: 15px;
}
#font{
    font-size: 15px;
    color: black;
}
    </style>
</head>
<body>
    <div id="header">
       <div id="header2"></div>
        <h1>게시글 작성</h1>
         <form action="<%=contextPath %>/insert.bo" method="post" enctype="multipart/form-data">
         <button type="submit" id="made" >작성하기</button>
        <div id="line"></div><br><br>
        <div id="file">
            <p id="icon"><i class="bi bi-camera"><input type="file"></i></p>
        </div>
        <br>
        <input type="text" placeholder="게시글 제목을 입력해주세요"  name="title" size="60">
        <br><br><hr>

        <textarea  cols="94"rows="14" placeholder="게시글 내용을 입력해주세요" name="content" style="resize:none;">
            </textarea>
       </form>
    </div>
    
    



<%@ include file="../common/footer.jsp" %>
</body>
</html>
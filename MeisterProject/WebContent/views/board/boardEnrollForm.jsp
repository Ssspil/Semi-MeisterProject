<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <%
       int type = Integer.parseInt(request.getParameter("type"));
//     	Attachment at = (Attachment) request.getAttribute("at");
// 		if(at == null){
// 		at = new Attachment();
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
   body, form, div, h1, h2, h3, h4, p, span{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
   }
   #wrap {
/*       background: black; */

        

        height: 800px;
        margin: auto;
          padding-top: 105px;
   }
   #wrap2{
      min-height: 700px;
   }
   #enroll-form input {
      display: block;
      width: 100%;
   }
   
   #wrap-title {
      height: 100px;
       display: block;
   }
   #wrap-title2 {
      display: flex;
       align-items: center;
       justify-content: space-between;
       width: 60.625rem;
       height: 100%;
       margin: auto;
   }
   .file{
        box-sizing: border-box;
        margin: auto;
      position: relative;
        left:240px;
        top:20px;

    }
   #file {
     box-sizing: border-box;
      justify-content: center;
      height: 70px;
      width:1800px;
      padding: 15px;
      background-color: orange;
      margin: auto;
      border-top: 0.0625rem solid #f4f4f4;
      border-bottom: 0.0625rem solid #f4f4f4;
   }
   
   #file2 {
  box-sizing: border-box;
        margin: auto;
       
   }

   .file2Wrap{
      width: 1400px;
      min-width: 1400px;
      height: 100px;
      margin: 0 auto;
      position: relative;
      
   }
   .file2wrap2{
      position: absolute;
       top: 50px;
       transform: translateY(-50%);
       left: 16%;
   }
   #title {
      height: 100px;
       padding: 15px;
       display: block;
   }
   #title1 {
      display: flex;
       align-items: center;
       justify-content: space-between;
       width: 60.625rem;
       height: 100%;
       margin: auto;
       border-top: 1px solid orange;
      border-bottom: 1px solid orange;
   }
   .title {
      width: 100%;
      height: 100%;
      position: relative;
      border: 0;
      outline: none;
   }
   
   #content {
      height: 350px;
       padding: 15px;
       display: block;
   }
   
   #content2 {
      display: flex;
       align-items: center;
       justify-content: space-between;
       width: 60.625rem;
       height: 100%;
       margin: auto;
       border-top: 1px solid orange;
      border-bottom: 1px solid orange;
   }
   #content3 {
      width: 100%;
      height: 100%;
      resize: none;
      border: 0;
      outline: none;
      
   }
   .input-file-button{
      padding: 6px 25px;
      background-color:#FF6600;
      border-radius: 4px;
      color: white;
      cursor: pointer;
      position: relative;
     left: 15%;
   }
   
   #camera{
      width: 30px;
      height:30px;
   }
   
   #fileName{
    margin:auto;
      font-size: 17px;
       font-weight: bold;
     position: relative;
      top: 50%;
      right:-16%;
      
      color: #000;
      
   }
   #btn {
      background-color: white;
      width: 100px;
      height: 45px;
       color: orange;
       outline-color: rgb(248, 162, 3);
       border: solid;
       border-radius: 12px;
   }
   #btn:hover {
      background-color: orange;
      color: white;
   }
   #img {
      display: flex;
      justify-content: center;
      width: 100%;
      margin: 0.75rem;
   }
   
   .editor-image[data-a-2] {
            display: flex;
            justify-content: center;
            width: 100%;
            margin: 0.75rem;
        }
   .editor-image .editor-image-list[data-a-2] {
       display: inline-flex;
       flex-flow: row wrap;
       width: 60.625rem;
       padding-top: 0.75rem;
       align-items: center;
        }
   .editor-image .editor-image-list .image-preview[data-a-2] {
          display: inline-block;
          position: relative;
          margin-right: 0.75rem;
          margin-bottom: 0.75rem;
        }

</style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>
   <div id="wrap">
      <form id="enroll-form" action="<%=contextPath %>/insert.bo" method="post" enctype="multipart/form-data" style="height: 700px; font-weight: bold;">
         <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>"> 
      <div id="wrap2">
         <div id="wrap-title">
               <div id="wrap-title2" style="font-size:1">
                  <font style="font-size: 30px; font-weight: bold;">게시글 글작성</font>
                  <button   type="submit" id="btn" style="font-size: 20px; font-weight: bold;">등록</button>
                  <input type="hidden" name="type" value="<%=type %>">   
               </div>
               <div id="file">
                  <div id="file2">
                     <label class="input-file-button" for="input-file">
                        <i id="camera" class="bi bi-camera-fill"></i>
                     </label>
                     <input type="file" id="input-file" onchange="fileChange()"style=display:none>
                     <label id="fileName"></label>
                  </div>
               </div>
      <br>
               <div id="title">
                  <div id="title1">
               <input type="text" name="title" maxlength="30" class="title" size="100" placeholder="게시글 제목을 입력헤주세요." required>
                  </div>
               </div>
               <div></div>

				<div data-a-2 data-v-6 class="editor-image">
					<div data-a-2 class="editor-image-list">
						<div data-a-2 class="image-preview">
							<img id="titleImg" width="250" height="170">
						</div>
					</div>
				</div>

					<div id="content">
                  <div id="content2">
                     <textarea id="content3" maxlength="500" name="content" rows="10" placeholder="게시글 내용을 입력해주세요." required></textarea>
                  </div>
               </div>
            </div>
         </div>
      </form>
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
   
      
   <script>
      function fileChange(){
         $("#fileName").text($("#input-file")[0].files[0].name);
      }
   </script>
   
</body>
</html>
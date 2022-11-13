<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	#wrap {
/* 		background: black; */
        
        width: 1500px;
        height: 800px;
        margin: auto;
       	padding-top: 105px;
	}

	#wrap .btn {
		display:block;
		color: black;
	}
	#enroll-form input {
		display: block;
		width: 100%;
	}
	
	#wrap-title {
		height: 100px;
    	padding: 15px;
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
		height: 100px;
    	padding: 15px;
    	display: block;
	}
	
	#file2 {
		back
		display: flex;
	    align-items: center;
	    width: 1500px;
	    height: 100%;
	    border-top: 1px solid orange;
		border-bottom: 1px solid orange;
		background-color: aliceblue;
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
	}
	#camera{
		width: 30px;
		height:30px;
	}
	
	#fileName{
		padding-left:10px;
		font-size: 17px;
    	font-weight: bold;
	}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="wrap">
		<form id="enroll-form" action="<%=contextPath %>/insert.bo" method="post" enctype="multipart/form-data" style="height: 700px;">
<%-- 		<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>"> --%>
		<div id="wrap2">
			<div id="wrap-title">
					<div id="wrap-title2" style="font-size:1">
						<font style="font-size: 30px; font-weight: bold;">게시글 글작성</font>
						<button	type="submit" value="등록" class="btn" disabled="disabled" style="font-size: 20px; font-weight: bold;">등록</button>	
					</div>
					<div id="file">
						<div id="file2">
							<div class=file>
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
					<input type="text" name="title" class="title" size="30" placeholder="게시글 제목을 입력헤주세요.">
						</div>
					</div>
					<br>
					<div id="content">
						<div id="content2">
							<textarea id="content3" name="content" rows="10" placeholder="게시글 내용을 입력해주세요."></textarea>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
		
	<%@ include file="../common/footer.jsp" %>
</body>
</html>

<script>
function fileChange(){
	$("#fileName").text($("#input-file")[0].files[0].name);
}
</script>
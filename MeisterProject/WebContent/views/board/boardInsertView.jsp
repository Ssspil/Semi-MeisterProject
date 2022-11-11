<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	div {
		display: bloack;
	}
	#border{
        width: 1000px;
        height: auto;
        margin: auto;
        padding-top: 100px;
	}
	#made{
	    position: relative;
	    top: -40px;
	    left: 90%;
	}
	
	#file{
		box-sizing: border-box;
	    display: block;
	    justify-content: center;
	    height: 3.5rem;
	    padding: 1rem 1.25rem;
	    background-color: lightorange;
	    margin: 0 -16px;
	    border-top: 0.0625rem solid #f4f4f4;
	    border-bottom: 0.0625rem solid #f4f4f4;
	}
	
	#file2 {
		box-sizing: border-box;
	}
	.icon {
	    width: 100px;
	    height: 100px;
	    margin-right: 0.4375rem;
	    cursor: pointer;
	}
	.test {
		width: 100%;
	    height: 100%;
	    resize: none;
    	border: 0;
    	resize:none;
    	margin-bottom: 2rem;
	}
	.test2 {
		width: 100%;
	    height: 100%;
	    resize: none;
	    padding: 1.25rem 0;
    	border: 0;
    	resize:none;
    	margin-bottom: 2rem;
	}
	.test3 {
		width: 100%;
		margin-bottom: 6rem;
		
	}
	.test4 {
		width: 60.625rem;
    	margin: auto;
	}
	
	.test5 {
		width: 100%;
	    padding: 1.25rem 0;
	    margin: 0;
	}
	.text1 {
		position: absolute;
	    top: 1.25rem;
	    left: 0;
	    white-space: pre-line;
	    margin: 0;
	    z-index: -1;
	}
	
	.btn btn-secondary {
		font-weight: 500;
    	text-align: center;
    	user-select: none;
	    color: #c5c5c5;
	    background: #fff;
	    border: 0;
	    padding: 0 1rem 0 0;
	    cursor: default;
	}
	
	
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div id="border">
    	<br>
        <h1>게시글 작성</h1>
        <button id="made" type="button" disabled="disabled" class="btn btn-secondary">등록</button>
        <form>
	        <div id="file">
	        	<div id="file2">
		            <img class="icon" src="<%= contextPath %>/resources/image/camera.svg" />	        	
	        	</div>
	        </div>
	        <br>
	        <div class="test3">
	        	<div class="test4">
	        		<label class="test5">
	        			<input class="test2" type="text" placeholder="게시글 제목을 입력해주세요" size="60">		
	        		</label>
	        	</div>
	        	<div>
	        		<span>
		        		<textarea class="test" cols="94"rows="17" >
	            		</textarea>
	        		</span>
	        		
	        	</div>
	        </div>
	        
	        <br><br><hr>
	
	        
        </form>
    </div>
	
		
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
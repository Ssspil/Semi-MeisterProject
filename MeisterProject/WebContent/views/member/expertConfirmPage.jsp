<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이스터 신청하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<style>
	body {
		background-color: #DFDFDF;
	}
    form{
        background-color: #DFDFDF;
    }
	.outer {
		background-color : white;
        color: black;
        width: 700px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        height: 1300px;
    }
    #profileImg{
    	width: 250px;
    	height: 60px;
    	margin: auto;
    }
    #profileImg>img{
    	width: 100%;
    	height: 100%;
    }
   .genderBtn{
        background: linear-gradient(0deg, rgba(255,151,0,1) 0%, rgba(251,75,2,1) 100%);
    	border-radius: 6px;
        padding: 15px;
        width:205px;
        border: 3px solid orange;
        border-radius: 15px;
        font-weight: bold;
        font-family: 'Nanum Gothic', sans-serif;
    }
    .genderBtn:hover{
       background-color: orange;
       color: white;
    }
    .side{
    box-sizing: border-box;
    margin: auto;
    width: 60%;
}
    #img1{
 width: 400px;
    height: 120px;
    position: relative;
    left: 12px;

}
.outer input[type="text"], .outer #btn[type=submit] {
    	border-radius: 6px;
        padding: 15px;
        width:420px;
        margin-bottom: 5px;
        border: 1px solid orange;
        font-family: 'Nanum Gothic', sans-serif;
 }
 .outer input[type="email"]{
    	border-radius: 6px;
        padding: 15px;
        width: 261px;
        margin-bottom: 5px;
        border: 1px solid orange;
        float: left;
        font-family: 'Nanum Gothic', sans-serif;
 }
 .outer input[type="number"]{
    	border-radius: 6px;
        padding: 15px;
        width:118px;
        margin-bottom: 5px;
        border: 1px solid orange;
        float: left;
        font-family: 'Nanum Gothic', sans-serif;
 }
.outer select{
        border-radius: 6px;
        padding: 15px;
        width:132px;
        margin-bottom: 5px;
        border: 1px solid orange;
        float: left;
        text-align: center;
        font-family: 'Nanum Gothic', sans-serif;
    }
#emailFront {
        border-radius: 6px;
        padding: 15px;
        margin-bottom: 5px;
        border: 1px solid orange;
        float: left;
        font-family: 'Nanum Gothic', sans-serif;
}
#gol{
    text-align: left;
}
#numberselect{
    position: relative;
    top: 18px;
    left: 5px;
    width: 25px;
    float: left;
}
#file{
    border-radius: 6px;
        padding: 15px;
        width: 420px;
        margin-bottom: 5px;
        border: 1px solid orange;
        float: left;
}
 #img{
    box-sizing: border-box;
    width: 420px;
    height: 180px;
    border-radius: 15px;
 }
 .outer button[type="submit"]{
    	border: 3px solid orange;
        background: linear-gradient(0deg, rgba(255,151,0,1) 0%, rgba(251,75,2,1) 100%);
        width: 370px;
        height: 60px;
        border-radius: 15px;
        font-weight: bold;
        font-size: 18px;
        color: white;
 } .outer button[type="submit"]:hover{
    	background-color: orange;
        color: black;
 }

 #fileName{
  position: relative;
    left: 40px;
 }
 .bi-camera-fill::before {
    position: relative;
    left: 10px;
}

    
</style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<%
		String userId = loginUser.getUserId();
		int userNo = loginUser.getUserNo();
	%>
	
	<form action="<%=contextPath %>/expertSubmit.me" method="post" enctype="multipart/form-data">
		<div class="outer">
            <div class="side">
			<br>
			<h1 style="text-align: center">전문가 인증</h1> 
			
			<br><br>
			<div id="titleImg">
					<img src="<%=contextPath %>/resources/image/logo.png" id="img1">
			</div>
			<br><br>
			<input type="hidden" name="userNo" value="<%=userNo %>">
			<input type="hidden" name="userId" value="<%=userId %>">
			<h6><b><i class="bi bi-file-person"></i> 이름</b></h6> 
			<input type="text" name="userName" size="30" placeholder="이름을 입력해 주세요" maxlength="4" required>
			<br><br>
			<h6><b><i class="bi bi-people"></i> 성별</b></h6> 
			<button type="button" class="genderBtn" id="male">남자</button>
			<button type="button" class="genderBtn" id="female">여자</button>
			<input type="hidden" name="gender" id="gender" required>
			<br><br>
			<h6><b><i class="bi bi-envelope"></i> 이메일</b></h6> 
			<input type="text" name="emailFront" style="width:250px; float:left; height : 51px;" maxlength="24" required>
            <div id="numberselect">@</div>
			<select name="emailBack">
				<option selected>gmail.com</option>
				<option>naver.com</option>
				<option>daum.net</option>
			</select>
			<br><br><br>
			<h6><b><i class="bi bi-telephone"></i>  휴대폰 번호 : </b></h6> 
		
			<select>
				<option value="010"     selected disabled >010</option>
			</select>
			<div id="numberselect"><i class="bi bi-dash-lg"></i></div>
			<input type="number" name="phoneMid" size="4" required>
			<div id="numberselect"><i class="bi bi-dash-lg"></i></div>
			<input type="number" name="phoneLast" size="4" required>
			
			<br><br><br>
			<h6><b><i class="bi bi-list-stars"></i> 전문분야 : </b></h6> 
			
			<select name="speciality" id="speciality">
				<option value="10">영상</option>
				<option value="20">영화</option>
				<option value="30">게임</option>
				<option value="40">IT</option>
				<option value="50">운동</option>
				<option value="60">요리</option>
			</select>
			<br><br><br>
			<h6><b><i class="bi bi-card-image"></i> 첨부파일 : </b></h6>
            <div id="file">
                  <div id="file2">
                     <label class="input-file-button" id="file-btn" for="input-file">
                        <i id="camera" class="bi bi-camera-fill"></i> 
                     </label>
                     <input type="file" name="upfile" id="input-file" onchange="fileChange();"style=display:none>
                     <label id="fileName"></label>
                  </div>
               </div>
            <br><br><br><br><br>
			<img src="" id="img">
            <br><br><br>
			<div style="text-align:center">
				<button type="submit" id="nice">전문가 등록하기</button>
			</div>
		</div>
    </div>
	</form>
	<script>
		$(document).ready(function(){
			$(".genderBtn").on('click', function(e){
				if(e.target.id == 'male'){
					$("#male").css("background-color", "yellow");
					$("#female").css("background-color", "gray");
					$("#gender").attr("value", e.target.textContent);
				}
				else{
					$("#female").css("background-color", "yellow");
					$("#male").css("background-color", "gray");
					$("#gender").attr("value", e.target.textContent);
				}
			});
		});
	</script>
	<script>
       function fileChange(){
         $("#fileName").text($("#input-file")[0].files[0].name);
       }
       
       function readImage(input) {
    	    if (input.files && input.files[0]) {
    	        const reader = new FileReader();
    	        
    	        reader.onload = (e) => {
    	            const titleImg = document.getElementById('img');
    	            titleImg.src = e.target.result;
    	        }
    	        reader.readAsDataURL(input.files[0]);
    	    }
    	}
     	// 이벤트 리스너
     	document.getElementById('input-file').addEventListener('change', (e) => {
    	    readImage(e.target);
     	})
     	
     	
    </script>
   
	<hr>
	<%@include file="../common/footer.jsp" %>
</body>
</html>
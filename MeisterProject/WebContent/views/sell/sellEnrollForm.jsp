<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{
		border-bottom: 5px solid rgb(255, 212, 0);
	    padding-bottom: 16px;
	    margin-bottom: 10px;
	}
	input, textarea, select{
		border-radius: 6px;
		padding: 6px;
	}
	select{
		width: 40%;
	}
	#input1{
		width: 80%;
	}
	#input2{
		width: 80%;
		height: 80px;
	}
	label{
    padding:5px;
    font-size: 14px;
    margin: 10px;
	}
	#textarea1{
		width: 500px;
		height: 80px;
	}
	#textarea2{
		width: 500px;
		height: 300px;
	}
	#textarea3{
		width: 500px;
		height: 150px;
	}
	#btn1{
		display: block;
		margin: auto;
	}
	*:focus {
     outline: none;
     border: 3px solid rgb(255, 212, 0);
	}
	td{
		text-align : left;
		color: black;
	}
	#outer{
		width : 1500px;
		margin-top: 50px;
		
	}
	table{
		border-spacing: 5px;
  		border-collapse: separate;
	}
	.btn-upload {
	  width: 120px;
	  height: 30px;
	  background: #fff;
	  border: 1px solid rgb(77,77,77);
	  border-radius: 30px;
	  font-weight: 500;
	  cursor: pointer;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin-left: 10px;
	 
	}.btn-upload:hover {
		border: 2px;
	    background: rgb(255, 212, 0);
	    color: #fff;
	  }
	
	#file {
	  display: none;
	}
	input[type=checkbox], input[type=radio] {
    accent-color:rgb(255, 212, 0);
}
table tr td>b {
	color: black;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<br><br><br><br><br><br><br>
	
	<h2>마켓 글 등록</h2>
	
	<div id="outer">
	<form id="enroll-form" action="<%=contextPath %>/insert.se" method="post">
	<table class="tb1">
		<tr>
			<td>
			<b>카테고리 :</b>
			</td>
			<td>
			<select  required>
				<option style="text-align: center;" value="">관심분야 선택</option>
				<option style="text-align: center;" value="video">영상</option>
				<option style="text-align: center;" value="move">영화</option>
				<option style="text-align: center;" value="game">게임</option>
				<option style="text-align: center;" value="it">IT</option>
				<option style="text-align: center;" value="sports">운동</option>
				<option style="text-align: center;" value="cook">요리</option>
			</select>
			<br>
			<br>
			<select  required>
				<option style="text-align: center;" value="">지역 선택</option>
				<option style="text-align: center;" value="seoul">서울</option>
				<option style="text-align: center;" value="inchun">인천</option>
				<option style="text-align: center;" value="busan">부산</option>
				<option style="text-align: center;" value="ulsan">울산</option>
				<option style="text-align: center;" value="daejun">대전</option>
				<option style="text-align: center;" value="gwangju">광주</option>
				<option style="text-align: center;" value="gyeonggi">경기</option>
				<option style="text-align: center;" value="chungcheong">충북/충남</option>
				<option style="text-align: center;" value="jeolla">전북/전남</option>
				<option style="text-align: center;" value="gyeongsang">경북/경남</option>
				<option style="text-align: center;" value="jeju">제주</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
			<b>마켓 글 제목 :</b>
			</td>
			<td>
			<input type="text" id="input1" placeholder="등록할 제목을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
			<b>간단한 설명 작성 : </b>
			</td>
			<td>
			<input type="text" id="input2" placeholder="작성할 내용을 입력해주세요">
			</td>			
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
			<b>썸네일 등록 :</b> 
			</td>
			<td class="btn-upload">
				<br>
			<label for="file">
				<b>첨부파일</b>
			</label>
			<input type="file" name="file" id="file">
			</td>
		</tr>
		<tr>
			<td>
			
			</td>
			<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;썸네일 들어갈 곳
			</td>
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
			<b>모임 형태 :</b> 
			</td>
			<td>
			<input type="radio" id="rd1" class="rdo" name="onoff"><label for="rd1"><b>오프라인</b></label> <br>
			<input type="radio" id="rd2" class="rdo" name="onoff"><label for="rd2"><b>온라인</b></label>
			</td>
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
			<b>가격 정보 :</b> 
			</td>
			<td>
				<textarea id="textarea1" style="resize: none;" placeholder="가격 정보를 입력해주세요."></textarea>
			</td>
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
			<b>마켓 서비스 설명 :</b> 
			</td>
			<td>
				<textarea id="textarea2" style="resize: none;" placeholder="판매할 재능에 대한 구체적인 설명을 작성해주세요&#13;&#10;자유롭게 url이나 포트폴리오 이미지를 추가해주세요"></textarea>
			</td>
		</tr>
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
			<b>취소 및 환불 규정 :</b> 
			</td>
			<td>
				<textarea id="textarea3" style="resize: none;" placeholder="취소 및 환불 규정을 작성해주세요."></textarea>
			</td>
		</tr>
	</table>

		
	<br><br>
	<button id="btn1" type="submit" class="btn btn-warning" onclick="submitLogin();" style="text-align:center">등록하기</button>
	</form>
	</div>

	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
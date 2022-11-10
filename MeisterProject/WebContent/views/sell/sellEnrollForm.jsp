<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{
		border-bottom: 5px solid rgb(255, 212, 0);
	    padding-bottom: 16px;
	    margin-bottom: 8px;
	}
	input, textarea, select{
		border-radius: 6px;;
	}
	#input1{
		width: 220px;
	}
	#input2{
		width: 220px;
		height: 80px;
	}
	label{
    padding:5px;
    color:#222;
    font-family:corbel,sans-serif;
    font-size: 14px;
    margin: 10px;
	}
	#textarea1{
		width: 400px;
		height: 80px;
	}
	#textarea2{
		width: 400px;
		height: 300px;
	}
	#textarea3{
		width: 400px;
		height: 150px;
	}
	#btn1{
		display: block;
		margin: auto;
	}
	*:focus {
     outline: none;
     border: 1px solid orange;
	}
	.tb1{
		border: 1px solid;
	}
	
	
	
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<h3>마켓 글 등록</h3>

	카테고리 : 
	<span class="field">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>
			<select  required>
				<option style="text-align: center;" value="">&nbsp;관심분야 선택</option>
				<option style="text-align: center;" value="video">영상</option>
				<option style="text-align: center;" value="move">영화</option>
				<option style="text-align: center;" value="game">게임</option>
				<option style="text-align: center;" value="it">IT</option>
				<option style="text-align: center;" value="sports">운동</option>
				<option style="text-align: center;" value="cook">요리</option>
			</select>
		</span>
		<br><br>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select  required>
				<option style="text-align: center;" value="">&nbsp;지역 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
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
		</span>
	</span>
	<br><br>
	마켓 글 제목 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="input1" placeholder="등록할 제목을 입력해주세요">
	<br><br>

	간단한 설명 작성 : &nbsp;&nbsp;&nbsp;<input type="text" id="input2" placeholder="작성할 내용을 입력해주세요">
	<br><br>
	썸네일 등록 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" id="input3">
	<br><br>

	모임 형태 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<di id="rad"><input type="radio" id="rd1" name="onoff"><label for="rd1">오프라인</label>
	<input type="radio" id="rd2" name="onoff"><label for="rd2">온라인</label></di>
	<br><br>
	가격 정보 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea id="textarea1" style="resize: none;" placeholder="가격 정보를 입력해주세요."></textarea>
	<br><br>

	마켓 서비스 설명 : &nbsp;&nbsp;&nbsp;<textarea id="textarea2" style="resize: none;" placeholder="판매할 재능에 대한 구체적인 설명을 작성해주세요&#13;&#10;자유롭게 url이나 포트폴리오 이미지를 추가해주세요"></textarea>
	<br><br>
	취소 및 환불 규정 : &nbsp;&nbsp;<textarea id="textarea3" style="resize: none;" placeholder="취소 및 환불 규정을 작성해주세요."></textarea>

		
	<br><br>
	<button id="btn1" type="submit" class="btn btn-warning" onclick="submitLogin();" style="text-align:center">등록하기</button>	
	
	<table class="tb1">
		<tr>
			<td>
				가격 정보 : 
			</td>
			<td>
				<textarea id="textarea1" style="resize: none;" placeholder="가격 정보를 입력해주세요."></textarea>
			</td>
		</tr>
		<tr>
			<td>
				마켓 서비스 설명 : 
			</td>
			<td>
				ㄹㄹㄹ
			</td>
		</tr>
		<tr>
			<td>
				취소 및 환불 규정 : 
			</td>
			<td>
				fff
			</td>
		</tr>
	</table>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
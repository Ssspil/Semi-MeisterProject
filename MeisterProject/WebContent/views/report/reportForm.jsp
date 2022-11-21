<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<style>
	.outer{
		margin-top : 150px;
		height : 1000px;
	}
	.outer .container{
		width : 80%;
		height : 700px;
		margin : auto;
	}
	.reportTable{
	
		padding : 0;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.formHeaderText{
		font-family: 'Nanum Gothic', sans-serif;
	}
	.formHr{
		border : 1px solid darkgrey;
		width : 80%;
	}
	
	/* 선택창 css */
	.reportSelect {
		float : left;
		width : 300px;
	    border: 1px solid #C4C4C4;
	    box-sizing: border-box;
	    border-radius: 10px;
	    padding: 12px 13px;
	    font-family: 'Roboto';
	    font-style: normal;
	    font-weight: 400;
	    font-size: 14px;
	    line-height: 16px;
	}
	.reportSelect:focus{
	    border: 1px solid orange;
	    box-sizing: border-box;
	    border-radius: 10px;
	    outline: 3px solid #fff1e4;
	    border-radius: 10px;
	}
	
	/* 제목 css */
	.reportTitle{
		float : left;
		width:100%;
		height : 3rem;
		border: 1px solid #C4C4C4;
	    box-sizing: border-box;
	    border-radius: 10px;
	    padding-left : 15px;
	}
	.reportTitle:focus{
		border: 1px solid orange;
	    box-sizing: border-box;
	    border-radius: 10px;
	    outline: 3px solid #fff1e4;
	    border-radius: 10px;
	}

	/* 신고내용 css */
	.reportContent{
		border: 1px solid #C4C4C4;
	    box-sizing: border-box;
	    border-radius: 10px;
	    max-height: 500px;
	    resize: vertical;
	    padding-left : 15px;
		padding-top : 10px;
	}
	.reportContent:focus {
		border: 1px solid orange;
	    box-sizing: border-box;
	    border-radius: 10px;
	    outline: 3px solid #fff1e4;
	    border-radius: 10px;
	}
	
	/* 첨부파일 css */
	input[type=file]::file-selector-button {
	  width: 150px;
	  height: 30px;
	  background: #fff;
	  border: 1px solid rgb(77,77,77);
	  border-radius: 10px;
	  cursor: pointer;
	}
	 input[type=file]::file-selector-button:hover {
	    background: rgb(77,77,77);
	    color: #fff;
	  
	}
	
	
	
	/* 제출하기 버튼 */
	#report-form .report-submit{
		border : 1px solid orange;
		background-color : white;
		color : orange;
		border-radius : 5px;
	}
	#report-form .report-submit:hover{
		background-color : orange;
		color : white;
		font-family: 'Nanum Gothic', sans-serif;
		border-radius : 5px;
	}
</style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	
	<div class="outer">
		
		<div class="container">
			<br>
			<h1  class="formHeaderText" align="center">관리자에게 신고하기</h1>
			
			<br><hr class="formHr"><br>
			<form action="<%= contextPath %>/insert.re" method="post" name="report-form" id="report-form" enctype="multipart/form-data">
				<table class="reportTable" align="center">
					<tbody>
						<tr>
							<td colspan="2">
								<select class="reportSelect" name="reason" size="1">
									<option value="0" selected>카테고리선택</option>
									<option value="사기">사기</option>
									<option value="버그">버그</option>
									<option value="욕설">욕설</option>
									<option value="음란">음란</option>
									<option value="광고">광고</option>
									<option value="기타">기타</option>
								</select>	
							</td>
						</tr>
						<!-- 한줄 띄어쓰기 -->
						<tr>
							<td> </td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" class="reportTitle" name="reportTitle" placeholder="신고제목을 입력해주세요" required />
							</td>
						</tr>

						<!-- 한줄 띄어쓰기 -->
						<tr>
							<td> </td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows=7 cols=100 class="reportContent" placeholder="신고하는 내용을 상세하게 작성해주세요" required></textarea>
							</td>
						</tr>
						<!-- 한줄 띄어쓰기 -->
						<tr>
							<td> </td>
						</tr>
						<tr>
							<td width="400vw">
								<input type="file" name="reportFile" id="reportFile">
							</td>
							<td>
								<div id="repostThumnail">
									사진공간
								</div>
							</td>
						</tr>
					</tbody>
						
				</table>
					<br>
					<div align="center">
						<button type="submit" class="report-submit">제출하기</button>
					</div>
			</form>
		</div>
	</div>
	
	<%@include file="../common/footer.jsp" %>
	
	
	<script>
		$(function(){
			$('#report-form').submit(function(){
				if($('.reportSelect option').val() == 0){
					alert("카테고리를 선택해주세요!");
					return false;
				}		
			})
		})
	</script>
</body>
</html>
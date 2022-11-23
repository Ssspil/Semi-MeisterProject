<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.common.model.vo.Interest, com.kh.common.model.vo.Local"%>
    
<%
	ArrayList<Interest> interest = (ArrayList<Interest>) request.getAttribute("interest");
	ArrayList<Local> local = (ArrayList<Local>) request.getAttribute("local");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
	margin : 0;
	padding : 0;
	}
	div{
		/*border: 1px solid chartreuse;*/
		box-sizing: border-box;
		
	}
	.outer{
	       height: 1500px;
	       /* 상 , 우 , 하, 좌  띄우기 */
		margin: 150px 200px 20px 200px;
	}
	h2{
	border-bottom: 5px solid rgb(255, 212, 0);
    padding-bottom: 16px;
    margin-bottom: 8px;
	font-family: 'Nanum Gothic';
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
	
	td{
		text-align : left;
		color: black;
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
	  margin-left : 10px;
	 
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
	
	.tb1 *:focus {
		 outline: none;
     border: 3px solid rgb(255, 212, 0);
	}
	.cate{
		text-align: center;
	}
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="outer">
		<h2>마켓 글 등록</h2>
		
		<form id="enroll-form" action="<%=contextPath %>/insert.se" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="userNO" value="<%= loginUser.getUserNo() %>">
		<table class="tb1">
			<tr>
				<td>
				<b>모임 형태 :</b> 
				</td>
				<td>
				<input type="radio" id="rd1" class="rdo" name="onoff" data-category="local" required><label for="rd1"><b>오프라인</b></label> <br>
				<input type="radio" id="rd2" class="rdo" name="onoff" required><label for="rd2"><b>온라인</b></label>
				</td>
			</tr>
			<tr>
				<td>
				<b>카테고리 :</b>
				</td>
				<td>
				<select name="interest" id="interest_select" class="cate" required>
					<option style="text-align: center;" value="0">관심분야 선택</option>
					<!-- <option value="10">영상</option>
					<option style="text-align: center;" value="20">영화</option>
					<option style="text-align: center;" value="30">게임</option>
					<option style="text-align: center;" value="40">IT</option>
					<option style="text-align: center;" value="50">운동</option>
					<option style="text-align: center;" value="60">요리</option> -->
					<% for(Interest i : interest) { %>
								<option value="<%= i.getInterestNo() %>"><%= i.getInterestName() %></option>
								
							<%} %>
				</select>
					<!-- 선택하게 alert로 알려줘야함 막아야 -->
				<br>
				<br>
				<select name="local" id="local_select" class="cate" >
					<option style="text-align: center;" value="115">지역 선택</option>
					<!-- <option style="text-align: center;" value="5">서울</option>
					<option style="text-align: center;" value="15">인천</option>
					<option style="text-align: center;" value="25">부산</option>
					<option style="text-align: center;" value="35">울산</option>
					<option style="text-align: center;" value="45">대전</option>
					<option style="text-align: center;" value="55">광주</option>
					<option style="text-align: center;" value="65">경기</option>
					<option style="text-align: center;" value="75">충북/충남</option>
					<option style="text-align: center;" value="85">전북/전남</option>
					<option style="text-align: center;" value="95">경북/경남</option>
					<option style="text-align: center;" value="105">제주</option> -->
					<% for(Local l : local) { %>
								<option value="<%= l.getLocalNo() %>"><%= l.getLocalName() %></option>
								
							<%} %>
				</select>
				    <script>
					    $(function () {
					        $("#enroll-form").submit(function() {
					            if($("#interest_select").val() == 0) {
					                alert('관심분야를 선택해주세요.')    
					                
					                return false
					            }
					        });     
					    });
					    
					</script>
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
				<input name="sellTitle" type="text" id="input1" placeholder="등록할 제목을 입력해주세요" required>
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
				<input name="sellContent" type="text" id="input2" placeholder="작성할 내용을 입력해주세요" required>
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
				<input type="button" name="upfile" id="file" class="inpu">
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
				<td>
				<img id="titleImg" class="inpu" width="200" height="150">
				</td>
			</tr>
			<tr>
				<td>
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
					<textarea name="price" id="textarea1" style="resize: none;" placeholder="가격 정보를 입력해주세요." required></textarea>
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
					<textarea id="textarea2" name="sellDetail" style="resize: none;" placeholder="판매할 재능에 대한 구체적인 설명을 작성해주세요&#13;&#10;자유롭게 url이나 포트폴리오 이미지를 추가해주세요" required></textarea>
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
					<textarea id="textarea3" name="sellRegulation" style="resize: none;" placeholder="취소 및 환불 규정을 작성해주세요." required></textarea>
				</td>
			</tr>
		</table>
			
			
		<br><br>
		 <div id="file-area">
		<input type="file" id="file1" name="upfile" onchange="loadImg(this, 1);">
		</div>
	
		<script>
		$(function(){
			$("#file-area").hide();
			
			$(".inpu").click(function(){
				$("#file1").click();
			});
		});
		
		function loadImg(inputFile){
			
			if(inputFile.files.length != 0){
				
				let reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					
					 $("#titleImg").attr("src",e.target.result);
				}
				
			}else{
						
				 	$("#titleImg").attr("src",null);
				}
			}
				
		</script>
		
		<button id="btn1" type="submit" class="btn btn-warning" onclick="submitLogin();" style="text-align:center">등록하기</button>
		</form>
	</div>
	
	

	<script>
        let radios = document.querySelectorAll("[name=onoff]");
        let selects = document.querySelectorAll("[id$='_select']");

        for(let i = 0; i < radios.length; i++){
            radios[i].addEventListener("change", function(){

                for(let j = 1; j < selects.length; j++){
                    selects[j].style.display = "none";
                }

                document.querySelector("#" + this?.dataset?.category + "_select" ).style.display = "block";

            });
        }
    </script>
    
   
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
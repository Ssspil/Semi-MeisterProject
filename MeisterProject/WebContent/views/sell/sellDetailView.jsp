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
<title>판매 상세페이지</title>
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
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="outer">
		레츠고
		<div id="interest">		
			<% for(Interest i : interest) { %>
				<%= i.getInterestName() %>
			
			<%} %>
		</div>
		
		<table style="border: 1px solid;">
			<tr>
				<td>
				썸네일 부분
				</td>
				<td>
				sellTitle, 찜버튼, price, sellContent, 문의하기버튼, 구매하기 버튼
				</td>
			</tr>
			<tr>
				<td>
				서비스설명, 가격정보, 리뷰, 취소/환불
				</td>
				<td>
				
				</td>

			</tr>
		
		
		</table>
		
		
		
		
		
	
	</div>
	
	
	
	
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
	
	


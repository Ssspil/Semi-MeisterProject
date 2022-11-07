<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String cssPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cssPath %>/resources/css/myPage.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>

<body>
	<%@include file="../common/header.jsp" %>
	
	<%
		String userName = loginUser.getUserName();
		String email = loginUser.getEmail() == null? "NONE" : loginUser.getEmail();
		String nickname = loginUser.getNickName();
		String expert = loginUser.getExpert();
	%>
	
	<div class="outer">
		<br>
		<h2><b>&nbsp;마이페이지</b></h2>
		<br>
		<div class="profile">
			<table>
				<tr>
					<td rowspan="3" width="30"><img src="<%=contextPath %>/resources/image/logo.png"></td>
					<td>
						<input type="text" value="<%=userName %>" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" value="<%=nickname %>" readonly>
					</td>
					<td width="500px" align="right">
						<a id="editProfile" href="<%= contextPath %>/profile.me">정보 수정</a>
					</td>
				</tr>
				<tr>
					<td><input type="text" value="<%=email %>" readonly></td>
				</tr>
			</table>
		</div>
		<hr>
		<h4><b>&nbsp;전문가 인증하기</b></h4>
		<br>
		<%if(expert.equals("N")){ %>
			<h6><b><a href="<%=contextPath %>/expert.me">&nbsp;&nbsp;&nbsp;&nbsp;인증하기</a></b></h6>
		<%} else{%>
			<h6><b>인증이 완료된 계정입니다</b></h6>
		<%} %>
		<hr>
		<h4><b>&nbsp;내 마켓</b></h4>
		<br>
		<%if(expert.equals("Y")){ %>
			<h6><b><a href="<%=contextPath %>/sellList.se">&nbsp;&nbsp;&nbsp;&nbsp;판매 글 확인</a></b></h6>
		<%} else{%>
			<h6><b><a href="<%=contextPath %>/sellList.se" style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;판매 글 확인</a></b></h6>
		<%} %>
		<h6><b><a href="<%=contextPath %>/myTransaction.se">&nbsp;&nbsp;&nbsp;&nbsp;나의 거래 내역</a></b></h6>
		<h6><b><a href="<%=contextPath %>/wishList.se">&nbsp;&nbsp;&nbsp;&nbsp;내가 찜한 글</a></b></h6>
		<h6><b><a href="<%=contextPath %>/myReview.se">&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 리뷰</a></b></h6>
		<h6><b><a href="<%=contextPath %>/askToSeller.se">&nbsp;&nbsp;&nbsp;&nbsp;문의 내역 확인</a></b></h6>
		<hr>
		<h4><b>&nbsp;내 커뮤니티</b></h4>
		<br>
		<h6><b><a href="<%=contextPath %>/boardList.bo">&nbsp;&nbsp;&nbsp;&nbsp;내가 작성한 글</a></b></h6>
		<hr>
		<h4><b>&nbsp;고객센터</b></h4>
		<br>
		<h6><b><a href="<%=contextPath %>/??">&nbsp;&nbsp;&nbsp;&nbsp;1:1 문의하기</a></b></h6>
		<h6><b><a href="<%=contextPath %>/??">&nbsp;&nbsp;&nbsp;&nbsp;신고하기</a></b></h6>
		<h6><b><a href="<%=contextPath %>/noticeList.no">&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a></b></h6>
		<br>
	</div>
	<br>
	<hr>
	<%@include file="../common/footer.jsp" %>
</body>
</html>
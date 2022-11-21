<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.common.model.vo.Interest, com.kh.common.model.vo.Local,
    com.kh.sellboard.model.vo.SellBoard, com.kh.common.model.vo.Attachment"%>
<%
	ArrayList<Interest> interest = (ArrayList<Interest>) request.getAttribute("interest");	
	ArrayList<Local> local = (ArrayList<Local>) request.getAttribute("local");
	
	ArrayList<Attachment> list = (ArrayList<Attachment>) request.getAttribute("list"); 
	SellBoard s = (SellBoard) request.getAttribute("s");
	
	Attachment at = (Attachment) request.getAttribute("at");
	
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
		margin-top: 100px;
		line-height: 1.6;
	}
	div{
		/*border: 1px solid chartreuse;*/
		box-sizing: border-box;
		
	}
	.outer{
	       height: 750px;
	       /* 상 , 우 , 하, 좌  띄우기 */
			margin: 150px 200px 20px 200px;
			border: 1px solid;
	}
	.container{
		width: 500px;
	}
	ul.tabs li{
		background: none;
		color: mediumseagreen;
		display: inline-block;
		background: seashell;
		border-radius: 10px;
		padding: 10px 15px;
		cursor: pointer;
	}
	ul.tabs li.current{
		background: orange;
		color: white;
	}
	.tab-content{
		display: none;
		background: #ededed;
		padding: 100px;
	}
	.tab-content.current{
		display: inherit;
	}
	.left{
		width: 60%;
		float: left;
		box-sizing: border-box;
		background: wheat;
		padding: 5%;
	}
	.right{
		width: 40%;
		float: right;
		box-sizing: border-box;
		background: mediumaquamarine;
		padding: 5%;
	}
	.right-under{
		width: 40%;
		float: right;
		box-sizing: border-box;
		background: darkkhaki;
		
	}
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="outer">
		<section>
		<div class="left">
			<div>
				<a href="">관심분야</a>
				<span>
					<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0"><path xmlns="http://www.w3.org/2000/svg" d="M9.41421356,12 L15.7071068,5.70710678 C16.0976311,5.31658249 16.0976311,4.68341751 15.7071068,4.29289322 C15.3165825,3.90236893 14.6834175,3.90236893 14.2928932,4.29289322 L7.29289322,11.2928932 C6.90236893,11.6834175 6.90236893,12.3165825 7.29289322,12.7071068 L14.2928932,19.7071068 C14.6834175,20.0976311 15.3165825,20.0976311 15.7071068,19.7071068 C16.0976311,19.3165825 16.0976311,18.6834175 15.7071068,18.2928932 L9.41421356,12 Z" transform="translate(11.500000, 12.000000) scale(-1, 1) translate(-11.500000, -12.000000) "></path></svg>
				</span>
				<span id="interest">		
					<a color="textSecondary" href="" class="css-1arz1ip e1lsgt8r0"><%= s.getInterest() %></a>
				</span>
			</div>
			
			
				<section>
					<div>
					첨부파일이 들어갈 섹션<br>
					<img id="titleImg" width="500" height="200">
					<br>
					<%if(at == null)  {%>
						첨부파일이 없습니다.
					<%}else %>
						<a href="<%= contextPath %>/<%= at.getFilePath()+at.getChangeName() %>"
						download="<%= at.getOriginName() %>">
							<%= at.getOriginName() %>
						</a>
					</div>
				</section>

				<div class="container">

					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">서비스 설명</li>
						<li class="tab-link" data-tab="tab-2">가격 정보</li>
						<li class="tab-link" data-tab="tab-3" style="width: 70px; text-align: center;">리뷰</li>
						<li class="tab-link" data-tab="tab-4">취소/환불</li>
					</ul>
		
					<div id="tab-1" class="tab-content current">
						서비스 설명 부분
					</div>
					<div id="tab-2" class="tab-content">
						가격 정보 부분
					</div>
					<div id="tab-3" class="tab-content">
						리뷰가 나오게 값을 가져와야 하는데
						이 탭을 누르면 리뷰가
					</div>
					<div id="tab-4" class="tab-content">
						취소/환불 규정
					</div>
		
				</div>
		</div>

		<div class="right">
			<div class="sell-info" style="border: 1px solid;">
				<section>
						<section>
						좋아요 넣을 섹션
						</section>

						<section>
						<h1>제목 넣을 섹션
							<%= s.getSellTitle() %></h1>
						</section>

						<section>
							<div>
								<div>
								작성일
								<%= s.getSellDate() %>
								</div>
								<div>
								가격 넣을 섹션
								<%= s.getPrice() %>
								</div>
								<div>
								간단 내용
								<%= s.getSellContent() %>
								</div>
							</div>
							<div style="border: 1px solid;">
								<button>문의하기</button>
								<a href="<%=contextPath%>/payment.se" id="paymentBtn" class="btn btn-secondary">구매하기</a>
							</div>
						</section>
				</section>
				<section style="border: 1px solid;">
					<h5>서비스 제공이 완료된 이후에 전문가에게 결제 대금이 전달됩니다.</h5>
				</section>
			</div>
			
			
		</div>

		<div class="right-under">
			<div class="seller-info">
				<section>
				새로 나누어야할곳
				판매자 정보 : 닉네임!
				<%= s.getNickname() %>
				</section>
				<section>
					하하하하하하하
				</section>
				
				
			</div>
		</div>

		</section>
		
		
		<script>
			$(document).ready(function(){

				$('ul.tabs li').click(function(){
					var tab_id = $(this).attr('data-tab');

					$('ul.tabs li').removeClass('current');
					$('.tab-content').removeClass('current');

					$(this).addClass('current');
					$("#"+tab_id).addClass('current');
				})
			})
		</script>	
	</div>

	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
	
	


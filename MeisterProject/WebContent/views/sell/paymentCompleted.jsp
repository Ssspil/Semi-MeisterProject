<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sellboard.model.vo.SellBoard, com.kh.common.model.vo.Attachment"%>
<%
	SellBoard pc = (SellBoard) request.getAttribute("pc");
	Attachment at = (Attachment) request.getAttribute("at");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width : 50%;
		padding-top: 150px;
		margin: 0 auto;
		font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
		text-align: center;
	}
	.product-name{
		border : 1px solid #e4e5ed;
		text-align : center;
		padding : 5%;
		border-radius: 10px;
	}
	.payment-info{
		text-align: justify;
		border : 1px solid #e4e5ed;
		padding : 5%;
		border-radius: 10px;
	}
	.pay-method{
		float: right;
		font-size: small;
		border-radius: 10px;
	}
	.btn-cls{
		text-align : center;
	}
	.btn-cls a:hover{
		transition: 1s;
		transform: scale(1.1);
	}
	
</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <div class="outer">
		    <h3>결제 완료</h3>
		    <br>
		
		    <div>
		        
		        <div class="product-name">
			        <div>
			            결제가 정상적으로 완료되었습니다.
			        </div>
			        <br>
		            상품명 : &nbsp;&nbsp;&nbsp;
		            <span><img src="<%=contextPath%>/<%= at.getFilePath()+ at.getChangeName() %>" width="280" height="150"></span>
		            &nbsp;&nbsp;&nbsp;<span><b><%= pc.getSellTitle() %></b></span>
		        </div>
		    </div>
		    <br>
			<hr>
			<br>
		    <h3>결제 정보</h3>
		    <br>
		    <div class="payment-info">
		        <table style="border: 1 solid;">
		            <tr>
		                <td>
		                    주문 합계 금액
		                </td>
		                <td>
		
		                </td>
		                <td>
		                    할인금액
		                </td>
		                <td>
		
		                </td>
		                <td>
		                    최종결제금액
		                </td>
		            </tr>
		            <tr>
		                <td>
		                    <%= pc.getPrice() %> 원
		                </td>
		                <td>
		
		                </td>
		                <td>
		                    0 원
		                </td>
		                <td>
		
		                </td>
		                <td>
		                    <b><%= pc.getPrice() %></b> 원
		                </td>
		            </tr>            
		        </table>
		        <hr>
		        <div class="pay-method">
		        	결제수단 : 신용카드
		        </div>
		    </div>
		    <br>
		    <div class="btn-cls">
		    <a href="<%=contextPath%>/market.se" id="" class="btn btn-primary">쇼핑 계속하기</a>
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    <a href="<%=contextPath%>/myTransaction.me" id="" class="btn btn-warning">거래내역보기</a>
		    </div>
    </div>




    <%@ include file="../common/footer.jsp" %>
</body>
</html>
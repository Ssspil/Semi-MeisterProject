<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.common.model.vo.Interest, com.kh.common.model.vo.Local,
    com.kh.sellboard.model.vo.SellBoard, com.kh.common.model.vo.Attachment"%>

<%
	ArrayList<Interest> interest = (ArrayList<Interest>) request.getAttribute("interest");	
	ArrayList<Local> local = (ArrayList<Local>) request.getAttribute("local");
	
	SellBoard pm = (SellBoard) request.getAttribute("pm");
	
	Attachment at = (Attachment) request.getAttribute("at");
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 홈페이지 아이콘 -->
 <link rel="icon" href="./resources/image/mainLogo.png" />
<meta charset="UTF-8">
<title>결제 페이지</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<style>
	.outer{
		width : 40%;
		padding-top: 150px;
		margin: 0 auto;
		font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
	}
	.order-history{
		border: 1px solid #e4e5ed;
		padding : 3%;
		border-radius: 10px;
	}
	.payment-method{
		border: 1px solid #e4e5ed;
		padding : 3%;
		border-radius: 10px;
	}
	.description{
		border : 1px solid #e4e5ed;
		padding : 2%;
		border-radius: 10px;
	}
	.tb1{
		text-align : left;
		padding : 2%;
		border: 1px solid #e4e5ed;	
		border-radius: 10px;
		width:100%;
	}	
	.btn-form{
		margin : auto;
		text-align : center;
		width : 100%;
	}
	.tb{
		text-align: center;
	}
	#h3{
		text-align: center;
	}
	.btn-form a:hover{
		transition: 1s;
		transform: scale(1.1);
	}
	.btn-form button:hover{
		transition: 1s;
		transform: scale(1.1);
	}
	h6{
		color: orange;
	}

</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

    
    <div class="outer">
	    <h3 id="h3">결제하기</h3>
	    <br><br>

	    <div class="order-history">
	        <b>주문 내역</b>
			<br><br>
	        <table class="tb">
	            <tr>
	                <td>
	                    <img src="<%=contextPath%>/<%= at.getFilePath()+ at.getChangeName() %>" width="300" height="150">
	                </td>
	                <td>
	                </td>
	                <td class="titleAndNick">
	                    <b><%= pm.getSellTitle() %></b><br>
	                    <h6><%= pm.getNickname() %>  ●</h6>
	                </td>
	            </tr>
	            <tr>
	            	<td>
	            	</td>
	            </tr>
	            <tr>
	                <th>
	                    기본항목
	                </th>
	                <th>
	                    게시일
	                </th>
	                <th>
	                   가격
	                </th>
	            </tr>
	            <tr>
	                <td>
						<b><%= pm.getSellTitle() %></b>
	                </td>
	                <td>
						&nbsp;<%= pm.getSellDate() %>
	                </td>
	                <td>
	                	&nbsp;	
						<c:set var = "price" value="<%= pm.getPrice() %>"/>
						<b> <fmt:formatNumber value="${price }"  /> </b> 원
	                </td>
	            </tr>
	        </table>
	    </div>
	   
	    <br>
	    <div class="payment-method">
	        <b>결제 방법</b><br><br>
	        <label for= "p-method">
	        <input type="radio" id="p-method" name="p-method" value="1"> 신용카드
	        </label>
	    </div>
	    
	    <div class="description">
	        신용카드 결제만 가능합니다.<br>
	    </div>
	    <br>
	    <div class= "tb1">
	        <table class="tb1">
	            <tr>
	                <td>
	                    총 결제 금액
	                </td>
	                <td>
	                    <b style="font-size: large; color:orange;"><c:set var = "price" value="<%= pm.getPrice() %>"/>
						<fmt:formatNumber value="${price }"  /></b> 원
	                </td>
	            </tr>
				<tr>
					<td>
						
					</td>
				</tr>
	            <tr>
	                <td style=text-align:center; colspan="2">
	                	<label for="cbox">
	                    <input id="cbox" type="checkbox"> &nbsp;결제에 동의합니다.(필수)
	                    </label>
	                </td>
	            </tr>
	            <tr>
	                <td class=btn-form colspan="2">
	                    <a href="<%=contextPath%>/detail.se?sno=<%= (int)request.getAttribute("sno") %>" id="paymentBtn" class="btn btn-primary">이전으로</a>
	                    <button onclick="requestPay()" class="btn btn-warning" id="payBtn" disabled>결제하기</button>
	                </td>
	
	            </tr>
	
	        </table>
	        
	       	
	        <script>
	        $(document).ready(function(){
	        	
	        	$("#cbox").click(function(){
	        		let chbox = $("#cbox").prop("checked");
	        		
	        		if(chbox){
	        			$("#cbox").prop("checked", true) && $("#p-method").prop("checked",true);
	        			$("#payBtn").prop("disabled", false);
	        		}
	        		else{
	        			$("#cbox").prop("checked", false) && $("#p-method").prop("checked", false);
	        			$("#payBtn").prop("disabled", true);
	        		}
	        		
	        		
	        	});
	        	
	        });
	        </script>
	        
	        <script>
			    const IMP = window.IMP; 
			    IMP.init("imp31080000"); 
			
			    function requestPay() {
			        IMP.request_pay({
			            pg : 'html5_inicis',
			            pay_method : 'card',
			            merchant_uid: 'merchant_'+new Date().getTime(), 
			            name : '<%= pm.getSellTitle() %>', 
			            amount : <%= pm.getPrice() %>,
			            buyer_email : 'abcd@naver.com',
			            buyer_name : '<%= pm.getNickname() %>',
			            buyer_tel : '010-1234-5678',
			            buyer_addr : '서울특별시 강남구 역삼동',
			            buyer_postcode : '123-456'
			        }, function (rsp) { // callback
			        	console.log(rsp);
			        	if (rsp.success) {
			
			                let msg = '결제가 완료되었습니다.';
			                alert(msg);
			                location.href= "<%=contextPath%>/paycom.se?sno=<%= (int) request.getAttribute("sno") %>"
			            } else {
			
			                let msg = '결제에 실패하였습니다.';
			                msg += '에러내용 : ' + rsp.error_msg;
			                alert(msg);
			            }
			        });
			    }
			</script>
	        
	   
	
	    </div>
    </div>





    <%@ include file="../common/footer.jsp" %>
</body>
</html>
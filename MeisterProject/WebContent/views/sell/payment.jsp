<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.common.model.vo.Interest, com.kh.common.model.vo.Local,
    com.kh.sellboard.model.vo.SellBoard, com.kh.common.model.vo.Attachment"%>

<%
	ArrayList<Interest> interest = (ArrayList<Interest>) request.getAttribute("interest");	
	ArrayList<Local> local = (ArrayList<Local>) request.getAttribute("local");
	
	SellBoard pm = (SellBoard) request.getAttribute("pm");
	
	Attachment at = (Attachment) request.getAttribute("at");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<style>
	.outer{
		width : 800px;
		margin: 150px 200px 200px 400px;
	}
	.order-history{
		border: 1px solid;
		padding : 3%;
	}
	.payment-method{
		border: 1px solid;
		padding : 3%;
	}
	.description{
		border : 1px solid;
		padding : 2%;
	}
	.tb1{
		text-align : center;
		padding : 2%;
		
	}	
	.btn-form{
		margin : auto;
	}
</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

    
    <div class="outer">
	    <h3>결제하기</h3>
	    <br><br>

	    <div class="order-history">
	        <b>주문 내역</b>
	        <table>
	            <tr>
	                <td>
	                    <img src="<%=contextPath%>/<%= at.getFilePath()+ at.getChangeName() %>" width="300" height="150">
	                </td>
	                <td>
	                    <%= pm.getSellTitle() %><br>
	                    <%= pm.getNickname() %> ●
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    제목
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
	                    <%= pm.getSellTitle() %>
	                </td>
	                <td>
	                   <%= pm.getSellDate() %>
	                </td>
	                <td>
	                    <%= pm.getPrice() %> 원
	                </td>
	            </tr>
	        </table>
	        <table>
	        	<tr>
	        		<td>
	        			제목
	        		</td>
	        		<td>
	        			게시일
	        		</td>
	        		<td>
	        			가격
	        		</td>
	        	</tr>
	        </table>
	        
	         <!-- <div>
		         <span>
		    		제목
		   		 </span>
		   		 
		   		 <span style="float: right;">
		   		 	게시일
		   		 </span>
		   		 <span style="float: right;">
		   		 	가격
		   		 </span>
	   		 </div> -->
	    </div>
	   
	    <br>
	    <div class="payment-method">
	        <b>결제 방법</b><br><br>
	        <label for= "p-method">
	        <input type="radio" id="p-method" name="p-method" value="1"> 신용카드
	        </label>
	    </div>
	    
	    <div class="description">
	        위의 라디오 버튼을 누르면 설명이 바뀌는곳<br>
	    </div>
	    <br>
	    <div class= tb1 style="border: 1px solid;">
	        <table>
	            <tr>
	                <td>
	                    총 결제 금액
	                </td>
	                <td>
	                    <b><%= pm.getPrice() %></b> 원
	                </td>
	            </tr>
	            <tr>
	                <td>
	                	<label for="cbox">
	                    <input id="cbox" type="checkbox"> 결제에 동의합니다.(필수)
	                    </label>
	                </td>
	                <td>
	                
	                </td>
	            </tr>
	            <tr>
	                <td class=btn-form>
	                    <a href="<%=contextPath%>/detail.se?sno=<%= (int)request.getAttribute("sno") %>" id="paymentBtn" class="btn btn-primary">이전으로</a>
	                    <button onclick="requestPay()" class="btn btn-warning" id="payBtn" disabled>결제하기</button>
	                    <a href="<%=contextPath%>/paycom.se?sno=<%=(int)request.getAttribute("sno") %>" id="paymentBtn" class="btn btn-primary">결제안하고 넘어가는 버튼</a>
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
			            name : '결제 테스트', // 결제창에서 보여질 이름
			            amount : 100, // 실제 결제되는 가격
			            buyer_email : 'Iamport@chai.finance',
			            buyer_name : '구매자 이름',
			            buyer_tel : '010-1234-5678',
			            buyer_addr : '서울특별시 강남구 역삼동',
			            buyer_postcode : '123-456'
			        }, function (rsp) { // callback
			        	console.log(rsp);
			        	if (rsp.success) {
			
			                let msg = '결제가 완료되었습니다.';
			                alert(msg);
			                location.href= "결제 완료 후 이동할 페이지 url"
			                location.href= "<%=contextPath%>/paycom.se"<%-- ?sno=<%= (int) request.getAttribute("sno") %> --%>
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
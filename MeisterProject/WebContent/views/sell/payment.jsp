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
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

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
            } else {

                let msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    }
</script>

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
	                    썸네일
	                </td>
	                <td>
	                    제목<br>
	                    판매자 닉네임
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    항목
	                </th>
	                <th>
	                    작업일
	                </th>
	                <th>
	                    가격
	                </th>
	            </tr>
	            <tr>
	                <td>
	                    유튜브 음원
	                </td>
	                <td>
	                   ㅇㅇ 30일
	                </td>
	                <td>
	                    5000원
	                </td>
	            </tr>
	        </table>
	    </div>
	    <br>
	    <div class="payment-method">
	        <b>결제 방법</b><br><br>
	        <input type="radio" name="p-method" value="card"> 신용카드
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
	                    5,000원
	                    <%-- <%= s.getPrice() %> --%>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <input id="cbox" type="checkbox"> 결제에 동의합니다.(필수)
	                </td>
	                <td>
	                
	                </td>
	            </tr>
	            <tr>
	                <td class=btn-form>
	                    <a href="<%=contextPath%>/detail.se" id="paymentBtn" class="btn btn-primary">이전으로</a>
	                    <button onclick="requestPay()" class="btn btn-warning" id="payBtn">결제하기</button>
	                </td>
	
	            </tr>
	
	        </table>
	
	    </div>
    </div>





    <%@ include file="../common/footer.jsp" %>
</body>
</html>
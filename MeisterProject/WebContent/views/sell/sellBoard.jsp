<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.common.model.vo.Interest, 
    		com.kh.common.model.vo.Local, com.kh.sellboard.model.vo.SellBoard,
    		com.kh.common.model.vo.PageInfo"%>
<%
	ArrayList<Interest> interest = (ArrayList<Interest>) request.getAttribute("interest");	
	ArrayList<Local> local = (ArrayList<Local>) request.getAttribute("local");
	ArrayList<SellBoard> list = (ArrayList<SellBoard>) request.getAttribute("list");
	
	SellBoard s = (SellBoard) request.getAttribute("s");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
 	
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
	
%>

<!DOCTYPE html>
<html>
<head>
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
                    /* location.href= "결제 완료 후 이동할 페이지 url" */
                } else {

                    let msg = '결제에 실패하였습니다. ';
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                }
            });
        }
    </script>

<meta charset="UTF-8">
<title>판매게시판 메인</title>
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
       height: 1000px;
       /* 상 , 우 , 하, 좌  띄우기 */
	   margin: 150px 200px 20px 200px;
	   font-family: 'Nanum Gothic';
}
/*맨 위 마켓*/
h2{
	border-bottom: 5px solid rgb(255, 212, 0);
    padding-bottom: 16px;
    margin-bottom: 8px;
}


/*글등록 버튼*/
#sellEnrollBtn{
	width: 100px;
	height: 40px;
	font-size: 15px;
	font-weight: 900;
	background-color: white;
	color: orange;
	outline-color: rgb(248, 162, 3);
	border: solid;
	border-radius: 12px;
	font-family: 'Nanum Gothic';
	float : right;
}
#sellEnrollBtn:hover{
	background-color: orange;
	color:white;
}
	
/* =================사이드 네비게이션 바 css===================== */

.navigator{
    width: 1000px;
    height: 50px;
    transition: all 0.5s ease-in-out;

}
#navi{
    list-style-type : none;
    margin: 0;
    padding: 0;
    height: 100%;
    position: relative; /*z-index를 위한 기준 위치 */
    
}
#navi > li {
    width: 10%;
    height: 100%;
    text-align: center;
    line-height: 25px;
}
/* 현재 보이는 목록의 글자들 (전체)*/
#navi a{
    text-decoration: none;
    color: black;
    font-size: 18px;
    font-weight: 500;
    width: 100%;
    height: 100%;
    display: block;
    line-height: 34px;
}
/* 현재 보이는 목록의 글자들 (전체-마우스를 올렸을 때)*/
#navi a:hover {
    font-size: 22px;
    color: coral;
}
#navi > li > ul {
    list-style-type: none;
    display: none;
    margin: -50px;
}
/* 지역들 목록 보이게 하는 css*/
#navi > li > ul a {
    font-size: 18px;
    margin-left: 110px;
    margin-top: -1px;
    background-color: rgb(253, 215, 184);
    color: black;
    font-weight: 350;
    height: 50px;
    line-height: 50px;
   
}
#navi > li > ul a:hover {
    font-size: 18px;
    background-color: orange;
    color: white;
    
}
#navi > li > a:hover+ul {
    display: block;
}
#navi >li > ul:hover{
    display: block;
}

div.main{
    margin-left:10rem;
	z-index : 200;
    display: inline-block;
}
div.main div{
   /* border : 1px solid red; */
    height: 250px;
    width : 250px;
    margin : 15px 15px 100px 15px;
    float : left;
    flex-wrap: nowrap; /*자동 줄 바꿈 처리*/
    font-size : 13px;

}
div.main > #thumb1{
	 position : relative;
}

/*예시 위치*/
div.main #title{
	position : absolute;
	display: inline;
	bottom : 80px;
	margin : 0 0 0 100px;
}
div.main #price{
	position : absolute;
	display: inline;
	bottom : 50px;
	margin : 0 0 0 100px;
}


</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="outer" >
		
		<h2>마켓</h2>
		
		<br>
		<div>
		<%if(loginUser !=null && loginUser.getExpert().equals("Y")) { %>					
			<a href="<%=contextPath%>/sellEnrollForm.se" id="sellEnrollBtn" class="btn btn-secondary">글 등록</a>
			<%} else{%>
			<a href="<%=contextPath%>/sellEnrollForm.se" id="sellEnrollBtn" class="btn btn-secondary" style="display:none">글 등록</a>
		<%} %>
		</div>
		<br>
		<br>
		
		<div class="navigator">		
	        <ul id="navi">
	        	<li class="list-1">
	                <a href="<%= contextPath %>/market.se" id="marketAll">전체</a>
	            </li>
	        	<% for (Interest i : interest) { %> 
	        	<li class="list-2">
	       			<a href="<%= contextPath %>/market.se?interest_no=<%=i.getInterestNo() %>"  id="inter<%=i.getInterestNo() %>"> <%= i.getInterestName() %> </a>
	       			<ul>
	       				<% for (Local l : local) { %>
	       					<li class="list-in-list">
	       						<a href="<%= contextPath %>/market.se?interest_no=<%=i.getInterestNo() %>&local_no=<%=l.getLocalNo()%>" > <%= l.getLocalName() %></a>
	       					</li>
	       				<% } %>
					</ul>
				</li>
	       		<% } %>
	        </ul> 
	        
	    </div> 
		
		<div class="main">
		<% if(list.isEmpty()){ %>
			<!-- 리스트가 비어있는 경우 -->
			등록된 게시글이 없습니다.
		<% } else{ %>
			<%for(SellBoard sb : list ) {%>
				<div class="thumbnail" align="center">
					<input type="hidden" value="<%=sb.getSellNo() %>">
					<img src="../resources/sellBoard_upfiles/<%=sb.getTitleImg()%>"width="230px" height="210px">
					
					<p>
					<img src="../resources/image/sell_title"> <%=sb.getSellTitle() %> <br>					
						관심사 : <%=sb.getInterestNo() %><br>							
						지역 : <%= sb.getLocalNo() %><br>					
					<img src="../resources/image/sell_price"><%=sb.getPrice() %> 원
					</p>
				</div>
			<% } %>
			
		<% } %>
		
		
		</div>
		<script>
			//썸네일 클릭 시 이동되는 주소
			$(function(){
				$(".thumbnail").click(function(){			
					location.href = "<%=contextPath%>/detail.se?sno="+$(this).children().eq(0).val();					
				})	
			});
			
		</script>
		
		<button onclick="requestPay()">결제하기</button>


    
    
	</div><!-- outer 끝 -->
	
		<!-- 페이징처리 -->           
	     <div align="center" class="paging-area">
			<% if(currentPage != 1) {%>
				<button onclick="doPageClick(<%=currentPage-1 %>)">&lt;</button>
			<%} %>
			
			<%for(int i = startPage; i<=endPage; i++){ %>
				<% if(i != currentPage) {%>
					<button onclick="doPageClick(<%=i%>)"><%= i%></button>
				<% } else { %>
					<button disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if(currentPage != maxPage) {%>
				<button onclick="doPageClick(<%=currentPage+1 %>)">&gt;</button>
			<%} %>
		</div>
		<script>
			function doPageClick(currentPage){
				location.href= "<%=contextPath%>/market.se?currentPage="+currentPage;
				
			}
		</script>
		
	

	<%@ include file="../common/footer.jsp" %>


</body>
</html>
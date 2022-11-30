<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.common.model.vo.PageInfo, com.kh.sellboard.model.vo.*, com.kh.common.model.vo.*, java.util.ArrayList, com.kh.review.model.vo.*, java.util.Collections"%>
  <%
 	PageInfo pi2 = (PageInfo) request.getAttribute("pi2");
	int currentPage2 = pi2.getCurrentPage();
	int startPage2 = pi2.getStartPage();
	int endPage2 = pi2.getEndPage();
	int maxPage2 = pi2.getMaxPage(); 
	
	ArrayList<SellBoard> s2 = (ArrayList<SellBoard>) request.getAttribute("s");
	ArrayList<Attachment> at2 = (ArrayList<Attachment>) request.getAttribute("at");
	ArrayList<Integer> status2 = (ArrayList<Integer>) request.getAttribute("status");
	ArrayList<Review> review = (ArrayList<Review>) request.getAttribute("review");
 	int count = 1;
 	if(at2 == null){
		at2.add(new Attachment());
	}
  
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 여긴 완료된거래 내역 페이지입니다 -->
<title>Insert title here</title>

<style>
.name2Body{
    box-sizing: border-box;
    border: 3px solid black;
    height:271px;
    width: 882px;
    margin: auto;
    padding: 15px;
    
    border-radius: 15px;
}
.page_wrap2 {
	text-align: center;
	position: relative;
	top: 10px;
}

.page_wrap2 span {
	padding: 5px;
	cursor: pointer;
}

.page_wrap2 .sel {
	color: orange;
	border-bottom: 1px solid orange;
}

.page_wrap2 span:hover {
	color: orange;
	cursor: pointer;
	border-bottom: 1px solid orange;
}
#ex1{
    width:700px;
    height:500px;
}
#ex2{
    width:700px;
    height:500px;
    
}
#ex3{
    width:700px;
    height:200px;
    
}
textarea {
    width: 400px;
    height: 100px;
    border: 2px solid black;
    marign: auto;
    resize: none;
}
.star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
}

.star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
}  

.star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
}

.setStar {
    position: relative;
    font-size: 2rem;
    color: #ddd;
}

.setStar span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
}

#revSubmit{
	margin-left: 150px;
	background-color: inherit;
}
#review{
	box-sizing: border-box;
	height: 70px;
	border:3px solid orange;
	width:882px;
	margin:auto;
	margin-bottom:30px;
	border-radius: 15px;
	
	position: relative;
    top: -24px;
}
#myRiview{
    font-weight: bold;
    position: relative;
    left: 28px;
}
.setStar{
    position: relative;
    left: 80px; 
    top:-2px;
}
#reviewBody{
    width: 528px;
    overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-inline-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
    position: relative;
    left: 75px;
    top:4px;

}
</style>
</head>
<body>

<div id="nameBody_2">
<div id="contenthead"></div>
	<%if(s2.isEmpty()){ %>
	   <div id="ddddd"></div>
         <div id="nullhead">
			<div id="img1"><i class="bi bi-emoji-expressionless"></i></div>
			<br>
			<div id="null">완료된 거래가 없습니다.</div>
			<div id="null2">마켓을 방문해주세요!</div>
		</div>
		<%}else {%>
   		<%for(int i =0; i < s2.size(); i++) { %>
       		<%if(status2.get(i) == 2 ){%>       		
		        <div class="name2Body Tran2 Tran2<%=i%> <%=i > 5 ? "hide" : ""%>">
		            <div id="title">
		                <span id="title1">거래 완료</span>
		                <span id="title2"><%=s2.get(i).getSellTitle() %></span>
		            </div>
		            <br><br>
		            <input type="hidden" id="sellNo" value="<%=s2.get(i).getSellNo() %>">
		            <input type="hidden" name="receiver" value="<%=s2.get(i).getUserNO() %>">
					<img src="<%=request.getContextPath() %>/<%=at2.get(i).getFilePath() %>/<%=at2.get(i).getChangeName() %>" id="img">
		            <span id="category">분류><%=s2.get(i).getInterestName() %></span>
		            <br>
					<span id="content"><%=s2.get(i).getSellContent() %></span>
		            <br><br>
		            <span id="price"><%=s2.get(i).getPrice() %> 원</span>
		            <br>
		            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
					<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
					<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
		       		<%if(review.get(i) != null){ %>
			       		<button id="btn1" onclick="show3('<%=s2.get(i).getSellNo() %>');">리뷰삭제</button>
				        <button id="btn2" onclick="show2('<%=review.get(i).getReviewContent() %>', '<%=(int)(review.get(i).getAvg()*20) %>', '<%=(int)(review.get(i).getAvg()*20) %>%','<%=s2.get(i).getSellNo() %>');">리뷰수정</button>
				        <button id="btn3" disabled style="background-color : gray">리뷰쓰기</button>
			        <%} else{ %>
			        	<button id="btn1" disabled style="background-color : gray">리뷰삭제</button>
				        <button id="btn2" disabled style="background-color : gray">리뷰수정</button>
				        <button id="btn3" onclick="show('<%=s2.get(i).getSellNo() %>');">리뷰쓰기</button>
			        <%} %>
		        </div>
			   <br>
				
				<!-- 나의 리뷰보는 div -->
				<%if(review.get(i) != null){ %>
					<div id="review">
						<span id="myRiview">나의 리뷰:</span>
						<span id="reviewBody"><%=review.get(i).getReviewContent() %></span>
						<span class="setStar">
							★★★★★
							<span style="width: <%=(int)(review.get(i).getAvg()*20) %>%">★★★★★</span>
						</span>
	    			</div>
	    			
    			<%} %>
        	<%} %>
   		<%} %>
   	<%} %>
   	
</div>
        <div id="ex1" class="modal">
			<form action="<%=request.getContextPath() %>/reviewWrite.rv" method="post">
				<h3>리뷰 작성</h3>
				<hr>
				<h6>리뷰 내용</h6>
				<textarea name="reviewText" rows="3" cols="20" placeholder="여기에 리뷰 내용을 작성하세요" required></textarea>
				<hr>
				<h6 id="avg">평점</h6>
				<span class="star">
				★★★★★
				<span>★★★★★</span>
				<input type="range" name="score" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
				</span>
				<input type="hidden" name="sellNo" value="">
				<button id="revSubmit" type="submit">제출하기</button>
			</form>				
		</div>
		
		<div id="ex2" class="modal">
			<form action="<%=request.getContextPath() %>/reviewUpdate.rv" method="post">
				<h3>리뷰 수정</h3>
				<hr>
				<h6>리뷰 내용</h6>
				<textarea name="reviewText" rows="3" cols="20" required></textarea>
				<hr>
				<h6 id="avg">평점</h6>
				<span class="star">
				★★★★★
				<span>★★★★★</span>
				<input type="range" name="score" oninput="drawStar(this)" value="" step="1" min="0" max="10">
				</span>
				<input type="hidden" name="sellNo" value="">
				<button id="revSubmit" type="submit">제출하기</button>
			</form>
		</div>
		
		<div id="ex3" class="modal">
			<form action="<%=request.getContextPath() %>/reviewDelete.rv" method="post">
				<h3>리뷰 삭제</h3>
				<hr>
				<h4>정말 리뷰를 삭제하시겠습니까?</h4>
				<input type="hidden" name="sellNo" value="">
				<button id="revSubmit" type="submit">삭제하기</button>
			</form>
		</div>
		
        <div id="page2">
	    <div class="page_wrap2">
				<span onclick="pageMove2('pre')">&lt</span>
				<%
					for (int i = startPage2; i <= endPage2; i++) {
					if (i == currentPage2) {
				%>
				<span class="page2<%=i%> sel" onclick="pageMove2('<%=i%>')">[<%=i%>]
				</span>
				<%
					} else {
				%>
				<span class="page2<%=i%>" onclick="pageMove2('<%=i%>')">[<%=i%>]
				</span>
				<%
					}
				%>
				<%
					}
				%>				
				<span onclick="pageMove2('next')">&gt</span>
				
			</div>
	   </div>
	   
	   <script>
	   function pageMove2(currentPage) {
		      if (currentPage == "next") {
		         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) + 1;
		      }
		      if (currentPage == "pre") {
		         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) - 1;
		      }
		      var cnt = (currentPage - 1) * 6;
		      $(".Tran2").hide();
		      for (var i = cnt; i < cnt + 6; i++) {
		         $(".Tran2" + (i)).show();
		      }
		      $(".page_wrap2 span").removeClass("sel");
		      $(".page2" + currentPage2).addClass("sel");
		   }
		 
	    function show(sellNo) {
			$('#ex1').modal({
				fadeDuration: 1000,
		        fadeDelay: 0.25,
				escapeClose: false,
				clickClose: false
			});
			$('#reviewText').val('');
			$("#ex1 [name=sellNo]").val(sellNo);
		}
	    
	    function show2(reviewText, score, starScore, sellNo) {
			$('#ex2').modal({
				fadeDuration: 1000,
		        fadeDelay: 0.25,
				escapeClose: false,
				clickClose: false
			});
			$("#ex2 [name=reviewText]").val(reviewText);
			$("#ex2 [name=score]").val(score);
			$(".star>span").width(starScore);
			$("#ex2 [name=sellNo]").val(sellNo);
		}
	    
	    function show3(sellNo) {
			$('#ex3').modal({
				fadeDuration: 1000,
		        fadeDelay: 0.25,
				escapeClose: false,
				clickClose: false
			});
			$("#ex3 [name=sellNo]").val(sellNo);
		}
	    function sellNoValue(){
	    	console.log($('#sellNo').val());	
	    }
	    function drawStar(target){
	    	let percent = 0;
	    	
	    	switch(target.value){
	    	case '1':
	    		percent = target.value * 10+'%';
	    		break;
	    	case '2':
	    		percent = target.value * 10+'%';
	    		break;
	    	case '3':
	    		percent = target.value * 10 - 1+'%';
	    		break;
	    	case '4':
	    		percent = target.value * 10 - 1+'%';
	    		break;
	    	case '5':
	    		percent = target.value * 10 - 2+'%';
	    		break;
	    	case '6':
	    		percent = target.value * 10 - 2+'%';
	    		break;
	    	case '7':
	    		percent = target.value * 10 - 3+'%';
	    		break;
	    	case '8':
	    		percent = target.value * 10 - 4+'%';
	    		break;
	    	case '9':
	    		percent = target.value * 10 - 5+'%';
	    		break;
	    	case '10':
	    		percent = target.value * 10+'%';
	    		break;
	    	}
	    	$('.star>span').width(percent);
	    	$('#avg').text("평점 : "+target.value * 0.5+"점");	
	    	console.log(percent);
	    }
	   </script>
	   
	   
</body>
</html>
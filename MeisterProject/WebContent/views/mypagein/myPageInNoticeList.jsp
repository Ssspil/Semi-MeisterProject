<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import=" java.util.ArrayList, 
    							  com.kh.manager.notice.model.vo.Notice,
    							  com.kh.common.model.vo.PageInfo"%>
<%
	
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
 	
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>공지사항 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!--  google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">


<style>
#noticelist-area{
}

#noticelist-area .container {
	width : 100%;
}

.noticetitle{
    background-color: white;
    width : 70%;
    height: 70px;
    line-height: 50px;
    border-radius : 30px;
    border : 1px solid black;
    cursor: pointer;
    /* 상 5px, 우 20px, 하 10px, 좌 14px씩 띄우기 */
    margin : 2px auto auto auto;
    box-shadow: 1px 2px 7px black;
}
table .large-font{
	font-size : 1.4rem;
	color : black;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight : 600;
}

.noticecontent {
    border : 2px solid orange;
    width: 70%;
    height: 500px;
    border-radius: 10px;
    padding : 10px;
    box-sizing: border-box;
    display: none;
    margin : 3px auto 6px auto;
    padding : 10px;
}

.myline{
	border : 1px solid orange;
}


</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<br><br><br><br><br><br><br>
	<div id="noticelist-area">
		<div class="container">
			<% if(list.isEmpty()) { %>
			<div class="noticetitle"> 
				<!--  리스트가 비어있을 경우 -->
				<table>
					<tr>
						<td colspan="2">존재하는 공지사항이 없습니다.</td>
					</tr>
				</table>
				
			</div>
			<p class="noticecontent"></p>
			<% } else { %>
				<% for (Notice n : list) { %>
					<div class="noticetitle"> 
						<!--  리스트가 존재할  경우 -->
						<table>
							<tr>
								<td width="500" class="large-font"><%= n.getNoticeTitle() %></td>
								<td width="200"><%= n.getCreateDate() %></td>
							</tr>
						</table>
					</div>
					<p class="noticecontent">
						<%= n.getNoticeContent() %>
					</p>
				<% } %>

			
			<% } %>
			<br><br><br><br>
			  
			<hr class="myline"> 
			    
			 <!-- 페이징처리 -->  
		     <div align="center" class="paging-area">
				<% if(currentPage != 1) {%>
					<button onclick="doPageClick(<%=currentPage-1 %>)">&lt;</button>
				<%} %>
				
				<%for(int i = startPage; i <= endPage; i++){ %>
					<% if(i != currentPage) {%>
						<button  onclick="doPageClick(<%=i%>)"><%= i%></button>
					<% } else { %>
						<button  disabled><%=i %></button>
					<%} %>
				<%} %>
				
				<%if(currentPage != maxPage) {%>
					<button onclick="doPageClick(<%=currentPage+1 %>)">&gt;</button>
				<%} %>
			</div>
			
			
			<hr  class="myline"> 
			
			
			<script>
				function doPageClick(currentPage){
					location.href= "<%=contextPath%>/noticeList.no?currentPage="+currentPage;
				}
			</script>
			
			<%@ include file="../common/footer.jsp" %>
		</div> <!-- container끝  -->

		
	</div><!--  oticelist-area 끝 -->
	
	<script>
    $(function(){
        $(document).on("click", ".noticetitle", function(){
            // $(this) : 현재 이벤트가 발생한 div요소
            // $(this).next() : 현재 클릭이벤트가 발생한 요소 바로뒤에있는 요소를 반환.
            
            let $p = $(this).next(); // jQuery방식으로 선택된 요소를 담아둘때 변수명 앞에 $를 붙이곤 한다.

            if ($p.css("display") == "none"){   // css()메소드 또는 속성명만 매개변수로 넘기면 해당 속성값 반환.
                $p.siblings("p").slideUp(1000);

                $p.slideDown(1000); // 보여지게 하는 메소드
            } else{
                $p.slideUp(1000);   // 사라지게하는 메소드
            }
        })
    });
		
	</script>
	
	
</body>
</html>
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
<style>
#noticelist-area{
	height : 800px;
	width : 60%;
	margin  : auto;
	background-color : lightgreen;
}
#noticelist-area .container {
	width : 80%;
	height : 600px;
	background-color : pink;
}

.noticetitle{
    background-color: white;
    width: 100%;
    height: 70px;
    line-height: 70px;
    border-radius : 10px;
    border : 1px solid orange;
    cursor: pointer;
    margin : auto;
}
.noticecontent {
    border : 1px solid lightgray;
    width: 100%;
    height: 100px;
    border-radius: 10px;
    padding : 10px;
    box-sizing: border-box;
    display: none;
    margin : 5px auto 5px auto;
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
								<td width="500"><%= n.getNoticeTitle() %></td>
								<td width="200"><%= n.getCreateDate() %></td>
							</tr>
						</table>
					</div>
					<p class="noticecontent">
						<%= n.getNoticeContent() %>
					</p>
				<% } %>

			
			<% } %>
		</div>
		
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
				location.href= "<%=contextPath%>/noticeList.no?currentPage="+currentPage;
			}
		</script>
	</div>
	
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
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
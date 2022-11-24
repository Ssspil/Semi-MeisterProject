<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<%
	ArrayList<Board> list2 = (ArrayList<Board>) request.getAttribute("list2");
	String nowDate2 = new SimpleDateFormat("MMddHHmm").format(new Date());
	
	String contextPath2 = request.getContextPath();

PageInfo pi2 = (PageInfo) request.getAttribute("pi2");

int currentPage2 = pi2.getCurrentPage();
int startPage2 = pi2.getStartPage();
int endPage2 = pi2.getEndPage();
int maxPage2 = pi2.getMaxPage();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.body2-1{
  box-sizing: border-box;
            height: 1700px;
}
#textLine{
            width:500px;
            height: 45px;
            overflow:hidden;
            text-overflow:ellipsis;
            display: -webkit-inline-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;  
position: relative;
top:40px;
}

.body2-3{
	box-sizing: border-box;
	margin: auto;
	height: 19%;
}

.page_wrap2 {
	text-align: center;
	position: relative;
	top: 25px;
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

                              
#chat3{
float: right;
    position: relative;
    top: -2px;
    left: 590px;
}
#date1{
  color: lightgrey;
   font-size: 14px;
position: relative;
    left: 90px;

}
.bodypage:hover{
background-color:rgb(250, 247, 247);
}
#titlefooter2{
position: relative;
    top: 23px;
}

</style>
</head>
<body>
<div class="body2-1" id="gungBody" style="display:none">
    <div id="body2-1">
             
               <%for(int i=0; i< list2.size(); i++){ %>
                   <div class="bodypage board2 board2<%=i%> <%=i > 5 ? "hide" : ""%>" onclick="location.href='<%=contextPath2%>/detail.bo?type=2&bno=<%=list2.get(i).getBoardNo() %>';">
                  
                    <span class="font"><%=list2.get(i).getBoardTitle()  %></span>
                    <div>
                        <br>
                  <p id="text"><%=list2.get(i).getBoardContent()  %></p>
                  
                  <%if(!"//".equals(list2.get(i).getTitleImg())){ %>
                  <img src="<%=contextPath2 %><%=list2.get(i).getTitleImg()%>" id="img1">
                  
                  <%} %>
                </div>
                <br> <br> <br>
                <div id="titlefooter">
                    <div id="titlefooter2"><i class="bi bi-eye"></i> <%=list2.get(i).getBoardCount()  %> 
                    <i class="bi bi-hand-thumbs-up"></i> <%= list2.get(i).getBoardRecommend() %>
                </div>
                    <%
                    String boardDate2 = list2.get(i).getBoardDate();
					int now = Integer.parseInt(nowDate2);
					int insertDate = Integer.parseInt(boardDate2);
					
					int sum1_2 = 0;
					int sum2_2 = 0;
					
					sum1_2 += Integer.parseInt(nowDate2.substring(2, 4))*1440 
							+ Integer.parseInt(nowDate2.substring(4, 6))*60 + Integer.parseInt(nowDate2.substring(6, 8));
					
					sum2_2 += Integer.parseInt(boardDate2.substring(2, 4))*1440 
							+ Integer.parseInt(boardDate2.substring(4, 6))*60 + Integer.parseInt(boardDate2.substring(6, 8));
					
					int year1_2 = Integer.parseInt(nowDate2.substring(0, 2));
					int year2_2 = Integer.parseInt(boardDate2.substring(0, 2));
					
					int calTime2 = sum1_2 - sum2_2;
					String result2 = "";
					
					if (calTime2 < 60) {
						result2 = calTime2 + "분전";
					} else if (calTime2 > 60 && calTime2 < 1440) {
						result2 = (calTime2 / 60) + "시간전";
					} else if (calTime2 > 1440) {
						result2 = (calTime2 / 1440) + "일전";
					} 
					
					if(year1_2 > year2_2){
						result2 = (year1_2 - year2_2)+ "년전";
					}
                    %>
                    
                    <div id="chat3">
                    <i class="bi bi-chat-dots"></i> <%=list2.get(i).getReplyCount()%>
                    <span id="date1"><%=result2 %> 
                    </div>
                    </div>
               	<hr>
                </div>
               <%} %>
               <div class="page_wrap2">
	
				<span onclick="pageMove2('pre')">&lt</span>
			
				<% for (int i = startPage2; i <= endPage2; i++) {
					if (i == currentPage2) { %>
				<span class="page2<%=i%> sel" onclick="pageMove2('<%=i%>')">[<%=i%>]
				</span>
				<%} else { %>
				<span class="page2<%=i%>" onclick="pageMove2('<%=i%>')">[<%=i%>]
				</span>
				<% } %>
				<% } %>
				<span onclick="pageMove2('next')">&gt</span>
				
				
				
			</div>
     
        </div>
    </div>
  

</body>
</html>

<script>
function pageMove2(currentPage) {
	if (currentPage == "next") {
		currentPage = Number($(".page_wrap2 .sel").text().substring(1, 2)) + 1;
	}
	if (currentPage == "pre") {
		currentPage = Number($(".page_wrap2 .sel").text().substring(1, 2)) - 1;
	}

	var cnt = (currentPage - 1) * 6;
	$(".board2").hide();
	for (var i = cnt; i < cnt + 6; i++) {
		$(".board2" + (i)).show();
	}
	$(".page_wrap2 span").removeClass("sel");
	$(".page2" + currentPage).addClass("sel");
	
}


</script>


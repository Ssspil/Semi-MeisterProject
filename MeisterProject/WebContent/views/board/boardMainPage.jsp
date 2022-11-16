<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page
   import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<%
   ArrayList<Board> hotList = (ArrayList<Board>) request.getAttribute("hotList"); //핫 게시글 순위용
   ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
   String nowDate = new SimpleDateFormat("MMddHHmm").format(new Date());

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
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style>
.body {
   box-sizing: border-box;
   height: 100%;
   margin: auto;
   width: 800px;
}

.body2 {
   box-sizing: border-box;
   height: 1970px;
}

#line {
   border: 4px solid rgb(255, 212, 0);
}
#body-1 {
   box-sizing: border-box;
   height: 58px;
}
.bodyClick {
   background-color: orange;
}

.bodyWrite_wrap {
   box-sizing: border-box;
   margin: auto;
   width: 800px;
}

#body2-1 {
   box-sizing: border-box;
   margin: auto;
   height: 1400PX;
   width: 800px;
}

#body2-2 {
   box-sizing: border-box;
   margin: auto;
   height: 8%;
   padding: 5%;
}

#body2-3 {
   box-sizing: border-box;
   margin: auto;
   height: 19%;
}

#body2-3-1 {
   box-sizing: border-box;
   height: 100%;
   width: 33.3%;
   float: left;
   cursor: pointer;
}

#hot1 {
   box-sizing: border-box;
   border: 2px solid black;
   background-color: #f4f4f4;
   height: 200px;
   width: 225px;
   margin: auto;
   border-style: groove;
   border-radius: 18px;
}

#hot2 {
   position: relative;
   top: 28px;   
}

#hotfooter {
   position: relative;
   left: 15px;
}

#body2-4 {
   box-sizing: border-box;
   height: 18%;
   width: 100%;
   padding: 20px; 
   cursor: pointer;  
}

#date {
   color: lightgrey;
   font-size: 14px;
   float: right;
}

#mainid {
   text-align: center;
   font-weight: bold;
   font-size: 50px;
   padding: 120px;
}

#ge {
   box-sizing: border-box;
   border: 1px solid black;
   font-size: 27px;
   padding: 8px 16px;
   float: left;
   border-style: groove;
   border-radius: 10px;
}

#ge:hover {
   background-color: orange;
}

#gung {
   border: 1px solid black;
   box-sizing: border-box;
   font-size: 27px;
   padding: 8px 12px;
   float: left;
   border-style: groove;
   border-radius: 10px;
}

#gung:hover {
   background-color: orange;
}

#textmade {
   float: right;
   margin: auto;
   padding: 15px;
}

#img1 {
   position: relative;
   top: -45px;
   float: right;
   width: 10rem;
   height: 10rem;
}

#icon1, #ask {
   float: left;
}

#hottitle {
   margin: auto;
   text-align: center;
   padding-top: 30px;
}

#titlefooter {
    margin:auto;
   
}

#text {
   width: 500px;
   height: 45px;
   overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-inline-box;
   -webkit-box-orient: vertical;
   -webkit-line-clamp: 2;
}

#hottext {
   width: 170px;
   height: 77px;
   display: -webkit-inline-box;
   overflow: hidden;
   -webkit-box-orient: vertical;
   -webkit-line-clamp: 3;
   position: relative;
   top: -20px;
   left: 15px;
   word-break: break-word;
   margin: auto;
}

.font {
   width: 400px;
   display: -webkit-inline-box;
   overflow: hidden;
   -webkit-box-orient: vertical;
   -webkit-line-clamp: 1;
   font-weight: bold;
   font-size: 20px;
}

#hotfont {
   width: 150px;
   display: -webkit-inline-box;
   overflow: hidden;
   -webkit-box-orient: vertical;
   -webkit-line-clamp: 1;
   font-weight: bold;
   font-size: 20px;
   position: relative;
   top: -20px;
   left: 18px;
}

.header2 {
   position: relative;
   width: 500px;
   
}
#search_form {
   width: 80%;
   height: 25%;
   margin: auto;
   position: relative;
   top: 150%;
}

#search_form>div {
   height: 100%;
   float: left;
}

#search_text {
   width: 80%;
   
}

#search_btn {
   box-sizing: border-box;
   width: 20%;
   height:15%;
}

#search_form input {
   box-sizing: border-box;
   width: 100%;
   height: 100%;
}

.page_wrap {
   text-align: center;
}

.page_wrap span {
   padding: 5px;
   cursor: pointer;
}

.page_wrap .sel {
   color: orange;
   border-bottom: 1px solid orange;
}

.page_wrap span:hover {
   color: orange;
   cursor: pointer;
   border-bottom: 1px solid orange;
}

.hide {
   display: none;
}

#search_main{
position: relative;
 TOP:-30px;
}
#madebutton{
background-color: orange;
}
#madebutton:hover{
background-color:rgba(255, 106, 0, 0.87);
}
       

</style>
</head>
<body>

   <%@ include file="../common/header.jsp"%>
<body>
   <input id="boardType" type="hidden" value="ge" />
   <div class="body">
      <h1 id="mainid">커뮤니티</h1>
      <div id="body-1">
         <button id="ge" class="bodyClick" onclick="menuClick('ge')">
            <i class="bi bi-chat-square-text"></i> 게시판
         </button>
         <button id="gung" onclick="menuClick('gung')">
            <i class="bi bi-wechat" style="color: deepskyblue"></i> 궁금해요
         </button>
      </div>
   </div>
   <div id="line"></div>

   <div class="bodyWrite_wrap">
      <div id="body2-2" align="right">
            <form action="<%=contextPath%>/enrollForm.bo">
            <button type="submit" id="madebutton" value="" class="btn btn-secondary">
            <i class="bi bi-pencil-square "> 글작성 </i></button> 
            <input type="hidden" id="type" name="type" value="1">
            </form>

            
      </div>
      <hr>
   </div>
   <div class="body2" id="geBody">
      <div id="body2-1">
         <div id="body2-3">
            <a id="hotfont" style="top: 10px; left: 30px">어제 핫한글<i
               class="bi bi-fire" style="color: red;"></i></a><br>

            <%
               for (int i = 0; i < hotList.size(); i++) {
            %>
            <div id="body2-3-1" onclick="location.href='<%=contextPath%>/detail.bo?type=1';" >
               <br>
               <div id="hot1">
                  <div id="hot2">
                     <p id="hotfont"><%=hotList.get(i).getBoardTitle()%></p>
                     <p id="hottext"><%=hotList.get(i).getBoardContent()%></p>
                     <div id="hotfooter">
                        <i class="bi bi-eye"></i>
                        <%=hotList.get(i).getBoardCount()%>
                        <i class="bi bi-hand-thumbs-up"></i>
                        <%=hotList.get(i).getBoardRecommend()%></div>
                  </div>
               </div>
            </div>
            <%
               }
            %>
         </div>

         <%
            for (int i = 0; i < list.size(); i++) {
         %>
         <div id="body2-4" class="board board<%=i%> <%=i > 5 ? "hide" : ""%>">
            <hr>
            <span class="font"><%=list.get(i).getBoardTitle()%></span>
            <div>
               <br>
               <p id="text"><%=list.get(i).getBoardContent()%></p>

               <%
                  if (!"/".equals(list.get(i).getTitleImg())) {
               %>
               <img src="<%=contextPath%><%=list.get(i).getTitleImg()%>"
                  id="img1">

               <%
                  }
               %>
               <!-- 사진이 없을떄 글자뛰우기 -->
               <!--           } else {%> -->
               <!--                  <span>사진이 없습니다.</span> -->
               <%--                   <%} %>  --%>

			<script>
			 $(function() {
		         $("#body2-4").click(function() {
		            let bno = $(this).children().eq(0).text(); 
		            location.href= '<%=contextPath %>/detail.bo?bno='+ bno;     
		         });
		      })
			</script>
	  </div>
            <br>
            <br>
            <br>
            <div id="titlefooter">
               <div>
                  <i class="bi bi-eye"></i> <%=list.get(i).getBoardCount()%>
                  <i class="bi bi-hand-thumbs-up"></i> <%=list.get(i).getBoardRecommend()%>

                  <%
                     String boardDate = list.get(i).getBoardDate();
                     int now = Integer.parseInt(nowDate);
                     int insertDate = Integer.parseInt(boardDate);
                     
                     int sum = 0;
                     int sum2 = 0;
                     
                     sum += Integer.parseInt(nowDate.substring(2, 4))*1440 
                           + Integer.parseInt(nowDate.substring(4, 6))*60 + Integer.parseInt(nowDate.substring(6, 8));
                     
                     sum2 += Integer.parseInt(boardDate.substring(2, 4))*1440 
                           + Integer.parseInt(boardDate.substring(4, 6))*60 + Integer.parseInt(boardDate.substring(6, 8));
                     
                     int year = Integer.parseInt(nowDate.substring(0, 2));
                     int year2 = Integer.parseInt(boardDate.substring(0, 2));
                     
                     int calTime = sum - sum2;
                     String result = "";
                     
                     if (calTime < 60) {
                        result = calTime + "분전";
                     } else if (calTime > 60 && calTime < 1440) {
                        result = (calTime / 60) + "시간전";
                     } else if (calTime > 1440) {
                        result = (calTime / 1440) + "일전";
                     } 
                     
                     if(year > year2){
                        result = (year - year2)+ "년전";
                     }
                     
                     
                     %>
                  <span id="date"><%=result%> </span>
               </div>
            </div>
         </div>
         <% } %>
         <br>
         <hr>
         
       
         <div class="page_wrap">
            <% if (currentPage != 1) {%>
            <span>&lt&lt</span>
            <%} %>
            <% if (startPage != 1) { %>
            <span onclick="pageMove('pre')">&lt</span>
            <% } %>
            <% for (int i = startPage; i <= endPage; i++) {
               if (i == currentPage) { %>
            <span class="page<%=i%> sel" onclick="pageMove('<%=i%>')">[<%=i%>]
            </span>
            <%} else {%>
            <span class="page<%=i%>" onclick="pageMove('<%=i%>')">[<%=i%>]
            </span>
            <%} %>
         <%} %>
            <%   if (currentPage != endPage) {%>
            <span onclick="pageMove('next')">&gt</span>
            <% }%>
            <% if (currentPage != maxPage) { %>
            <span>&gt&gt</span>
            <% } %>
         </div>
      </div>
   </div>

   <%@ include file="../board/pageMove.jsp"%>
   
  
    <div id="search_main" align="center">
         <div class="header2">
             <div id="search_form">
                 <div id="search_text">
              <input id="keyword" list="list" type="text" style="height:35px;">

	
             </div>
             <div id="search_btn">
                   <button type="button" class="btn btn-secondary"  list="list" style="background-color: orange; height:35px;">
                   <datalist id="list">
	
	</datalist>
            <i class="bi bi-search"></i> 검색 </button>
            
            <script>
            $(function() {
        		$("#keyword").keyup(function(e){
        			$.ajax({
        				url : "AutoSearch.do",
        				data : {keyword : $("#keyword").val()},
        				success:function(data) {
        					
        					$("#list").html("");
        					console.log(data);
        					let str = "";
        					for(let i = 0 ; i<data.length; i++){
        						str += "<option>"	
        							+  data[i].boardTitle
        							+  "</option>"
        					}
        					$("#list").html(str);
        				}
        			});
        		});
        	}) 
            </script>
            </div>
         </div>
         </div>
    
     </div>
     
        
   <%@ include file="../common/footer.jsp"%>

</body>
</html>

<script>
   function menuClick(type) {
      /* body2 : 게시판 , */
      if (type == "ge") {
         $("#geBody").show();
         $("#gungBody").hide();
         $("#ge").addClass("bodyClick");
         $("#gung").removeClass("bodyClick");
         $("#type").val("1");
         $("#search_main").val("1");
         $("#boardType").val("ge");

      } else if (type == "gung") {
         $("#geBody").hide();
         $("#gungBody").show();
         $("#gung").addClass("bodyClick");
         $("#ge").removeClass("bodyClick");
         $("#type").val("2");
         $("#search_main").val("2");
         $("#boardType").val("gung");

      }
   }

   function pageMove(currentPage) {
      if (currentPage == "next") {
         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) + 1;
      }

      if (currentPage == "pre") {
         currentPage = Number($(".page_wrap .sel").text().substring(1, 2)) - 1;
      }

      var cnt = (currentPage - 1) * 6;
      $(".board").hide();
      for (var i = cnt; i < cnt + 6; i++) {
         $(".board" + (i)).show();
      }

      $(".page_wrap span").removeClass("sel");
      $(".page" + currentPage).addClass("sel");
   }
   

</script>

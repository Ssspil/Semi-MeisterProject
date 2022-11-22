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

String searchType = request.getAttribute("searchType") == null ? "" : request.getAttribute("searchType").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
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
	height: 130px;
	padding: 3%;
}

#body2-3 {
	box-sizing: border-box;
	margin: auto;
	height: 19%;
}

hr {
	background-color: orange;
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
	box-shadow: 6px 6px 6px 6px gray;
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
	position: relative;
	left: 160px;
}

#mainid {
	text-align: center;
	font-weight: bold;
	font-size: 50px;
	padding: 120px;
}

#ge {
	border: 5px solid orange;
	background-color: white;
	font-size: 25px;
	height: 58px;
	width: 150px;
	float: left;
	border-style: groove;
	border-radius: 18px;
	
	font-family: 'Nanum Gothic', sans-serif;
}

#ge:hover {
	background-color: white;
	border: 5px solid yellow;
}

#gung {
	border: 5px solid orange;
	background-color: white;
	font-size: 25px;
	height: 58px;
	width: 150px;
	float: left;
	border-style: groove;
	border-radius: 18px;
	
	font-family: 'Nanum Gothic', sans-serif;
}
#gfont{
font-family: 'Nanum Gothic', sans-serif;
}

#bodyClick1 {
	background-color: black;
}

#bodyClick2 {
	background-color: blue;
}

#gung:hover {
	background-color: white;
	border: 5px solid yellow;
	
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
	border-radius: 20px;
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
	margin: auto;
	display: inline-block;
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

.page_wrap {
	text-align: center;
	position: relative;
	top: 25px;
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

#search_form {
	width: 80%;
	height: 25%;
	margin: auto;
}

#search_form>div {
	height: 100%;
	float: left;
	position: relative;
	right: 90px;
	top: 33px;
}

#search_text {
	width: 80%;
}

#search_form input {
	box-sizing: border-box;
	width: 400px;
	float: left;
}

#madebutton {
	background-color: white;
	float: right;
	border:5px solid orange;
	color: orange;
	border-radius: 15px;
	font-family: 'Nanum Gothic';
	font-size:15px;

	width:95px;
}

#madebutton:hover {
	background-color: orange;
	color:white;
}

#chat {
	float: right;
	position: relative;
	right: 29px;
}

#chat2 {
	color: black;
	position: relative;
	right: 70px;
}

.foot_wrap {
	float: right;
	position: relative;
	left: 440px;
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
		<div id="body2-2">
			<div id="search_main" align="center">
				<div class="header2">
					<div id="search_form">
						<div id="search_text">
							<input id="keyword" list="list" type="text"
								placeholder="게시글 제목을 입력해주세요." style="height: 35px;">

							<div id="search_btn">
								<button type="button" class="btn btn-secondary"
									onclick="searchResult()" list="list"
									style="background-color: orange; height: 35px; float: left;">
									<datalist id="list">
									</datalist>
									<i class="bi bi-search"></i> <span id="gfont">검색</span>
								</button>
							</div>
							
							
							<form id="formSearch" action="<%=contextPath%>/boardlist.bo"
								method="post">
									<input type="hidden" id="type1" name="type1" value="1">
								<input type="hidden" id="searchType" name="searchType" value="1">
								<input type="hidden" id="searchKeyword" name="searchKeyword"
									value="">
							</form>
							

							<script>
            $(function() {
              $("#keyword").keyup(function(e){
            	  
            	 if(window.event.keyCode == 13){
            		 searchResult();
            	 }
            	 else {
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
            	 }
	              });
	           }) 
           
            function searchResult(){
            	if($("#keyword").val() == ""){
            		alert("검색어를 입력해주세요");
            		return false;
            	}
            	else {
            		$("#searchKeyword").val($("#keyword").val());
            		$("#formSearch").submit();
            	}
            }
            </script>
						</div>
					</div>
				</div>
			</div>
			<form action="<%=contextPath%>/enrollForm.bo">
				<button type="submit" id="madebutton" value=""
					class="btn btn-secondary">
					<span id="gfont">글작성</span> </i>
				</button>
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
				<div id="body2-3-1"
					onclick="detail('<%=hotList.get(i).getBoardNo()%>')">
					<br>
					<div id="hot1">
						<div id="hot2">
							<p id="hotfont"><%=hotList.get(i).getBoardTitle()%></p>
							<p id="hottext"><%=hotList.get(i).getBoardContent()%></p>
							<div id="hotfooter">
								<i class="bi bi-eye"></i>
								<%=hotList.get(i).getBoardCount()%>
								<i class="bi bi-chat-dots"></i>
								<%=hotList.get(i).getReplyCount()%>
								<div id="chat">
									<i class="bi bi-hand-thumbs-up"></i>
									<%=hotList.get(i).getBoardRecommend()%>
								</div>
							</div>
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
			<div id="body2-4" class="board board<%=i%> <%=i > 5 ? "hide" : ""%>"onclick="detail('<%=list.get(i).getBoardNo()%>')">
				<input type='hidden' name='bno'
					value='<%=list.get(i).getBoardNo()%>' />
				<hr>
				<span class="font"><%=list.get(i).getBoardTitle()%></span>
				<div>
					<br>
					<p id="text"><%=list.get(i).getBoardContent()%></p>
					<%
						if (!"/".equals(list.get(i).getTitleImg())) {
					%>
					<img src="<%=contextPath%><%=list.get(i).getTitleImg()%>" id="img1">
					<%
						}
					%>
					<!-- 사진이 없을떄 글자뛰우기 -->
					<!--           } else {%> -->
					<!--                  <span>사진이 없습니다.</span> -->
					<%--                   <%} %>  --%>
				</div>
				<br> <br> <br>
				<div id="titlefooter">
					<div>
						<i class="bi bi-eye"></i>
						<%=list.get(i).getBoardCount()%>
						<i class="bi bi-hand-thumbs-up"></i>
						<%=list.get(i).getBoardRecommend()%>


						<%
							String boardDate = list.get(i).getBoardDate();
						int now = Integer.parseInt(nowDate);
						int insertDate = Integer.parseInt(boardDate);

						int sum = 0;
						int sum2 = 0;

						sum += Integer.parseInt(nowDate.substring(2, 4)) * 1440 + Integer.parseInt(nowDate.substring(4, 6)) * 60
								+ Integer.parseInt(nowDate.substring(6, 8));

						sum2 += Integer.parseInt(boardDate.substring(2, 4)) * 1440 + Integer.parseInt(boardDate.substring(4, 6)) * 60
								+ Integer.parseInt(boardDate.substring(6, 8));

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
						if (year > year2) {
							result = (year - year2) + "년전";
						}
						%>
						<div class="foot_wrap" style="float: right">
							<span id="date"><span id="chat2"><i
									class="bi bi-chat-dots"></i> <%=list.get(i).getReplyCount()%></span> <%=result%>
							</span>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
			<br>
			<hr>
			<div class="page_wrap">
				<%
					if (currentPage != 1) {
				%>
				<span>&lt&lt</span>
				<%
					}
				%>
				<%
					if (startPage != 1) {
				%>
				<span onclick="pageMove('pre')">&lt</span>
				<%
					}
				%>
				<%
					for (int i = startPage; i <= endPage; i++) {
					if (i == currentPage) {
				%>
				<span class="page<%=i%> sel" onclick="pageMove('<%=i%>')">[<%=i%>]
				</span>
				<%
					} else {
				%>
				<span class="page<%=i%>" onclick="pageMove('<%=i%>')">[<%=i%>]
				</span>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage != endPage) {
				%>
				<span onclick="pageMove('next')">&gt</span>
				<%
					}
				%>
				<%
					if (currentPage != maxPage) {
				%>
				<span>&gt&gt</span>
				<%
					}
				%>
			</div>
		</div>
	</div>


	<%@ include file="../board/pageMove.jsp"%>
	<%@ include file="../common/footer.jsp"%>




	<script>
   $(function() {
	   var type = "${searchType}";
	   
	   if(type != ""){
		   if(type == "1") menuClick('ge');
		   else if(type == "2") menuClick('gung');
	   }
	  
   })
	</script>

	<script>
   function menuClick(type) {
      /* body2 : 게시판 , */
      if (type == "ge") {
         $("#geBody").show();
         $("#gungBody").hide();
         $("#ge").addClass("bodyClick1"); 
         $("#gung").removeClass("bodyClick2"); 
         $("#type").val("1");
         $("#type1").val("1");
         $("#search_main").val("1");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
         $("#boardType").val("ge");

      } else if (type == "gung") {
         $("#geBody").hide();
         $("#gungBody").show();
         $("#gung").addClass("bodyClick1");
         $("#ge").removeClass("bodyClick2");
         $("#type").val("2");
         $("#type1").val("2");
         $("#search_main").val("2");
         $("#boardType").val("gung");

      }
   }
   </script>
   <script>
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
   
 
function searchEnter(){
	   if(window.event.keycode == 13) search();
};

function detail(no){
	   if(no != 0) location.href="<%=contextPath%>" + "/detail.bo?type=1&bno=" + no;

	}
   
	</script>
</body>
</html>


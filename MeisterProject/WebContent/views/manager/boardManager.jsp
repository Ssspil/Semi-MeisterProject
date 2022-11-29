<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.board.model.vo.*, java.util.ArrayList, com.kh.common.model.vo.Attachment" 
%>
    
    
<%
    String contextPath = request.getContextPath();
	
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	
	ArrayList<Reply> rlist = (ArrayList<Reply>) request.getAttribute("rlist");
	
	Attachment at = (Attachment) request.getAttribute("at");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="author" content="JSP" />
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />

<!--  jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- css -->
<link href="<%= contextPath %>/resources/css/manager.css" rel="stylesheet" type="text/css"  />

<style>
.status {
	color: red;
}

table>tbody>tr>th {
	background-color: black;
	color: white;
	text-align: center;
}

table>tfoot {
	text-align: center;
}

table>tfoot>tr:hover {
	background-color: orange;
	cursor: pointer;
	color: darkblue;
}
.modal {
	position: absolute;
	width: 100%;
	height: 1770px;
	background: rgba(0,0,0,0.8);
	top: 0;
	left: 0;
	display: none;
	z-index: 2;
}
.modal-content {
	width: 1000px; height: 400px;
	background: #fff; border-radius: 10px;
	position: relative; top: 24%; left: 50%;
	margin-top: -200px; margin-left: -450px;
	overflow: scroll;
}
.center {
	margin-left: auto;
	margin-right: auto;
}
#btn1 {
	background-color: white;
    color: orange;
    outline-color: rgb(248, 162, 3);
    border: solid;
    border-radius: 12px;
}
#btn1:hover {
	background-color: orange;
    color: white;
}
</style>
    
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
 <script>
 	let msg = "<%=alertMsg%>";
  	if (msg != "null") { 
 		alert(msg); 
 	<%session.removeAttribute("alertMsg");%>
 	} 
 </script> 
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <div class="navbar-brand ps-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자 페이지</div>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">메인으로</div>
                        <a class="nav-link" href="<%= contextPath %>">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            돌아가기
                        </a>

                
                        <div class="sb-sidenav-menu-heading">관리자 목록</div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#user" aria-expanded="false">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                사용자 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="user" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%= contextPath %>/users.ad">이용자</a>
                                    <a class="nav-link" href="<%= contextPath %>/blacklist.ad">블랙리스트</a>
                                    <a class="nav-link" href="<%= contextPath %>/expert.ad">전문가 승인</a>
                                </nav>
                            </div>


                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#board" aria-expanded="false" >
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                게시글 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>  
                            </a>
                            <div class="collapse" id="board" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%= contextPath %>/board.ad">커뮤니티</a>
                                    <a class="nav-link" href="<%= contextPath %>/sellboard.ad">판매게시판</a>
                                    <a class="nav-link" href="<%= contextPath %>/review.ad">리뷰</a>
                                </nav>
                            </div>
                            

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#manager" aria-expanded="false">
                                <div class="sb-nav-link-icon"><i class="fas fa-key"></i></div>
                                관리자 페이지
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="manager" aria-labelledby="heading" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%= contextPath %>/report.ad">신고접수</a>
                                    <a class="nav-link" href="<%= contextPath %>/notice.ad">공지사항</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                <div class="sb-sidenav-footer">
                    <div class="small">팀명 :</div>
                    팀 "JSP"
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">커뮤니티 관리</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">게시물 목록</li>
                    </ol>           
				
				<div class="myOuter">
<%-- 				<form action="<%= contextPath %>/boardremove.ad" method="post"> --%>
					
					<table align="center" border="1">
						<thead>
							<tr>
								<td colspan="9">
								<div style="float : right;">
<!-- 									<button type="submit" class="btn btn-danger">삭제하기</button> -->
								</div>
								</td>
							</tr>
						</thead>
						<tbody>
						    <tr>
						      <th><input type="checkbox" name="userAll" id="userAll" onclick="selectAll();"></th>
						      <th width="100">글번호</th>
						      <th width="150">작성자 아이디</th>
						      <th width="100">닉네임</th>
						      <th width="150">제목</th>
						      <th width="150">작성일</th>
						      <th width="100">게시글 상세</th>
						      <th width="100">상태</th>
						      <th width="100">삭제</th>
						    </tr>
						</tbody>
						
						<tfoot>
					    <% for(int i= 0; i<list.size(); i++) { %>
 					    	<% if( list.isEmpty() ) { %>
					    	<tr> 
					    		<td colspan="9">게시글이 없습니다.</td>
					    	</tr>
 					    	<% } else { %>

					    	
						    <tr class="user<%=list.get(i).getUserNo() %>">
						    	
								<td>
								     <input type="checkbox" name="user" id="<%=list.get(i).getUserNo() %>" value="<%=list.get(i).getUserNo() %>" onclick="singleCheck();">
								</td>
								<td><%=list.get(i).getBoardNo()%></td>
								<td><%=list.get(i).getUserId()%></td>
								<td><%=list.get(i).getMemberNic() %></td>
								<td><%=list.get(i).getBoardTitle() %></td>
								<td><%=list.get(i).getBoardDate() %></td>
 								<td><button class="btn btn-info btn-sm" type="button" onclick="showBoard('<%=list.get(i).getBoardNo()%>')">보기</button></td>
								<td><%=list.get(i).getStatus() %></td>
								<td><a href="<%=contextPath %>/boardremove.ad?bno=<%=list.get(i).getBoardNo() %>">삭제하기</a></td>
							      <% } %>
						      <% } %>
						    </tr>
					    </tfoot>

 					  </table>
<!--  					</form> -->
 				</div>
				<!--  myOuter끝 -->
            </div>    	
            </main> 
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">팀 JSP &copy; Meister : 정승필 , 김혜리, 양진호, 한대웅, 유홍상, 이이수</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

	<!-- 모달창 -->
	<div class="modal">
		<div class="modal-content" title="클릭하면 창이 닫힙니다.">

		</div>
	</div>
	

	<script>
		const USERALL = document.querySelector('#userAll');
		const users = document.querySelectorAll('[name="user"]');

		function selectAll() {
			for (let i = 0; i < users.length; i++) {
				users[i].checked = USERALL.checked;
			}
		}

		function singleCheck() {
			let total = users.length;
			let checkedUsers = document
					.querySelectorAll('[name="user"]:checked').length;

			if (total == checkedUsers) {
				USERALL.checked = true;
			} else {
				USERALL.checked = false;
			}
		}
	</script>
	
	<!-- 모달창 클릭 이벤트 -->
	<script>
		$(function() {
 			$(".btn").click(function() {
 				$(".modal").fadeIn();
 			});
 			$(".modal-content").click(function() {
 				$(".modal").fadeOut();
 			});
		});
	</script>		
	
	<!-- 모달창 화면 -->
	<script>
		function showBoard(bno) {

			$.ajax({
				url : "boardModal.ad",
				data : {bno : bno, type:"reply"},
				success : function(data) {
					let htmls="";
					let json = data.rlist;
					  htmls += 	"<table>";
					  htmls +=	 	"<tr>";
					  htmls += 			"<th style='width:500px;'>글내용</th>";
					  htmls +=			"<th style='width:500px;'>커뮤니티 게시글 사진</th>";
					  htmls += 	 	"</tr>";
					  htmls +=   	"<tr class='board-list'>";
					  htmls +=			"<td>"+data.bs.boardContent+"</td>";
					  htmls +=			"<td>"+"<img style='height:300px;' src='<%=contextPath %>/"+data.at?.filePath+"/"+data.at?.changeName+"'>"+"</td>";
					  htmls +=		"</tr>";
					  htmls +=	"</table>";
				  for(var i = 0; i < json.length; i++){
					  htmls +=	"<br> <br>";
					  htmls +=	"<table class='table'>";
					  htmls +=		"<thead>";
					  htmls +=			"<tr>";
					  htmls +=				"<th style='width: 100px;'>댓글 번호</th>";
					  htmls +=				"<th style='width: 150px;'>작성자 아이디</th>";
					  htmls +=				"<th style='width: 100px;'>닉네임</th>";
					  htmls +=				"<th style='width: 100px;'>작성일</th>";
					  htmls +=				"<th style='width: 200px;'>댓글 상세</th>";
					  htmls +=				"<th style='width: 100px;'>삭제</th>";
					  htmls +=			"</tr>";
					  htmls +=		"</thead>";
						htmls += 	"<tbody class='comments-list'>";
						htmls += 		"<tr>";
						htmls += 			"<td>"+json[i].replyNo+"</td>";
						htmls +=			"<td>"+json[i].userId+"</td>";	
						htmls += 			"<td>"+json[i].mbNic+"</td>";
						htmls += 			"<td>"+json[i].replyDate+"</td>";
						htmls += 			"<td>"+json[i].replyContent+"</td>";
						htmls +=    		"<td><button type='button' id='btn1' name='rno' onclick='replyDelete'>삭제하기</button></td>";
						htmls += 		"</tr>";
						htmls += 	"</tbody>";
						htmls +="</table>";
	              };
				  $(".modal .modal-content").html(htmls);
		},
			error : function() {
				console.log("댓글리스트조회용 ajax통신 실패~");
				}
			});
		};
		
		function replyDelete(rno, bno){
			location.href="<%=contextPath%>" + "/delete.ro?rno="+rno+"&bno="+bno;
		}
	</script>
		

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/manager.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

</body>
</html>

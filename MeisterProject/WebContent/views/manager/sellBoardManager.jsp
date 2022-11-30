<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.sellboard.model.vo.SellBoard, 
    							  java.util.ArrayList,
    							  com.kh.common.model.vo.PageInfo,
    							  com.kh.common.model.vo.Attachment" 
%>
    
    
<%
    String contextPath = request.getContextPath();
	
	ArrayList<SellBoard> getAllSellBoard  = (ArrayList<SellBoard>)request.getAttribute("getAllSellBoard");
	ArrayList<Attachment> getAllAttachment = (ArrayList<Attachment>)request.getAttribute("getAllAttachment");

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 부트스트립 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!--  jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- css -->
<link href="<%= contextPath %>/resources/css/manager.css" rel="stylesheet" type="text/css"  />


<style>
.status{
    color:red;
}

table>tbody>tr>th{
	background-color : black;
	color : white;
	text-align : center;
}
table {
	text-align : center;
}
#modal-dialog{
	width:1100px;
	max-width:1100px;
}
 	
</style>
    
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
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
                    <h1 class="mt-4">판매게시판 관리</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">판매게시글 목록</li>
                    </ol>           
				
				
				<div class="myOuter">
				
					
					<table align="center" border="1">

						<tbody>
						    <tr>
						      <th width="100">글 번호</th>
						      <th width="250">작성자 아이디</th>
						      <th width="150">닉네임</th>
						      <th width="450">제목</th>
						      <th width="150">작성일</th>
						      <th width="100">보기</th>
						      <th width="100">삭제</th>
						    </tr>
						</tbody>
							
						
						<tfoot>
					    <% for(SellBoard s : getAllSellBoard) { %>
					    	<% if( getAllSellBoard.isEmpty() ) { %>
					    	<tr>
					    		<td colspan="8">없습니다</td>
					    	</tr>
					    	<% } else { %>
							<tr>
						      <td><%= s.getSellNo() %></td>
						      <td><%= s.getUserId() %></td>
						      <td><%= s.getNickname() %></td>
						      <td><%= s.getSellTitle() %></td>
						      <td><%= s.getSellDate() %></td>
						      <td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Info<%= s.getSellNo() %>">상세보기</button>
						 <!-- 모달 테스트 -->
                           <div id="Info<%= s.getSellNo() %>" class="modal" tabindex="-1">
                               <div class="modal-dialog" id="modal-dialog">
                                   <div class="modal-content">

                                       <div class="modal-header">
                                           <h5 class="modal-title">판매글 내용</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>

                                       
                                       <div class="modal-body" align="center">
                                       	<h2>제목이당</h2>
                                       	<hr>
                                       	
                                       	<table>
                                       		<tr>
                                       			<th width="500">내용</th>
                                       			<th width="700">사진</th>
                                       			<th width="200">가격</th>
                                       		</tr>
                                       		<tr>
                                       			<td height="500"><%= s.getSellContent() %></td>
                                       			<% for(Attachment at : getAllAttachment) { %>
                                       				<% if (at.getRefNo() == s.getSellNo()) { %>
                                       					 <td height="500">
                                       					 	<input type="hidden" id="sellNo" name="sellNo" value="<%= s.getSellNo() %>" />
                                       					 	<img src="<%= contextPath %>/<%= at.getFilePath() %><%= at.getChangeName() %>" width="700" height="500" />
                                       					 </td>
                                       				<% } %>
                                       			<% } %>
                                       			
                                       			<td height="500"><%= s.getPrice() %></td>
                                       		</tr>

                                       	</table>
                                       </div>
                                       

                                   </div>
                               </div>
                           </div>
                         	<!--  모달 테스트 끝 -->
						      <td>
						      <% if( s.getStatus().equals("Y")) { %>
						      	<button type="button" class="btn btn-danger btn-sm" onclick="deletesell(<%= s.getSellNo() %>);">삭제하기</button>
						      <% } else { %>
						      	<button type="button" class="btn btn-secondary btn-sm" disabled> 삭제완료</button>
						      <% } %>
						      </td>
					    	</tr>
					  		<% } %>
					  <% } %>
					  </tfoot>

					  </table>

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
    <script>
	function deletesell(sellNo){
		if(confirm("정말로 삭제하시겠습니까?")){
			$(function(){
				$.ajax({
					url : "deleteSellboard.do",
					data : {sellNo},
					type : "post",
					success : function (result){
						alert(result);
						location.reload();
					},
		            error : function(request, status, error){
		                console.log(request, status, error);
		            }
				});
			});
			
			
		} else {
			return;
		}
	}
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/manager.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

</body>
</html>

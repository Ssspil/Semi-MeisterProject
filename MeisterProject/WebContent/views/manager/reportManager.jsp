<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.member.model.vo.Member, 
    							  java.util.ArrayList, 
    							  com.kh.report.model.vo.*,
    							  com.kh.common.model.vo.PageInfo" 
%>
    
    
<%
    String contextPath = request.getContextPath();
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
 	
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
 	
 	
   	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : null
	// 서비스 요청 성공 후 : alert로 띄워줄 메시지 문구
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!--  jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- css -->
<link href="<%= contextPath %>/resources/css/manager.css" rel="stylesheet" type="text/css"  />

<style>

table>thead>tr>th{
	background-color : black;
	color : white;
	text-align : center;
}
table>tbody {
	text-align : center;
}
table{
	text-align :center;
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
                    <h1 class="mt-4">신고 관리</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">신고 목록</li>
                    </ol>


                    <table align="center">
                         <thead>
                             <tr>
                                 <th width="100">번호</th>
                                 <th width="200">아이디</th>
                                 <th width="200">신고된 아이디</th>
                                 <th width="150">날짜</th>
                                 <th width="100">사유</th>
                                 <th width="100">상세</th>
                                 <th width="100">상태</th>
                             </tr>
                             <% for(Report re : list) { %>
                             	<tr>
                             		<td><%= re.getReportNo() %>
                             			<input type="hidden" id="rpNo<%= re.getReportNo() %>" name="rpNo" value="<%= re.getReportNo() %>"/>
                             		</td>
                             		<td><%= re.getReportUserId() %></td>
                             		<td><%= re.getReportedUserId() %></td>
                             		<td><%= re.getReportEnrollDate() %></td>
                             		<td><%= re.getReason() %></td>
                             		<td>
                             			<button type="button" class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#Info<%= re.getReportNo()%>">보기</button>
                             			<!-- 모달 테스트 -->
                                            <div id="Info<%= re.getReportNo()%>" class="modal" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">신고내용</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>

                                                        
                                                        <div class="modal-body" align="center">
                                                        	<h2><%= re.getReportTitle() %></h2>
                                                        	<hr>
                                                        	
                                                        	<div class="ReContent">
                                                        		<%= re.getReportContent() %>
                                                        	</div>
                                                        	<div class="ReAttach">
                                                        		
                                                        	</div>
                                                        </div>
                                                        

                                                    </div>
                                                </div>
                                            </div>
                                            <!--  모달 테스트 끝 -->
                             		
                             		</td>
                             		<td>
                             			<% if (re.getStatus().equals("N")) { %>
                             				<button type="button" class="btn btn-primary btn-sm" id="process<%= re.getReportNo() %>" >처리중</button>
                             				
                             			<% }  else { %>
                             				<button type="button" class="btn btn-secondary btn-sm">처리완료</button>
                             			<% } %>
                             			
                             			    <script>
										        $(function(){
													$("#process<%= re.getReportNo() %>").click(function(){
														$.ajax({
															url : "processed.do",
															data : {rpno : $('#rpNo<%= re.getReportNo() %>').val()},
															type : "post",
															success : function(result) {
																
																alert(result);
																
																$('#process<%= re.getReportNo() %>').addClass("btn btn-secondary btn-sm");
																$('#process<%= re.getReportNo() %>').html("처리완료");
															}
													
														})
													});
												})
										    </script>
                             		</td>
                           
                             	</tr>
                             <% } %>
                         </thead>
                         
                     </table>
                    
                    <br><br>
                    
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
							location.href= "<%=contextPath%>/search.no?currentPage="+currentPage+"&search=${search}";
							
						}
					</script>
                    
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

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/manager.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/datatables-manager.js"></script>
</body>
</html>

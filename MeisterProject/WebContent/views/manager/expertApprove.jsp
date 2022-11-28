<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.member.model.vo.Member, 
    							  java.util.ArrayList,
    							  com.kh.common.model.vo.Attachment" 
%>
    
    
<%
    String contextPath = request.getContextPath();

	ArrayList<Member> submitList = (ArrayList<Member>)request.getAttribute("submitList");
	ArrayList<Attachment> atArr = (ArrayList<Attachment>)request.getAttribute("atArr");
	

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

<!--  부트스트립 ajax까지 가져와야함 -->
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
table>tfoot {
	text-align : center;
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
                    <h1 class="mt-4">마이스터 신청 관리</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">전문가 신청 목록</li>
                    </ol>           
				
				
				<div class="myOuter">
					
					<table align="center" border="1">
							
						
						<tbody>
						    <tr>
						      <th width="100">신청번호</th>
						      <th width="100">회원번호</th>
						      <th width="100">이름</th>
						      <th width="50">성별</th>
						      <th width="250">이메일</th>
						      <th width="200">핸드폰</th>
						      <th width="100">전문분야</th>
						      <th width="100">상세보기</th>
						      <th width="100">여부</th>
						    </tr>
						</tbody>

						<tfoot>
					    <% for(Member m : submitList) { %>
					    	<% if( submitList.isEmpty() ) { %>
						    	<tr>
						    		<td colspan="6">리스트가 없습니다.</td>
						    	</tr>
					    	<% } else { %>	<!-- 비어있지 않을 경우 -->
						    	<tr>
						    		<td><%= m.getSubNo() %></td>
						    		<td><%= m.getUserNo() %></td>
						    		<td><%= m.getUserName() %></td>
						    		<td><%= m.getGender() %></td>
						    		<td><%= m.getEmail() %></td>
						    		<td><%= m.getPhone() %></td>
						    		<td><%= m.getSpeciality() %></td>
						    		<td>
						    			<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#ex<%= m.getSubNo() %>">보기</button>
                             			<!-- 모달 테스트 -->
                                            <div id="ex<%= m.getSubNo()%>" class="modal" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">전문가 인증 첨부파일</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        
                                                        <div class="modal-body" align="center">
	                                               			<% for(Attachment at : atArr) { %>
	                                                  			<% if(at.getRefNo() == m.getSubNo()) { %>
	                                                  			 		<img src="<%= contextPath %>/<%= at.getFilePath() %><%= at.getChangeName() %>" width="200" height="200" />
	                                                  			<% } %>
	                                                  		<% } %>
                                                        	
                                                        </div>
                                                        

                                                    </div>
                                                </div>
                                            </div>
                                            <!--  모달 테스트 끝 -->
						    		</td>
						    		<td>
						    			<button type="button">승인</button>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/manager.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

</body>
</html>

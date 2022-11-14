<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.member.model.vo.Member,
    							  java.util.ArrayList"%>
<%
    String contextPath = request.getContextPath();

	ArrayList<Member> memList = (ArrayList<Member>) request.getAttribute("memList");

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
        
        <!-- css -->
        <link href="<%= contextPath %>/resources/css/manager.css" rel="stylesheet" type="text/css"  />
        
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
                                    <a class="nav-link" href="#">블랙리스트</a>
                                    <a class="nav-link" href="#">전문가 승인</a>
                                </nav>
                            </div>


                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#board" aria-expanded="false" >
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                게시글 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>  
                            </a>
                            <div class="collapse" id="board" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">커뮤니티</a>
                                    <a class="nav-link" href="#">댓글</a>
                                    <a class="nav-link" href="#">판매게시판</a>
                                    <a class="nav-link" href="#">리뷰</a>
                                </nav>
                            </div>
                            

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#manager" aria-expanded="false">
                                <div class="sb-nav-link-icon"><i class="fas fa-key"></i></div>
                                관리자 페이지
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="manager" aria-labelledby="heading" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">신고접수</a>
                                    <a class="nav-link" href="#">문의접수</a>
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
                        <h1 class="mt-4">회원 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">이용자 목록</li>
                        </ol>
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 테이블
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>회원번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>성별</th>
                                            <th>가입일</th>
                                            <th>상태</th>
                                            <th>전문가</th>
                                            <th>전문분야</th>
                                            <th>핸드폰번호</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<% if(memList.isEmpty()) { %>
											<!--  리스트가 비어있는 경우. -->
											<tr>
												<td colspan="11">존재하는 유저가 없습니다.</td>
											</tr>
										
										<% }  else {%>
											<% for(Member m : memList) { %>
												<tr> 
													<td><%= m.getUserNo() %></td>
													<td><%= m.getUserId() %></td>
													<td>
														<% if (m.getUserName() == null) { %>
															 <!--  만약 값이 null 값일경우 안보이게 설정 -->
														<% } else { %>
															<%= m.getUserName() %>				
														<% } %>
													</td>
													<td><%= m.getNickName() %></td>
													<td>
														<% if (m.getGender() == null) { %>
															 <!--  만약 값이 null 값일경우 안보이게 설정 -->
														<% } else { %>
															<%= m.getGender() %>				
														<% } %>													
													</td>
													<td><%= m.getEnrollDate() %></td>
													<td><%= m.getStatus() %></td>
													<td><%= m.getExpert() %></td>
													<td>
														<% if (m.getSpeciality() == null) { %>
															 <!--  만약 값이 null 값일경우 안보이게 설정 -->
														<% } else { %>
															<%= m.getSpeciality() %>				
														<% } %>	
													</td>
													<td>
														<% if (m.getPhone() == null) { %>
															 <!--  만약 값이 null 값일경우 안보이게 설정 -->
														<% } else { %>
															<%= m.getPhone() %>				
														<% } %>	
													</td>
													<td><button class="btn btn-secondary stn-sm" type="button">관리</button></td>
												</tr>
										
											<% } %>
										<% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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

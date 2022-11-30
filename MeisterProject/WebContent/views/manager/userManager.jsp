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
    <link href="<%= contextPath %>/resources/css/manager.css" rel="stylesheet" type="text/css" />
    <style>
        #card-body {
            padding: 1rem 1rem;
        }

        .modal-content table {
            text-align: center;
            border-collapse: collapse;

        }

        .modal-content table th {
            text-align: center;
            background-color: black;
            color: white;
        }

        .modal-content table td {
            border-width: 1px;
        }

        .adUser-Input {
            width: 300px;
            text-align: center;
            border: 0px;
        }
    </style>

    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

</head>

<body class="sb-nav-fixed">
    <div>
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


                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#board" aria-expanded="false">
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
                </nav>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">팀명 :</div>
                팀 "JSP"
            </div>
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
                        <div class="card-body" id="card-body">
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
                                        <th colspan="2">관리</th>
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
                                        <td>
                                            <button class="btn btn-info btn-sm" type="button" data-toggle="modal" data-target="#userInfo<%= m.getUserNo()%>">관리</button>

                                            <!-- 모달 테스트 -->
                                            <div id="userInfo<%= m.getUserNo()%>" class="modal" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">회원정보</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>

                                                        <br>
                                                        <div class="modal-body" align="center">
                                                            <form action="<%= contextPath %>/userupdate.ad" method="post">
                                                                <table border="1">
                                                                    <tr>
                                                                        <th width="100">상세</th>
                                                                        <th width="300">정보</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>회원번호</td>
                                                                        <td><%= m.getUserNo() %>
                                                                            <input type="hidden" name="userNo" value="<%= m.getUserNo() %>" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>아이디</td>
                                                                        <td><input id="userId" class="adUser-Input" name="userId" type="text" maxlength="30" value="<%= m.getUserId() %>" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>패스워드</td>
                                                                        <td><input type="text" class="adUser-Input" id="userPwd" name="userPwd" maxlength="20" value="<%= m.getUserPwd() %>" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>닉네임</td>
                                                                        <td><input type="text" class="adUser-Input" id="userNickName" name="userNickName" value="<%= m.getNickName() %>" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>관심사</td>
                                                                        <td>
                                                                            <% if (m.getInterest() == null) { %>

                                                                            <% } else { %>
                                                                            <input type="text" class="adUser-Input" id="userInterest" name="userInterest" value="<%= m.getInterest() %>" />
                                                                            <% } %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>이름</td>
                                                                        <td>
                                                                            <% if (m.getUserName() == null) { %>

                                                                            <% } else { %>
                                                                            <input type="text" class="adUser-Input" id="userName" name="userName" value="<%= m.getUserName() %>" />
                                                                            <% } %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>성별</td>
                                                                        <td>
                                                                            <% if (m.getGender() == null) { %>

                                                                            <% } else { %>
                                                                            <input type="text" class="adUser-Input" id="userGender" name="userGender" value="<%= m.getGender() %>" />
                                                                            <% } %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>이메일</td>
                                                                        <td>
                                                                            <% if (m.getEmail() == null) { %>

                                                                            <% } else { %>
                                                                            <input type="text" class="adUser-Input" id="userEmail" name="userEmail" value="<%= m.getEmail() %>" />
                                                                            <% } %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>핸드폰번호</td>
                                                                        <td>
                                                                            <% if (m.getPhone() == null) { %>

                                                                            <% } else { %>
                                                                            <input type="text" class="adUser-Input" id="userPhone" name="userPhone" value="<%= m.getPhone() %>" />
                                                                            <% } %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>전문분야</td>
                                                                        <td>
                                                                            <% if (m.getSpeciality() == null) { %>

                                                                            <% } else { %>
                                                                            <input type="text" class="adUser-Input" id="userSpeciality" name="userSpeciality" value="<%= m.getSpeciality() %>" />
                                                                            <% } %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>전문가여부</td>
                                                                        <td>
                                                                            <input type="text" class="adUser-Input" id="userExpert" name="userExpert" value="<%= m.getExpert() %>" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>블랙리스트</td>
                                                                        <td>
                                                                        	블랙리스트 여부 : <%= m.getBlackList() %> &nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;
                                                                            <button type="button" id="blacklist-btn<%= m.getUserNo()%>" class="btn btn-danger btn-sm" style="width:50px, height:20px;">블랙리스트 넣기</button>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br>
                                                                <hr>
                                                                <button type="submit" class="btn btn-secondary btn-sm">회원정보 수정</button>
                                                                <br>
                                                                <hr>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  모달 테스트 끝 -->
                                            <script>
                                                $(function() {
                                                    $('#blacklist-btn<%= m.getUserNo()%>').click(function() {
                                                    	var reason = prompt("제적이유가 무엇입니까??");
                                                    	if(reason == null){
                                                    		return;
                                                    	}
														location.href='<%= contextPath %>/insertbl.ad?uno=' + <%= m.getUserNo() %>+'&reason='+reason;
														
													
                                                    })
                                                })
                                            </script>
                                        </td>
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
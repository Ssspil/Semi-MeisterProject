<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.member.model.vo.Member, 
    							  java.util.ArrayList, 
    							  com.kh.manager.notice.model.vo.Notice,
    							  com.kh.common.model.vo.PageInfo" 
%>
    
    
<%
    String contextPath = request.getContextPath();

	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
 	
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
 	
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
.listbtn{
	float:right;
}

table>thead>tr>th{
	background-color : black;
	color : white;
	text-align : center;
}
table>tbody {
	text-align : center;
}

table>tbody>tr:hover{
	background-color : orange;
	cursor : pointer;
	color : darkblue;
	
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
                    <h1 class="mt-4">공지 관리</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">공지목록</li>
                    </ol>
                    <div class="list-area">
	                    <table border="1" align="center">
	                    	<thead>
	                    		<tr>
	                    			<td colspan="4"><!--  버튼 추가할라면 여기서 작성 -->
	                    				<div class="listbtn">
											<a class="btn btn-secondary" href="<%=contextPath%>/enrollForm.ad">글작성</a> 
										</div>
									</td>
	                    		</tr>
		                    	<tr>
		                    		<th width="100">글번호</th>
		                    		<th width="500">글제목</th>
		                    		<th width="100">작성자</th>
		                    		<th width="300">등록일</th>
		                    	</tr>
		                    </thead>
							<tbody>
								<% if(list.isEmpty()) { %>
									<!--  리스트가 비어있는 경우. -->
									<tr>
										<td colspan="5">존재하는 공지사항이 없습니다.</td>
									</tr>
								
								<% }  else {%>
									<% for(Notice n : list) { %>
										<tr>
											<td><%= n.getNoticeNo() %></td>
											<td><%= n.getNoticeTitle() %></td>
											<td>관리자</td>
											<td><%= n.getCreateDate() %></td>
										</tr>
								
									<% } %>
								<% } %>
							</tbody>
	                    </table>
                    </div>
				</div>
                
                <br>
                
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
					location.href= "<%=contextPath%>/notice.ad?currentPage="+currentPage;
				}
			</script>
                    
                    		
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
        $(function(){
			$("table>tbody>tr").click(function(){
				// 클릭시 해당 공지사항의 번호를 넘겨야한다.
				// 해당 tr요소의 자손 중에서 첫번째 td태그의 영역의 내용 필요
				
				let nno = $(this).children().eq(0).text(); //글번호 1, 2 가져옴
				//현재 내가 클릭한 tr의 자손들 중 0번째에 위치한 자식의 textnode내용을 가져온다.
				
				//요청할 url?키=밸류&키=밸류&키=밸류
				//물음표 뒤에 내용을 쿼리스트링이라고 부름 => 값들은 직접 만들엉서 넘겨야함.
						
				location.href= '<%=contextPath%>/detail.ad?nno='+nno; //get방식. url에 주소가 노출됨
			});
		})
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/manager.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/datatables-manager.js"></script>
</body>
</html>

 <%@page import="oracle.net.aso.l"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*, com.kh.common.model.vo.Attachment, java.util.ArrayList" %>
<%
	Board b = (Board) request.getAttribute("b");
	// 게시글번호, 제목, 내용, 작성자 닉네임, 작성일
	
	Attachment at = (Attachment) request.getAttribute("at");
	if(at == null){
		at = new Attachment();
	}
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>Document</title>
    <style>
* {
	box-sizing: border-box;
}

ul {
	padding: 0;
}

ul li {
	list-style: none;
}

img, svg {
	vertical-align: middle;
}

article, aside, figcaption, figure, footer, header, hgroup, main, nav,
	section {
	display: block;
}

body {
	margin: 0;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #323232;
	text-align: left;
	background-color: #fff;
}

.bdy #app {
	text-size-adjust: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	min-height: 100%;
	height: 100%;
}

#app #app-body {
	height: 100%;
	position: relative;
	flex-grow: 1;
}

.community-container[data-v-1] {
	max-width: 100%;
}

.container {
	width: 100%;
	padding-right: 0.9375rem;
	padding-left: 0.9375rem;
	margin-right: auto;
	margin-left: auto;
}

.meister-container[data-a-1] {
	max-width: 100%;
	height: 100%;
}

.detail-container[data-s-1] {
	padding-top: 1.25rem;
	margin: 0 auto;
	width: 37.5rem;
}

.detail-header[data-d-1] {
	display: flex;
	flex-direction: column;
	background-color: #fff;
	margin-top: 90px;
}

.detail-header .detail-title[data-d-1] {
	margin-top: 1rem;
	margin-bottom: 2rem;
}

.detail-header .detail-title .header-text[data-d-1] {
	margin: 0;
}

.detail-header .header-text[data-d-1] {
	font-weight: 700;
	color: #2d2d2d;
	font-size: 24px;
	line-height: 1.58333333;
	letter-spacing: -.5px;
}

.detail-header .user-profile[data-f-1] {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 1.5rem;
}

.detail-header .user-profile .profile-image[data-d-1] {
	display: flex;
	width: 2.75rem;
	height: 2.75rem;
	margin-right: 0.75rem;
	border-radius: 10px;
	border: 0.0625rem solid #f2f2f2;
}

.user-profile .profile-area .profile-info[data-d-1] {
	display: flex;
	flex-direction: column;
}

.user-profile .profile-area .profile-info .profile-name[data-d-1] {
	margin: 0 0 0.125rem;
	font-weight: 500;
	color: #2d2d2d;
	font-size: 14px;
	line-height: 1.57142857;
	letter-spacing: -.3px
}

.user-profile .profile-area .profile-info .profile-date[data-d-1] {
	margin: 0.125rem 0 0;
	color: #888;
	font-weight: 400;
	font-size: 12px;
	line-height: 1.5;
	letter-spacing: -.2px;
}

.btn1 {
	position: relative;
	display: inline-flex;
	vertical-align: middle;
	background-color: white;
    color: orange;
    outline-color: rgb(248, 162, 3);
    border: solid;
    border-radius: 12px;
}
.btn1:hover {
	background-color: orange;
    color: white;
    text-decoration: none;
}
.btn1[data-d-1]{
	border: none;
	height: 1.5rem;
	margin: 0 0 0 1.25rem;
	white-space: nowrap;
	cursor: pointer;
	font-weight: 400;
}

.bin {
	display: none;
}

.detail-container .hr-sen[data-s-1] {
	height: 0;
	border: 0;
	margin: 0;
	border-bottom: 0.0625rem solid #f4f4f4;
	box-sizing: content-box;
	overflow: visible;
}

.body-container[data-g-1] {
	display: flex;
	flex-direction: column;
}

.body-container .body-contents[data-g-1] {
	margin: 2rem 0;
}

.body-container .body-contents .text[data-g-1] {
	color: #2d2d2d;
	white-space: pre-wrap;
	margin: 0;
	font-weight: 400;
}

.body-text {
	font-size: 16px;
	line-height: 1.5;
	letter-spacing: -.3px;
}

.body-image[data-h-1] {
	display: flex;
	flex-wrap: wrap;
	margin: 1.5rem 0;
}

.body-image .image-wrapper[data-h-1] {
	width: 100%;
	display: grid;
	margin: 0;
}

.body-image .image-list[data-h-1] {
	grid-column: auto;
	grid-row: auto;
	max-height: 21rem;
}

.body-image .image-list>.image[data-h-1] {
	width: 100%;
	height: 100%;
	max-height: inherit;
	border-radius: 8px;
	border: 0.0625rem solid #f4f4f4;
	box-sizing: border-box;
	object-fit: cover;
	cursor: pointer;
}

.body-container .body-list[data-g-1] {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 3.25rem;
}

.greate[data-j-1] {
	display: flex;
	align-items: center;
	width: 100%;
}

.greate .like[data-j-1] {
	cursor: pointer;
	display: flex;
	align-items: center;
	padding: 1.25rem 0.25rem;
	margin-right: 1.25rem;
	color: #888;
}

.greate .like .text[data-j-1] {
	font-weight: 500;
	font-size: 14px;
	line-height: 1.14285714;
}

.greate .item[data-j-1] {
	display: flex;
	align-items: center;
	padding: 1.25rem 0.25rem;
	margin-right: 1.25rem;
	color: #888;
}

.comments-container[data-k-1] {
	position: relative;
	width: 100%;
	margin-bottom: 10rem;
}

.input-box[data-k-1] {
	display: flex;
	align-items: flex-start;
	position: relative;
	margin: 1.25rem 0;
	padding: 1.0625rem 0.875rem;
	border-radius: 8px;
	border: 0;
}

.input-box:foucs {
	border: orange;
}

.input-box .comments-body[data-k-1] {
	width: 100%;
	position: relative;
}

.input-box .comments-body .comment-input[data-k-1] {
	width: 100%;
	min-height: 1.375rem;
	padding: 0;
	font-size: .875rem;
	font-weight: bold;
	color: #2d2d2d;
	outline: none;
	border: 0;
}

.comment-input {
	font-size: 14px;
	line-height: 1.57142857;
	letter-spacing: -.3px;
}

.form-control {
	display: block;
	font-weight: 400;
	line-height: 1.5;
	background-color: #fff;
	background-clip: padding-box;
	border-radius: 0.25rem;
}

.input-box .submit-line[data-k-1] {
	margin-bottom: auto;
	display: none;
	white-space: nowrap;
	color: #00c7ae;
	font-size: 14px;
	line-height: 1.14285714;
	font-weight: 500;
	cursor: pointer;
}

.input-box .submit-line1[data-k-1] {
	margin-bottom: auto;
	white-space: nowrap;
	color: #00c7ae;
	font-size: 14px;
	line-height: 1.14285714;
	font-weight: 500;
}

.comments-list[data-z-1] {
	width: 100%;
	margin-bottom: 0;
}

.comments-list-item[data-x-1] {
	display: flex;
	flex-direction: column;
}

.comment-wrapper[data-c-1] {
	display: flex;
	padding: 1.5rem;
}

.comment-wrapper .profile-image[data-c-1] {
	cursor: pointer;
}

.comment-wrapper .profile-image .image[data-c-1] {
	width: 2rem;
	height: 2rem;
	border-radius: 8px;
	border: 0.0625rem solid #f2f2f2;
	box-sizing: content-box;
}

.comment-wrapper .comment-information[data-c-1] {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	margin-left: 0.75rem;
}

.comment-wrapper .comment-information .user-info[data-c-1] {
	cursor: pointer;
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	margin-bottom: 0.5rem;
}

.comment-wrapper .comment-information .user-info[data-c-1] {
	display: flex;
	flex-direction: column;
	margin-top: -0.1875rem;
}

.comment-wrapper .comment-information .user-info .user-name[data-c-1] {
	display: inline-block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	height: 1.375rem;
}

.comment-wrapper .comment-information .comment-action[data-c-1] {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 0.9375rem;
	font-size: 12px;
	line-height: 1.5;
	letter-spacing: -.2px;
}

.comment-wrapper .comment-information .comment-action .comment-react[data-c-1]
	{
	display: flex;
	align-items: center;
}

.comment-wrapper .comment-information .comment-action .comment-react .like-area[data-c-1]
	{
	display: flex;
	align-items: center;
	cursor: pointer;
}


/* 수정 및 삭제하기 버튼 */
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
/* 게시물 신고하기 버튼 */
#report1 {
	background-color: white;
    color: #dc5555;
    border: solid;
    border-radius: 12px;
    text-decoration: none;
}
#report1:hover {
	background-color: #dc5555;
    color: white;
}

/* 신고하기 버튼 */
#btn2 {
	background-color: white;
    color: #dc5555;
    border: solid;
    border-radius: 12px;
    text-decoration: none;
}
#btn2:hover {
	background-color: #dc5555;
    color: white;
}


/* 목록 버튼 */
#btn {
	background-color: white;
 	color: orange; 
 	outline-color: rgb(248, 162, 3); 
 	border: solid; 
 	border-radius: 10px;
 	text-decoration: none; 
 	font-weight: bold; 
 	font-size: 18px;
}

#btn:hover { 
 	background-color: orange; 
 	color: white; 
 } 
</style>
</head>
<body class="bdy">
    <div id="app">
        <%@ include file="../common/header.jsp" %>
        <div id="app-body">
            <div data-v-1 class="community-container container">
                <div data-a-1 data-v-1 class="meister-container">
                    <section data-s-1 data-a-1 class="detail-container">
                        <div data-d-1 data-s-1 class="detail-header">
                            <div data-d-1 class="detail-title">
                                <h1 data-d-1 class="header-text"><%=b.getBoardTitle()%></h1>
                            </div>
                            <div data-f-1 data-d-1 class="nickname-container">
                                <div data-d-1 data-f-1 class="user-profile">
                                    <div data-d-1 class="profile-area" style="display:flex; text-decoration: none; background-color: transparent;">
<%--                                      	<img data-d-1 class="profile-image" src="<%=contextPath %>/<%=at.getFilePath() %>/<%=at.getChangeName() %>"> --%>
                                        <div data-d-1 class="profile-info">
                                            <span data-d-1 class="profile-name">
                                            	<%= b.getMemberNic() %>
                                            </span>
                                            <span data-d-1 class="profile-date"><%=b.getBoardDate() %></span>
                                        </div>
                                    </div>
                                    <div data-f-1 data-d-1>
                                        <div data-d-1 data-f-1 class="btn">
 	                                        <% if(loginUser != null && loginUser.getUserNo() == b.getUserNo()) { %> 
	                                        	<a href="<%=contextPath %>/updateForm.bo?bno=<%=b.getBoardNo() %>" class="btn1">수정하기</a>
												<a href="<%=contextPath %>/delete.bo?bno=<%=b.getBoardNo() %>" class="btn1">삭제하기</a>
 											<% } else { %>
 													<a href="<%=contextPath %>/report.me?bno=<%=b.getBoardNo() %>" id="report1">신고하기</a>
											<% } %>
                                        </div>
                                    </div>
                                </div>
                                <div data-d-1 class="bin"></div>
                            </div>
                            <hr data-s-1 class="hr-sen">
                        </div>
                        <div data-g-1 data-s-1 class="body-container">
                            <div data-g-1 class="body-contents">
                                <p data-g-1 class="body-text">
                                    <span data-g-1><%=b.getBoardContent() %></span>
                                </p>
                            </div>
                            <div data-h-1 data-g-1 class="body-image">
                                <ul data-h-1 class="image-wrapper">
                                    <li data-h-1 class="image-list">
  										<img data-h-1 class="image" src="<%=contextPath%>/<%=at.getFilePath()%>/<%=at.getChangeName()%>">
                                    </li>
                                </ul>
                            </div>
                            <ul data-s-1 class="body-list"></ul>
                            <div data-j-1 data-s-1 class="greate" style='display:inline-block; float:left;'>
                                <div data-j-1 class="like" style='display:inline-block; float:left;'>
                                    <i class="bi bi-hand-thumbs-up"></i><span data-j-1 class="text2">좋아요 <%=b.getBoardRecommend() %></span>
                                </div>
                                <div data-j-1 class="item" style='display:inline-block; float:left;'>
                                    <span data-j-1 class="text3">댓글 <%=b.getReplyCount()%></span>
                                </div>
                                <div data-j-1 class="item" style='display:inline-block; float:right;'>
                            	<a href="<%=contextPath %>/boardlist.bo?currentPage=1" id="btn">목록</a>
                            	</div>
                            	<br clear='both'>
                            </div>
                        </div>
                        <hr data-s-1 class="hr-sen">
                        <div data-k-1 data-s-1 class="comments-container">
                            <div data-l-1 data-k-1 class="input-box">
                            	<% if(loginUser != null) { %>
                                <div data-k-1 class="comments-body">
                                    <textarea data-k-1  class="comment-input .form-control" id="replyContent" placeholder="댓글을 남겨보세요" rows="1" maxlength="50" style="height:22px; overflow:hidden; resize: none;"></textarea>
                                </div>
                                <div data-k-1 class="submit-line" id="submit" onclick= "insertReply();">등록</div>
                                <% } else { %>
                                <div data-k-1 class="comments-body">
                                    <textarea data-k-1 class="comment-input .form-control" rows="1" maxlength="50" style="height:25px; resize: none;" readonly>로그인 후 이용가능한 서비스</textarea>
                                </div>
                                <div data-k-1 class="submit-line1">등록</div>
                                <% } %>
                            </div>
                            <ul data-z-1 data-k-1 class="comments-list">
                            	
                            </ul>
                        </div>
                    </section>
                </div>
            </div>
        </div>
	</div>

	<%@ include file="../common/footer.jsp" %>

	<script>
	
	// 댓글 키업 시 등록 버튼 활성화
		$(function () {
	        $('#replyContent').keyup(function () {
	            if ($("#replyContent").val() != "") {
	            	$("#submit").show();
	            }else{
	            	$("#submit").hide();
	            }
	            
	        });
        });
	</script>
	
	<script>
		$(function() {
			selectReplyList();
			
// 			setInterval(selectReplyList, 2000);
		})
		
		// 댓글 등록
		function insertReply() {
			$.ajax({
				url : "rinsert.bo",
				data : {
					content : $("#replyContent").val(), // 댓글 내용
					bno     : ${b.boardNo} // 게시물 번호
				},
				type : "post",
				success : function(result) {
					if(result > 0) { // result => 1이면 댓글등록 성공 => 갱신된 댓글리스트 조회
						selectReplyList();
						$("#replyContent").val("");
					}
				},
				error : function() {
					console.log("댓글작성용 ajax 통신 실패");
				}
			});
		};
		
		// 댓글 리스트
		function selectReplyList(){
	
		 	var loginNo = "<%=loginUser.getUserNo()%>";
		 	var bno = "<%=b.getBoardNo()%>";
		 	var index = 0;
		 	 
			$.ajax({
				url : "rlist.bo",
				data : {bno : ${b.boardNo}},
				success : (list) => {
					console.log(list)
					let htmls="";
					for(let i of list) {
						index += 1;
						htmls += '<li data-x-1  data-z-1 class="comments-list-item">';
						htmls += '<div data-c-1 data-x-1 class="comment-wrapper">';
						htmls += '<div data-c-1 class="profile-image">';
						htmls +=  "<img data-c-1 class='image' src='<%=contextPath %>/"+i.at.filePath+"/"+i.at.changeName+"'>";
						htmls += '</div>';
						htmls += '<div data-c-1 class="comment-information">';
						htmls +=    '<div data-c-1 class="user-info">';
						htmls +=        '<span data-c-1 class="user-name">'+i.mbNic+'</span>';
						htmls +=    '</div>';
						htmls +=    '<div data-c-1 class="content">';
						htmls +=        '<p data-c-1 class="text comment-input">'; // 
						htmls +=            '<span data-c-1 id="replycontent'+index+'" style="font-weight: 400px;width:100%; display:block" contenteditable=false>'+i.replyContent+'</span>'; //
						htmls +=        '</p>';
						htmls +=    '</div>';
						htmls +=    '<div data-c-1 class="comment-action">';
						htmls +=        '<div data-c-1 class="comment-react">';
						htmls +=            '<span data-c-1 class="text">'+i.replyDate+'</span>';
						htmls +=            '<div data-c-1 class="like-area">';
						htmls +=                '<span data-c-1 class="text"></span>';
						htmls +=            '</div>';
						htmls +=        '</div>';
						if(loginNo == i.userNo){ // 로그인 유저
			                htmls    +=        '<div data-c-1 class="more-action">';
			                htmls    +=            '<div data-c-1 class="btn-sgroup">';
			                							// 내가 등록한 댓글 수정하기 삭제하기 버튼 보여주기
                			htmls	 +=					'<button type="button" id="btn1" name="rno" onclick="replyUpdate('+index+', '+i.replyNo+', '+bno+')";>수정하기</button>';
			                htmls    +=               	'<button type="button" id="btn1" name="rno" onclick="replyDelete('+i.replyNo+', '+bno+')">삭제하기</button>';			
						} else {						// 내가 등록한 댓글이 아니면 신고하기 버튼 보여주기
				               htmls    +=                "<a href='<%=contextPath %>/report.me?rno="+i.replyNo+"'><button type='button' id='btn2'>신고하기</button></a>";
				               htmls    +=            '</div>';
			                htmls    +=        '</div>';
						 } 
		                htmls    +=    '</div>';
		                htmls    += '</div>';
		                htmls     += '</div>';
		                htmls	+= '</li>';
					}
					$(".comments-list").html(htmls);
				},
				error : function() {
					console.log("댓글리스트조회용 ajax통신 실패~");
				}
			});
		};
		
		// 댓글 수정
		function replyUpdate(index, rno, bno){
			var isUpdate = $("#replycontent"+index).attr("contenteditable");
			// contenteditable: 태그를 편집하고 싶을 때 사용 // 사용방법: ("contenteditable", true)
			
			if(isUpdate == "false"){ // 문자열 비교 false(X)
				$("#replycontent"+index).attr("contenteditable", true);
				$("#replycontent"+index).focus();
				return false;
			}
			else {
				var content = $("#replycontent"+index).text();
				location.href="<%=contextPath%>" + "/update.ro?rno="+rno+"&bno="+bno+"&content="+content;
			}
		}
		
		// 댓글 삭제
		function replyDelete(rno, bno){
			location.href="<%=contextPath%>" + "/delete.ro?rno="+rno+"&bno="+bno;
		}
		
// 			e.preventDefault();// 한번 클릭후 다음 클릭 방지
// 			likeBtn = false; // 변수 likeBtn을 true에서 false로 변경
// 		let likeBtn = true; // 변수 likeBtn을 true로 선언
		
		// 좋아요 기능
		$(document).on("click", "div.like", (e) => { /* 이벤트 인자 */
			$.ajax({
				url : "boardLike.bo",
				type : "post",
				data : { boardNo : <%=b.getBoardNo() %>, type : "I" }, //Insert의 약자
				success : function(data) {
					if (data.result == 1) { // 성공 시 좋아요 카운터 1
						alert("좋아요가 등록되었습니다.");
						$(".like > .text2").text("좋아요 " + data.recommend);
					} else if (data.result == 2) { // 한번 더 클릭 시 1 + 1 증가 할 때 한번 더 비동기 통신 요청을 보냄 
						if (confirm("이미 좋아요를 누르신 글입니다.\n취소하시겠습니까?")) { // result 값이 2일때 확인 여부 
							$.ajax({
								url : "boardLike.bo",
								type : "post",
								data : { boardNo : <%=b.getBoardNo() %>, type : "D" }, // Delete의 약자
								success : function(data) {
									if (data.result == 1) {
										alert("취소되었습니다.");
										$(".like > .text2").text("좋아요 " + data.recommend); // 좋아요 + 카운터 갯수
									}
								},
								error : function() {
									console.log("error");
								}
							})
						}
					} else {
						alert("오류가 발생했습니다.");
					}
				},
				error : function() {
					console.log("error");
				},
// 				done : function() { // 성공 시 버튼 실행
// 					likeBtn = true;
// 				}
			});
		});
 	</script>

	
</body>
</html>
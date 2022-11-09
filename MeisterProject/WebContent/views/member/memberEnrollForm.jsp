<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
<style>
    .member {
        width: 450px;
        height: auto;
        margin: auto;
        padding-top: 120px;
        margin-bottom: 20px;
    }

    .member .logo {
        display: block;
        width: 400px;
        margin: auto;
        margin: 50px auto;
    }

    .member .field {
        margin: 5px 0;
    }
    
    .member #field {
        position: relative;
        
    }

    #idchkBtn {
        position: absolute;
        width: 90px;
        height: 40px;
        top: 0;
        bottom: -28px;
        right: 5px;
        margin: auto 0;
        border-radius: 6px;
        border: none;
        background-color: orange;
    }

    .member b {
        display: block;
        margin-bottom: 5px;
    }

    .member input:not(input[type=checkbox]), .member #btn[type=submit], .member select{
    	border-radius: 6px;
        padding: 15px;
        width: 100%;
        margin-bottom: 5px;
        border: 1px solid orange;
    }
    
    .member button[type=button], .member #btn[type=submit] {
        background-color: orange;
        color: white;
    }

    .userId {
        display: block;
        position: relative;
    }

    .userPwd {
        background-size: 20px;
    }
    .userPwd2 {
        background-size: 20px;
    }
    
    *:focus {
     outline: none;
     border: 1px solid orange;
	}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<div class="member">
        <br>
        <h1 style="text-align: center">회원가입</h1>
        
        <form id="enroll-form" name="form1" action="<%=contextPath %>/insert.me" method="post">
        
	        <!-- 1. 로고 -->
	        <img class="logo" src="<%= contextPath %>/resources/image/logo.png" />
	
	        <!-- 2. 필드 -->
	        <div id="field">
	            <b>아이디 & 이메일 *</b>
	            <input id="userId" class="userId" type="text" maxlength="30" placeholder="example@meister.com" required>
	            <div data-v-149435f8="" class="invalid-feedback">이메일을 입력해주세요.</div>
	            <button id="idchkBtn" type="button" onclick="idCheck();">중복확인</button>
	        </div>
	        <br>
	        <div class="field">
	            <b>비밀번호 *</b>
	            <input type="password" id="userPwd" class="userPwd" name="userPwd" maxlength="20" placeholder="비밀번호를 입력해주세요. (6자리 이상)" required>
	            <input type="password" id="userPwd2" class="userPwd" name="userPwd2" maxlength="20" required>
				<font id="chkNotice" size="3"></font>
	        </div>
	        <br>
	        <div class="field">
	            <b>닉네임 *</b>
	            <input type="text" id="nickname" maxlength="5" placeholder="닉네임을 입력해주세요." required onkeyup="nicknameCheck();">
	            <font id="chkNick" size="3"></font>
	        </div>
	        <br>
	        <!-- 3. 필드(관심사 선택) -->
	        <div class="field">
	            <b>관심사 선택 *</b>
	            <div>
	                <select  required>
	                    <option style="text-align: center;" value="">관심사를 선택해 주세요.</option>
	                    <option style="text-align: center;" value="sports">운동</option>
	                    <option style="text-align: center;" value="move">영화</option>
	                    <option style="text-align: center;" value="video">영상</option>
	                    <option style="text-align: center;" value="game">게임</option>
	                    <option style="text-align: center;" value="it">IT</option>
	                    <option style="text-align: center;" value="cook">요리</option>
	                </select>
	            </div>
	        </div>
	        
	        <br>

	        <!-- 4. 필드(이용약관) -->
	        <div class="field" id="checkbox_group">
	            <input type="checkbox" id="check_all" class="normal" value="동의">
	            <label for="check_all">전체 동의</label>
	            <br><br>
	           	<input type="checkbox" id="check_1" class="normal" value="동의" required>
	            <label for="check_1">개인정보 제3자 제공 (필수)</label><br>
	            <textarea style="resize: none; width:100%; height: 60px;">위 개인정보는 수집⦁ 이용에 관한 동의일로부터 채용절차 종료 시까지 위 이용목적을 위하여 보유 및 이용하며 단 채용절차 종료 후에는 고용계약의 유지, 분쟁해결 및 법령상의무이행을 위하여 보유 이용한다.</textarea>
	            <br><br>
	            <input type="checkbox" id="check_2" class="normal" value="동의" required>
	            <label for="check_2">개인정보 처리방침 동의 (필수)</label><br>
	            <textarea style="resize: none; width:100%; height: 60px;">개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. 
1. 수집하는 개인정보이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다.단, 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.
만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.
- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
네이버에서 제공하는 위치기반 서비스에 대해서는 '네이버 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
				</textarea>
	            <br><br>
	            <input type="checkbox" id="check_3" class="normal" value="동의">
	            <label for="check_3">마케팅 수신 동의 (선택)</label><br>
	            <b>일부 서비스(별도 회원 체계로 운영하거나 meister 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.</b>
	        </div>
			<br>
        	<!-- 5. 가입하기 버튼 -->
        	<button id="btn" type="submit" disabled onclick="return vlidate();">가입하기</button>
        </form>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
    
    <script>
    
    </script>
    
    <script>
    	$(function(){
		    $("#userPwd").keyup(function(){
		      $("#chkNotice").html("");
		    });

    		$("#userPwd2").keyup(function(){
			        if($("#userPwd").val() != $("#userPwd2").val()){
			          $("#chkNotice").html("비밀번호 일치하지 않음<br>");
			          $("#chkNotice").attr("color", "crimson");
			        } else{
			          $("#chkNotice").html("비밀번호 일치함<br>");
			          $("#chkNotice").attr("color", "darkslateblue");
			        }
			        if($("#userPwd").val().length < 6 || $("#userPwd").val().length > 20) {
			        	$("#chkNotice").html("비밀번호는 6 ~ 20자 이내로 입력하세요.<br>");
			        	$("#chkNotice").attr("color", "green");
			        }
		    })
    	 
		   
    
   	    	
   		
    	    	
    	    
    	
   	 // 체크박스 전체 선택
	    $("#checkbox_group").on("click", "#check_all", function () {
	        $(this).parents("#checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	    });
	
	    // 체크박스 개별 선택
	    $("#checkbox_group").on("click", ".normal", function() {
	        let is_checked = true;
	
	        $("#checkbox_group .normal").each(function(){
	            is_checked = is_checked && $(this).is(":checked");
	        });
	
	        $("#check_all").prop("checked", is_checked);
	    	});

	    
	});
   
    </script>
    <script>
	    function nicknameCheck() {
	    	let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	    	let nickname = $("#nickname").val();
	    	let test = $("#chkNick").html("");
	    	
	    	if(!regExp.test(nickname)) {
	    		$(test).html("닉네임을 문자1 + 숫자1 입력해주세요.");
	    		$(test).css("color", "crimson");
	    	} else {
	    		
	    	}
	    	
	    	
	    	$.ajax({
	    		url : "checkName.me",
	    		data : {nickname : nickname},
	    		success : function(result) {
	    			if(result == "NNNNN") {
	    				$(test).html("사용중인 닉네임 입니다. 다른 닉네임을 입력해주세요.");
	    			} else {
	    				$(test).html("사용 가능한 닉네임 입니다.");
	    			}
	    		},
	    		error : function() {
	    			console.log("닉네임 중복체크용 ajax통신 실패");
	    		}
	    	})
	    }
    </script>
    <script>
	    function idCheck() {
	    	// 아이디를 입력하는 input 요소 객체
	        let $userId = $("#userId");
	        let regExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	        
	        if($userId.val() == ""){
	        	alert("아이디를 입력하세요");
	        	$userId.focus();
	        	return false;
	        }
	        
	        else {
				if(!regExp.test($userId.val())) {
					alert("이메일 형식이 아닌 아이디 입니다.");
					$userId.focus();
					return false;
				}
	        }
	    
	    	// name이 userId인 요소가 member.jsp에도 있어서 확실하게 어디에 속해있는 요소인지 잘 적어줘야함.
	    	$.ajax({
	    		url : "idCheck.me",
	    		data : {checkId : $userId.val()},
	    		success : function(result) {
	    			if(result == "NNNNN") { // 아이디 사용불가 (이미 존재하거나 탈퇴한 회원만)
	    				alert("이미 존재하거나 회원탈퇴한 아이디입니다.");
	    				$userId.focus();
	    			}	else { // 아이디 사용 가능
	    				if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
	    					$("#idchkBtn").text("확인완료");
	    					$("#idchkBtn").css("opacity", "0.7");
	    					$("#idchkBtn").attr("disabled",true);
	    					
	    					$("#enroll-form :submit").removeAttr("disabled");
	    		            $userId.attr("readonly", true); // 아이디값 확정
	    				} else { // 사용안함
	    					
	    					$userId.focus();
	    				}
	    			}
	    		},
	    		error : function() {
	    			console.log("아이디 중복체크용 ajax통신 실패");
	    		}
	    	});
	    }
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
<style>
    * {
        box-sizing: border-box;
        outline: none;
    }

    body {
        font-size: 14px;
        line-height: 1.5em;
        margin: 1px;
    }

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

    #field button {
        position: absolute;
        width: 90px;
        height: 40px;
        top: 0;
        bottom: -20px;
        right: 5px;
        margin: auto 0;
        border-radius: 6px;
        background-color: orange;
    }

    .member b {
        display: block;
        margin-bottom: 5px;
    }

    .member input:not(input[type=checkbox]), .member #btn[type=submit], .member select {
    	border-radius: 6px;
        padding: 15px;
        width: 100%;
        margin-bottom: 5px;
    }
    
    .member input:not(input[type=checkbox], input[type=button]):focus {
        border-color: orange;
            
    }

    .member input[type=button], .member #btn[type=submit] {
        background-color: orange;
    }

    .userId {
        display: block;
        position: relative;
    }

    .userPwd {
        background-size: 20px;
    }
    .userPwd-confirm {
        background-size: 20px;
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
        
        <form id="enroll-form" action="<%=contextPath %>/insert.me" method="post">
        
        <!-- 1. 로고 -->
        <img class="logo" src="<%= contextPath %>/resources/image/logo.png" />

        <!-- 2. 필드 -->
        <div id="field">
            <b>아이디 & 이메일 *</b>
            <span class="userId"><input type="text" maxlength="20" placeholder="example@meister.com" required></span>
            <button id="user" type="button" onclick="idCheck();">중복확인</button>
        </div>
        <br>
        <div class="field">
            <b>비밀번호 *</b>
            <span class="userPwd"><input type="password" maxlength="20" placeholder="비밀번호를 입력해주세요. (6자리 이상)" required></span>
            <span class="userPwd-confirm"><input type="password" maxlength="20" required></span>
        </div>
        <br>
        <div class="field">
            <b>닉네임 *</b>
            <span class="nickname"><input type="text" maxlength="5" placeholder="아깽이" required></span>
        </div>
        <br>
        <!-- 3. 필드(관심사 선택) -->
        <div class="field">
            <b>관심사 선택 *</b>
            <div>
                <select  required>
                    <option value="">관심사를 선택해 주세요.</option>
                    <option value="">운동</option>
                    <option value="">영화</option>
                    <option value="">영상</option>
                    <option value="">게임</option>
                    <option value="">IT</option>
                    <option value="">요리</option>
                </select>
            </div>
        </div>

        <!-- 4. 필드(이용약관) -->
        <div class="field">
            <span><input type="checkbox" id="all" value="동의"></span>
            <label for="all">전체 동의</label>
            <br>
            <span><input type="checkbox" id="age" value="동의"></span>
            <label for="age">만 14세 이상 동의</label>
        </div>

        <!-- 5. 가입하기 버튼 -->
        <button id="btn" type="submit" onclick="return checkAll();">가입하기</button>
        </form>
    </div>
    
    <script>
	    function checkAll() {
	        if (!checkUserId(userId.value)) {
	            return false;
	        }
	        if (!checkPassword(form.userId.value, form.password1.value,    form.password2.value)) {
	            return false;
	        }
	        if (!checkMail(form.mail.value)) {
	            return false;
	        }
	        if (!checkName(form.name.value)) {
	            return false;
	        }
	        if (!checkBirth(form.identi1.value, form.identi2.value)) {
	            return false;
	        }
	        if (!checkFavorite()) {
	            return false;
	        }
	        if (!checkIntro()) {
	            return false;
	        }
	 
	        return true;
	    }
	 
	    // 공백확인 함수
	    function checkExistData(value, dataName) {
	        if (value == "") {
	            alert(dataName + " 입력해주세요!");
	            return false;
	        }
	        return true;
	    }
	 
	    function checkUserId(id) {
	        //Id가 입력되었는지 확인하기
	        if (!checkExistData(id, "아이디를"))
	            return false;
	 
	        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
	        if (!idRegExp.test(id)) {
	            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            form.userId.value = "";
	            form.userId.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
	 
	    function checkPassword(id, password1, password2) {
	        //비밀번호가 입력되었는지 확인하기
	        if (!checkExistData(password1, "비밀번호를"))
	            return false;
	        //비밀번호 확인이 입력되었는지 확인하기
	        if (!checkExistData(password2, "비밀번호 확인을"))
	            return false;
	 
	        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
	        if (!password1RegExp.test(password1)) {
	            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            form.password1.value = "";
	            form.password1.focus();
	            return false;
	        }
	        //비밀번호와 비밀번호 확인이 맞지 않다면..
	        if (password1 != password2) {
	            alert("두 비밀번호가 맞지 않습니다.");
	            form.password1.value = "";
	            form.password2.value = "";
	            form.password2.focus();
	            return false;
	        }
	 
	        //아이디와 비밀번호가 같을 때..
	        if (id == password1) {
	            alert("아이디와 비밀번호는 같을 수 없습니다!");
	            form.password1.value = "";
	            form.password2.value = "";
	            form.password2.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
	 
	    function checkMail(mail) {
	        //mail이 입력되었는지 확인하기
	        if (!checkExistData(mail, "이메일을"))
	            return false;
	 
	        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	        if (!emailRegExp.test(mail)) {
	            alert("이메일 형식이 올바르지 않습니다!");
	            form.mail.value = "";
	            form.mail.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
	 
	    function checkName(name) {
	        if (!checkExistData(name, "이름을"))
	            return false;
	 
	        var nameRegExp = /^[가-힣]{2,4}$/;
	        if (!nameRegExp.test(name)) {
	            alert("이름이 올바르지 않습니다.");
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
    </script>
</body>
</html>
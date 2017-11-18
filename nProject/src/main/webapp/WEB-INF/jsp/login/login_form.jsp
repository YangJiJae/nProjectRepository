<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8">
<link href="../css/login/login_form.css" rel="stylesheet" type="text/css">
</head>
<body id="login_main_body">
	<h3 id="login_form_title">로그인</h3>
	<div class="login_form_conTot" id="login_form_conTot">
		<li id="login_form_userType">개인 회원</li>
		<li id="login_form_companyType">가맹점 회원</li>
		
		<form name="login_form_form" method="post">
			<input type="text" name="login_form_id" id="login_form_id" placeholder="이메일  or 연락처 (개인회원)">
			<input type="text" name="login_form_comid" id="login_form_comid" placeholder="아이디 (가맹점)">
				<li id="login_form_idtot_text">aaa</li>
			<input type="password" name="login_form_pw" id="login_form_pw" placeholder="비밀번호">
				<li id="login_form_pw_text">bbb</li>
			<input type="hidden" name="login_form_typetot" id="login_form_typetot">
		</form>	
		
		<input type="button" id="login_form_loginGoBtn" value="로그인">

		<li id="login_form_joinBtn">» 회원가입</li>
		<li id="login_form_searchIdBtn">» 연락처 / 이메일 / 아이디 기억이 안나요</li>
		<li id="login_form_searchPwBtn">» 비밀번호 기억이 안나요</li>
	</div>
	<script src="../js/login/login_form.js"></script>
</body>
</html>
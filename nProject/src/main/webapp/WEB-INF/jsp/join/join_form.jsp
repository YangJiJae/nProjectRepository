<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8">
<link href="../css/join/join_form.css" rel="stylesheet" type="text/css">
</head>
<body id="join_main_body">
	<h3 id="join_form_title">회원가입(개인)</h3>
	<div id="join_form_typeTot">
		<li id="join_form_type1">개인</li>
		<li id="join_form_type2">가맹점 신청 »</li>
	</div>
	<div class="join_form_conTot" id="join_form_conTot1">
		<li id="join_form_telType">연락처로 가입</li>
		<li id="join_form_emType">이메일로 가입</li>
		<form name="join_form_form" method="post">
			<input type="tel" name="join_form_tel" id="join_form_tel" placeholder="연락처">
				<li id="join_form_tel_text"></li>
			<input type="email" name="join_form_email" id="join_form_email" placeholder="이메일">
				<li id="join_form_email_text"></li>
			<input type="text" name="join_form_name" id="join_form_name" placeholder="성명">
				<li id="join_form_name_text"></li>
			<input type="password" name="join_form_pw" id="join_form_pw" placeholder="비밀번호">
				<li id="join_form_pw_text"></li>
			<input type="password" id="join_form_pwc" placeholder="비밀번호 확인">
				<li id="join_form_pwc_text"></li>
			<input type="hidden" name="join_form_date" id="join_form_date">
		</form>
		
		<div id="join_form_agreeAllCheck_Tot">
			<div id="join_form_agreeAllCheck">
				<span id="join_form_checkImg1" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="join_form_agreeAllCheckText">아래 내용에 모두 동의</div>
		</div>
		<br>
		<div id="join_form_agreeCheck_Tot">
			<div id="join_form_agreeCheck1">
				<span id="join_form_checkImg2" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="join_form_agreeCheckText1">
				<a href="../join/agree1.jsp" target="_blank">이용약관 동의</a>
			</div>
			<br>
			<br>
			<div id="join_form_agreeCheck2">
				<span id="join_form_checkImg2" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="join_form_agreeCheckText2">
				<a href="../join/agree2.jsp" target="_blank">개인정보 수집/이용 동의</a>
			</div>
		</div>
		<br>
		<input type="button" id="join_form_joinGoBtn" value="회원가입">
	</div>
	<script src="../js/join/join_form.js"></script>
	<script src="../lib/jquery-3.1.1.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8">
<link href="../css/join/comjoin_form.css" rel="stylesheet" type="text/css">
</head>
<body id="comjoin_main_body">
	<h3 id="comjoin_form_title">회원가입(가맹점)</h3>
	<div class="comjoin_form_conTot" id="comjoin_form_conTot2">
	<form name="comjoin_form_form" method="post">
		<input type="text" name="comjoin_form_comCaptainName" id="comjoin_form_comCaptainName" placeholder="대표자 성명">
			<li id="comjoin_form_comCaptainName_text"></li>
		<input type="text" name="comjoin_form_comOfficName" id="comjoin_form_comOfficName" placeholder="회사명칭">
			<li id="comjoin_form_comOfficName_text"></li>
		<input type="text" name="comjoin_form_comOfficAddress" id="comjoin_form_comOfficAddress" placeholder="회사주소">
			<li id="comjoin_form_comOfficAddress_text"></li>
		<input type="tel" name="comjoin_form_comOfficTel" id="comjoin_form_comOfficTel" placeholder="회사연락처">
			<li id="comjoin_form_comOfficTel_text"></li>
		<input type="tel" name="comjoin_form_comTel" id="comjoin_form_comTel" placeholder="휴대전화">
			<li id="comjoin_form_comTel_text"></li>
		<input type="email" name="comjoin_form_comEmail" id="comjoin_form_comEmail" placeholder="이메일">
			<li id="comjoin_form_comEmail_text"></li>
		<input type="text" name="comjoin_form_comId" id="comjoin_form_comId" placeholder="아이디">
			<li id="comjoin_form_comId_text"></li>
		<input type="password" name="comjoin_form_comPw" id="comjoin_form_comPw" placeholder="비밀번호">
			<li id="comjoin_form_comPw_text"></li>
		<input type="password" id="comjoin_form_comPwc" placeholder="비밀번호 확인">
			<li id="comjoin_form_comPwc_text"></li>
		<input type="hidden" name="comjoin_form_date" id="comjoin_form_date">
	</form>
		<div id="comjoin_form_agreeAllCheck_Tot">
			<div id="comjoin_form_agreeAllCheck">
				<span id="comjoin_form_checkImg1" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="comjoin_form_agreeAllCheckText">아래 내용에 모두 동의</div>
		</div>
		<br>
		<div id="comjoin_form_agreeCheck_Tot">
			<div id="comjoin_form_agreeCheck1">
				<span id="comjoin_form_checkImg2" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="comjoin_form_agreeCheckText1">
				<a href="../join/agree1.jsp" target="_blank">이용약관 동의</a>
			</div>
			<br>
			<br>
			<div id="comjoin_form_agreeCheck2">
				<span id="comjoin_form_checkImg2" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="comjoin_form_agreeCheckText2">
				<a href="../join/agree2.jsp" target="_blank">개인정보 수집/이용 동의</a>
			</div>
		</div>
		<br>
		<input type="button" id="comjoin_form_joinGoBtn" value="가맹점 가입">
	</div>
	
	<script src="../js/join/comjoin_form.js"></script>
	<script src="../lib/jquery-3.1.1.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/login/login_form.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//로그인 실패시
	var errorCd = '${errorCd }';
	var errorMsg = '${errorMsg }';
	if(errorMsg != '') alert(errorMsg);
	
	
	var idok="no";
	var pwok="no";

	loginUserCom();
	//EventCheck();

	//로그인시 개인회원,가맹점 구분
	//아이디,비번 이벤트
	function loginUserCom(){
		var UserType=document.getElementById("login_form_userType");//개인회원
		var ComType=document.getElementById("login_form_companyType");//가맹점
		var id=document.getElementById("login_form_id");//개인회원 이메일,연락처 입력창
		var comid=document.getElementById("login_form_comid");//가맹점 아이디 입력창
		var pw=document.getElementById("login_form_pw");//가맹점 아이디 입력창
		var idtext=document.getElementById("login_form_idtot_text");//개인,가맹점 아이디 text알림
		var pwtext=document.getElementById("login_form_pw_text");//개인,가맹점 비번 text알림
		
		var typetot=document.getElementById("login_form_typetot");//개인인지 가맹점인지 구분
		typetot.value="user";
		
		var loginBtn=document.getElementById("login_form_loginGoBtn");//로그인 버튼클릭
		
		//개인회원 버튼 클릭시
		UserType.onclick=function(){
			UserType.style.borderTop="1px solid #A6A6A6";
			UserType.style.borderLeft="1px solid #A6A6A6";
			UserType.style.borderRight="1px solid #A6A6A6";
			UserType.style.borderBottom="0px";
			UserType.style.color="#368D9C";
			
			ComType.style.borderTop="0px";
			ComType.style.borderLeft="0px";
			ComType.style.borderRight="0px";
			ComType.style.borderBottom="1px solid #A6A6A6";
			ComType.style.color="#A6A6A6";
			
			id.style.display="inline-block";
			comid.style.display="none";
			
			typetot.value="user";
			
			idtext.style.display="none";
			idok="no";
			id.value="";
			comid.value="";
		}
		//가맹점회원 버튼 클릭시
		ComType.onclick=function(){
			ComType.style.borderTop="1px solid #A6A6A6";
			ComType.style.borderLeft="1px solid #A6A6A6";
			ComType.style.borderRight="1px solid #A6A6A6";
			ComType.style.borderBottom="0px";
			ComType.style.color="#368D9C";
			
			UserType.style.borderTop="0px";
			UserType.style.borderLeft="0px";
			UserType.style.borderRight="0px";
			UserType.style.borderBottom="1px solid #A6A6A6";
			UserType.style.color="#A6A6A6";
			
			comid.style.display="inline-block";
			id.style.display="none";
			
			typetot.value="com";
			
			idtext.style.display="none";
			idok="no";
			id.value="";
			comid.value="";
		}
		
		//이메일 연락처(개인)
		id.onblur=function(){
			if(id.value==""){//아무 값도 없을 때
				idtext.style.display="block";
				idtext.innerHTML="가입한 이메일 이나 연락처를 입력하세요";
				idok="no";
			}else{
				idtext.style.display="none";
				idok="yes";
			}
		}
		//아이디(가맹점)
		comid.onblur=function(){
			if(comid.value==""){//아무 값도 없을 때
				idtext.style.display="block";
				idtext.innerHTML="가입한 아이디를 입력하세요";
				idok="no";
			}else{
				idtext.style.display="none";
				idok="yes";
			}
		}
		//비밀번호
		pw.onblur=function(){
			if(pw.value==""){//아무 값도 없을 때
				pwtext.style.display="block";
				pwtext.innerHTML="비밀번호를 입력하세요";
				pwok="no";
			}else if(pw.value.length<8){//8~20자리
				pwtext.style.display="block";
				pwtext.innerHTML="비밀번호는 8자리 이상입니다";
				pwok="no";
			}else{
				pwtext.style.display="none";
				pwok="yes";
			}
		}
		//로그인
		loginBtn.onclick=function(){
			if(idok=="yes" && pwok=="yes"){
				/* var comSubmit = new ComSubmit("login_form_form");
				comSubmit.setUrl("<c:url value='/loginGo.do' />");
				comSubmit.submit(); */
				
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/loginGo.do' />");
				comSubmit.addParam("CUS_ID", $("#login_form_id").val());
				comSubmit.addParam("COM_ID", $("#login_form_comid").val());
				comSubmit.addParam("PWD", $("#login_form_pw").val());
				comSubmit.addParam("SEL", $("#login_form_typetot").val());
				comSubmit.submit();
				
			}else{
				if(idok=="no"){
					if(typetot.value=="user"){
						idtext.style.display="block";
						idtext.innerHTML="가입한 이메일 이나 연락처를 입력하세요";
					}else if(typetot.value=="com"){
						idtext.style.display="block";
						idtext.innerHTML="가입한 아이디를 입력하세요";
					}
				}if(pwok=="no"){
					pwtext.style.display="block";
					pwtext.innerHTML="휴대전화를 입력하세요";
				}
			}
		}
	}
	
	$("#login_form_joinBtn").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/join_form.do' />");
		comSubmit.submit();
	});
	
	$("#login_form_searchIdBtn").on("click", function(e){
		e.preventDefault();
		alert('미정');
	});
	
	$("#login_form_searchPwBtn").on("click", function(e){
		e.preventDefault();
		alert('미정');
	});
});
</script>
</head>
<body id="login_main_body">
	<form id="commonForm" name="commonForm"></form>
	<div id="index_head">
		<jsp:include page="../main/header_main.jsp" flush="false"/>
		<%-- <%@ include file="header_main.jsp" %> --%>
	</div>
	
	<h3 id="login_form_title">로그인</h3>
	<div class="login_form_conTot" id="login_form_conTot">
		<li id="login_form_userType">개인 회원</li>
		<li id="login_form_companyType">가맹점 회원</li>
		
		<form name="login_form_form" method="post">
			<input type="text" name="login_form_id" id="login_form_id" placeholder="이메일  or 연락처 (개인회원)">
			<input type="text" name="login_form_comid" id="login_form_comid" placeholder="아이디 (가맹점)">
				<li id="login_form_idtot_text"></li>
			<input type="password" name="login_form_pw" id="login_form_pw" placeholder="비밀번호">
				<li id="login_form_pw_text"></li>
			<input type="hidden" name="login_form_typetot" id="login_form_typetot">
		</form>	
		
		<input type="button" id="login_form_loginGoBtn" value="로그인">
		<input type="hidden" name="errorCd" id="errorCd">
		<input type="hidden" name="errorMsg" id="errorMsg">
		
		<li id="login_form_joinBtn">» 회원가입</li>
		<li id="login_form_searchIdBtn">» 연락처 / 이메일 / 아이디 기억이 안나요</li>
		<li id="login_form_searchPwBtn">» 비밀번호 기억이 안나요</li>
	</div>
	
	<div class="index_footer">
		<jsp:include page="../main/footer_main.jsp" flush="false"/>
	</div>
</body>
</html>
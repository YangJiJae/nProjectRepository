<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main/header_main.css'/>" />

<script type="text/javascript">
$(document).ready(function(){
	$("#header_main_menuBtn").on("click", function(e){
		var userid = '${ID}';
		var conH=document.getElementById("header_main_menucon");
		var totH;
		
		if(userid=="null" || userid=="" || userid==null){//로그인 안했을 때
			var loginH=document.getElementById("header_main_login").offsetHeight;
			var joinH=document.getElementById("header_main_join").offsetHeight;
			totH=10+loginH+joinH+"px";
		}else{//로그인 했을 때
			var usreInfoH=document.getElementById("header_main_userInfo").offsetHeight;
			var logoutH=document.getElementById("header_main_logout").offsetHeight;
			totH=10+logoutH+usreInfoH+"px";
		}
		//슬라이드 창 관련
		if(conH.style.height==totH){
			conH.style.height="0px";//0되면 슬라이드 닫힘
		}else{
			conH.style.height=totH;//높이주면 슬라이드열려
		}
	});
	$("#loginBtn").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login_form.do' />");
		comSubmit.submit();
	});
	$("#mainGo").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/main.do' />");
		comSubmit.submit();
	});
	
	$("#joinBtn").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/join_form.do' />");
		comSubmit.submit();
	});
	$("#logoutBtn").on("click", function(e){
		var check=confirm("정말로 로그아웃 하시겠습니까?");
		if(check){
			e.preventDefault();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/logout.do' />");
			comSubmit.submit();
		}
	});
	$("#myPageBtn").on("click", function(e){
		var a = '추후 설정';
		if(a=="user"){
			e.preventDefault();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage_form.do' />");
			comSubmit.submit();
		}else if(a=="com"){
			e.preventDefault();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adPage_form.do' />");
			comSubmit.submit();
		}
	});
});

</script>


</head>
<body>
	<div class="header_main_main">
		<li class="header_main_title" id="mainGo">NMM</li><!-- 로고넣을 예정 -->
		<div class="header_main_menuBtn" id="header_main_menuBtn" data-toggle="dropdown">
			<span class="header_main_menuIcon" class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>
		</div>
		<div class="header_main_menucon">
			<div class="header_main_menuconRight">
			
				<c:choose>
				    <c:when test="${empty ID}">
				       <li class="header_main_login" id="loginBtn">로그인</li>
						<li class="header_main_join" id="joinBtn">회원가입</li>
				    </c:when>
				    <c:otherwise>
				        <li class="header_main_userInfo" id="myPageBtn">${ID}</li>
						<li class="header_main_logout" id="logoutBtn">로그아웃</li>
				    </c:otherwise>
				</c:choose>
			
			</div>
		</div>
		
		
	</div>
	

</body>
</html>
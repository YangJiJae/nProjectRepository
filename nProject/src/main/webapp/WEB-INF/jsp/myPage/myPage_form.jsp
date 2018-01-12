<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage/myPage.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#myPage_con_left_menu1").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/myPage_form.do' />");
		comSubmit.addParam("MY_MENU", "menu1/myCuPon_form.jsp");
		comSubmit.submit();
	});
	
	$("#myPage_con_left_menu2").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/myPage_form.do' />");
		comSubmit.addParam("MY_MENU", "menu2/myEventAlert_form.jsp");
		comSubmit.submit();
	});
	
	$("#myPage_con_left_menu3").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/myPage_form.do' />");
		comSubmit.addParam("MY_MENU", "menu3/myInfo_form.jsp");
		comSubmit.submit();
	});
	
});
</script>
</head>

<body>
	<form id="commonForm" name="commonForm"></form>
	<div class="myPage_header">
		<img class="myPage_header_titleImg" src="<c:url value='/images/smallUser.png'/>"></img>
		<li class="myPage_header_title">나의 페이지 »</li>
	</div>
	<div class="myPage_con">
		<div class="myPage_con_left">
			<li class="myPage_con_left_menu1" id="myPage_con_left_menu1">나의 쿠폰</li>
			<li class="myPage_con_left_menu2" id="myPage_con_left_menu2">이벤트 알림</li>
			<li class="myPage_con_left_menu3" id="myPage_con_left_menu3">개인정보 수정</li>
		</div>
		<div class="myPage_con_right">
			<jsp:include page="${MY_MENU}" flush="false"/>
		</div>
	</div>
</body>
</html>
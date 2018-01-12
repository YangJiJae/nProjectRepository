<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/adPage/adPage.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){

	$("#adPage_con_left_menu1").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adPage_form.do' />");
		comSubmit.addParam("AD_MENU", "menu1/CouPonUse_form.jsp");
		comSubmit.submit();
	});
	
	$("#adPage_con_left_menu2").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adPage_form.do' />");
		comSubmit.addParam("AD_MENU", "menu2/EventMake_form.jsp");
		comSubmit.submit();
	});
	
	$("#adPage_con_left_menu3").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adPage_form.do' />");
		comSubmit.addParam("AD_MENU", "menu3/adInfo_form.jsp");
		comSubmit.submit();
	});
});
</script>
</head>
<body>
	<form id="commonForm" name="commonForm"></form>
	<div class="adPage_header">
		<img class="adPage_header_titleImg" src="<c:url value='/images/smallShop.png'/>"></img>
		<li class="adPage_header_title">개맹점 관리 페이지 »</li>
	</div>
	<div class="adPage_con">
		<div class="adPage_con_left">
			<li class="adPage_con_left_menu1" id="adPage_con_left_menu1">쿠폰 통합관리</li>
			<li class="adPage_con_left_menu2" id="adPage_con_left_menu2">홍보하기</li>
			<li class="adPage_con_left_menu3" id="adPage_con_left_menu3">가맹점정보 수정</li>
		</div>
		<div class="adPage_con_right">
			<jsp:include page="${AD_MENU}" flush="false"/>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/adPage/CouPonUse.css'/>" />

<script type="text/javascript">
$(document).ready(function(){
	
	$("#couponView").on("click", function(e){
		e.preventDefault();
		window.open("CouponShow_form.jsp","_blank","width=500, height=500");
	});
	
	$("#optionYesNoBtn").on("click", function(e){
		e.preventDefault();
		alert("시작");
	});
	
	$("#giftCoupon").on("click", function(e){
		e.preventDefault();
		alert("쿠폰주기");
	});
	
	$("#useCoupon").on("click", function(e){
		e.preventDefault();
		alert("사용하기");
	});
});
</script>
</head>
<body>
	<div class="CouPonUse_form_main">
		<li class="CouPonUse_form_mainTitle">쿠폰 통합관리</li>
		
		<div class="CouPonUse_form_optionYesNoTot">
			<li class="CouPonUse_form_optionYesNo">
				<div class="CouPonUse_form_textImg"></div>설정
			</li>
			<input type="button" class="CouPonUse_form_optionYesNoBtn" id="optionYesNoBtn" value="시작">
		</div>
		<div class="CouPonUse_form_optionYesNo_line"></div>
		
		<div class="CouPonUse_form_optionYesNoTot">
			<li class="CouPonUse_form_optionYesNo">
				<div class="CouPonUse_form_textImg"></div>접속주소
			</li>
			<li class="CouPonUse_form_linktext" id="couponView">쿠폰보기</li>
		</div>
		<div class="CouPonUse_form_optionYesNo_line"></div>
				
		<li class="CouPonUse_form_joinInfo">
			<div class="CouPonUse_form_textImg"></div>회원정보
		</li>
		<div class="CouPonUse_form_titleTot">
			<li class="CouPonUse_form_title_con1">이름</li>
			<li class="CouPonUse_form_title_con2">연락처</li>
			<li class="CouPonUse_form_title_con3">접촉시간</li>
			<li class="CouPonUse_form_title_con4">쿠폰</li>
		</div>
		<div class="CouPonUse_form_conTot">
			<li class="CouPonUse_form_con_con1">내용1</li>
			<li class="CouPonUse_form_con_con2">내용2</li>
			<li class="CouPonUse_form_con_con3">내용3</li>
			<li class="CouPonUse_form_con_con4" id="giftCoupon">쿠폰주기 »</li>
		</div>
		
		<li class="CouPonUse_form_couPonInfo">
			<div class="CouPonUse_form_textImg"></div>사용가능 쿠폰
		</li>
		<div class="CouPonUse_form_titleTot">
			<li class="CouPonUse_form_title_con1">쿠폰이름</li>
			<li class="CouPonUse_form_title_con2">사용기간</li>
			<li class="CouPonUse_form_title_con3">금액</li>
			<li class="CouPonUse_form_title_con4">쿠폰</li>
		</div>
		<div class="CouPonUse_form_conTot">
			<li class="CouPonUse_form_con_con1">쿠폰이름</li>
			<li class="CouPonUse_form_con_con2">기간</li>
			<li class="CouPonUse_form_con_con3">금액</li>
			<li class="CouPonUse_form_con_con4" id="useCoupon">사용하기 »</li>
		</div>
	</div>
</body>
</html>
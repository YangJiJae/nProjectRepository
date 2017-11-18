<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //get 한글깨짐 방지
request.setCharacterEncoding("UTF-8");
String adMenu = request.getParameter("adMenu");

if(adMenu==null || adMenu.equals("")){
	adMenu="menu1/CuPonUse_form.jsp";
}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/adPage/adPage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="adPage_header">
		<image id="adPage_header_titleImg" src="../lib/img/smallShop.png"></image>
		<li id="adPage_header_title">개맹점 관리 페이지 »</li>
	</div>
	<div id="adPage_con">
		<div id="adPage_con_left">
			<li id="adPage_con_left_menu1" onclick="menuBtnGo('menu1/CuPonUse_form.jsp')">쿠폰 통합관리</li>
			<li id="adPage_con_left_menu2" onclick="menuBtnGo('menu2/EventMake_form.jsp')">홍보하기</li>
			<li id="adPage_con_left_menu3" onclick="menuBtnGo('menu3/adInfo_form.jsp')">가맹점정보 수정</li>
		</div>
		<div id="adPage_con_right">
			<jsp:include page="<%=adMenu%>" flush="false"/>
		</div>
	</div>
<script src="../js/adPage/adPage.js"></script>
</body>
</html>
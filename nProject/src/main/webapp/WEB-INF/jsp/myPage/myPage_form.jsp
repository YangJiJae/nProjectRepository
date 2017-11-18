<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //get 한글깨짐 방지
request.setCharacterEncoding("UTF-8");
String myMenu = request.getParameter("myMenu");

if(myMenu==null || myMenu.equals("")){
	myMenu="menu1/myCuPon_form.jsp";
}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/myPage/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="myPage_header">
		<image id="myPage_header_titleImg" src="../lib/img/smallUser.png"></image>
		<li id="myPage_header_title">나의 페이지 »</li>
	</div>
	<div id="myPage_con">
		<div id="myPage_con_left">
			<li id="myPage_con_left_menu1" onclick="menuBtnGo('menu1/myCuPon_form.jsp')">나의 쿠폰</li>
			<li id="myPage_con_left_menu2" onclick="menuBtnGo('menu2/myEventAlert_form.jsp')">이벤트 알림</li>
			<li id="myPage_con_left_menu3" onclick="menuBtnGo('menu3/myInfo_form.jsp')">개인정보 수정</li>
		</div>
		<div id="myPage_con_right">
			<jsp:include page="<%=myMenu%>" flush="false"/>
		</div>
	</div>
<script src="../js/myPage/myPage.js"></script>
</body>
</html>
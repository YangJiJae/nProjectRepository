<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userid=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/js/main/content_main.js'/>" ></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main/content_main.css'/>" />

</head>

<body id="content_main_body">
	<!--image안에 버튼,글 넣기위해  min-height=1px 줘야 상단공백 없어짐 -->
	<div id="content_main_mainImgtot">
		<div id="content_main_mainImgCon">
			<div id="content_main_mainImgText">
				어플 없이 터치 한번으로 <br>쿠폰을 저장
			</div>
			<li id="content_main_mainImgBtn" onclick="startPageGo('<%=userid%>')">시작하기</li>
		</div>
		<image id="content_main_mainImg" src="/resources/images/app.png"></image>
		<image id="content_main_mainImg2" src="<c:url value='/resources/images/app.png' />" ></image>
		<image id="content_main_mainImg2" src="<c:url value='/images/app.png' />" ></image>
		<image id="content_main_mainImg2" src="<c:url value='/resources/app.png' />" ></image>
		
	</div>
	<div id="content_main_contot">
		<div id="content_main_contot_con1">
			<image id="content_main_con1Img" src="../lib/img/app.png"></image>
			<li id="content_main_con1Title">어플 설치시 좋은점</li>
			<li id="content_main_con1Text">자주가는 매장의 할인혜택 및 정보를 실시간으로 얻을수 있습니다.</li>
			<hr id="content_main_con1hr">
			<li id="content_main_con1btn">» 어플 설치</li>
		</div>
		<div id="content_main_contot_con1">
			<image id="content_main_con1Img" src="../lib/img/user.png"></image>
			<li id="content_main_con1Title">쿠폰을 관리하자 </li>
			<li id="content_main_con1Text">회원가입을 하면 누적된 쿠폰을 확인가능 합니다.</li>
			<hr id="content_main_con1hr">
			<li id="content_main_con1btn" onclick="conPageGo('../join/join_form.jsp')">» 회원 가입</li>
		</div>
		<div id="content_main_contot_con1">
			<image id="content_main_con1Img" src="../lib/img/shop.png"></image>
			<li id="content_main_con1Title">고객 홍보를 통한 매출 증가</li>
			<li id="content_main_con1Text">가맹점 가입으로 쿠폰을 만들고 고객을 확보하는 기능을 합니다.</li>
			<hr id="content_main_con1hr">
			<li id="content_main_con1btn" onclick="conPageGo('../join/comjoin_form.jsp')">» 가맹점 가입</li>
		</div>
	</div>
</body>
</html>
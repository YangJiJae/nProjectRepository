<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userid=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" ></script>
<script src="<c:url value='/js/main/header_main.js'/>" ></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main/header_main.css'/>" />
</head>
<body>
	<div id="header_main_main">
		<li id="header_main_title" onclick="mainPageGo()">NMM</li><!-- 로고넣을 예정 -->
		<div id="header_main_menuBtn" data-toggle="dropdown" onclick="conshow('<%=userid%>')">
			<span id="header_main_menuIcon" class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>
		</div>
		<div id="header_main_menucon">
			<div id="header_main_menuconRight">
			<% 
			if(userid==null){
				userid="";
			%>
				<li id="header_main_login" onclick="pagego('../login/login_form.jsp');">로그인</li>
				<li id="header_main_join" onclick="pagego('../join/join_form.jsp');">회원가입</li>
			<%}else if(userid!=null){
			/* NmmDAO dao=new NmmDAOimple();
			NmmVO vo=new NmmVO();
			String [] sp=userid.split("/");
			vo.setCompany_id(sp[0]);//유저든 가맹점이든 아이디 값을 넣는다
			vo.setUcType(sp[1]);
			String result1=dao.nicName(vo);
			String nic=result1; */
			String [] sp="id/idd".split("/");
			String nic="nic";
			%>
				<li id="header_main_userInfo" onclick="myadPageGo('<%=sp[1]%>');"><%=nic%></li>
				<li id="header_main_logout" onclick="logoutGo('../login/logout.jsp');">로그아웃</li>
			<%}%>
			</div>
		</div>
		
		
	</div>
	


</body>
</html>
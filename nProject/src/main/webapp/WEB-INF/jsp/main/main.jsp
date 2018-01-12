<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>NMM</title>
<meta charset="utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/main/index.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main/content_main.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" ></script> 

<script type="text/javascript">
$(document).ready(function(){
	
	var sel = '${SEL}';
	var id = '${ID}';
	$("#start").on("click", function(e){
		e.preventDefault();
		if(id == ""){//로그인 안했을 때
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login_form.do' />");
			comSubmit.submit();
		}else{
			if(sel == "user"){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/myPage_form.do' />");
				comSubmit.submit();
			}else if(sel == "com"){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/adPage_form.do' />");
				comSubmit.submit();
			}
		}
	});
	$("#userJoin").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/join_form.do' />");
		comSubmit.submit();
	});
	$("#comJoin").on("click", function(e){
		e.preventDefault();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/comjoin_form.do' />");
		comSubmit.submit();
	});
});

</script>
</head>
<body>
	<form id="commonForm" name="commonForm"></form>
	<div id="index_head">
		<jsp:include page="header_main.jsp" flush="false"/>
		<%-- <%@ include file="header_main.jsp" %> --%>
	</div>
	
	
	<div class="content_main_body">
		<!--image안에 버튼,글 넣기위해  min-height=1px 줘야 상단공백 없어짐 -->
		<div class="content_main_mainImgtot">
			<div class="content_main_mainImgCon">
				<div class="content_main_mainImgText">
					어플 없이 터치 한번으로 <br>쿠폰을 저장
				</div>
				<li class="content_main_mainImgBtn" id="start">시작하기</li>
			</div>
			<img class="content_main_con1Img" src="<c:url value='/images/mainImg.jpg'/>"></img>
		</div>
		<div class="content_main_contot">
			<div class="content_main_contot_con1">
				<img class="content_main_con1Img" src="<c:url value='/images/app.png'/>"></img>
				<li class="content_main_con1Title">어플 설치시 좋은점</li>
				<li class="content_main_con1Text">자주가는 매장의 할인혜택 및 정보를 실시간으로 얻을수 있습니다.</li>
				<hr class="content_main_con1hr">
				<li class="content_main_con1btn">» 어플 설치</li>
			</div>
			<div class="content_main_contot_con1">
				<img class="content_main_con1Img" src="<c:url value='/images/user.png'/>"></img>
				<li class="content_main_con1Title">쿠폰을 관리하자 </li>
				<li class="content_main_con1Text">회원가입을 하면 누적된 쿠폰을 확인가능 합니다.</li>
				<hr class="content_main_con1hr">
				<li class="content_main_con1btn" id="userJoin">» 회원 가입</li>
			</div>
			<div class="content_main_contot_con1">
				<img class="content_main_con1Img" src="<c:url value='/images/shop.png'/>"></img>
				<li class="content_main_con1Title">고객 홍보를 통한 매출 증가</li>
				<li class="content_main_con1Text">가맹점 가입으로 쿠폰을 만들고 고객을 확보하는 기능을 합니다.</li>
				<hr class="content_main_con1hr">
				<li class="content_main_con1btn" id="comJoin">» 가맹점 가입</li>
			</div>
		</div>

	</div>


	<div class="index_footer">
		<jsp:include page="footer_main.jsp" flush="false"/>
	</div>
</body>
</html>
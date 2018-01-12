<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/join/join_form.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	/**
	 * 
	 */
	//휴대전화 or 이메일로 가입하기
	var joinTypeTel="yes";//최초접속시 휴대전화로 가입하기로 되있기에 yes
	var joinTypeEm="no";

	var agreetot="no";//통합 체크박스 클릭시 yes로 변경
	var agree1="no";//이용약관동의 클릭시 yes로 변경
	var agree2="no";//개인정보동의 클릭시 yes로 변경

	//(개인)회원가입 폼 정상적으로 입력됬을시 yes로 변경
	var telok="no";
	var emok="no";
	var nameok="no";
	var pwok="no";
	var pwcok="no";

	typeClick();//가맹점 신청 페이지 이동
	EventTot1();//모든 이벤트 통합(가입방법,폼입력체크,이용약관 체크박스,회원가입버튼클릭시)(개인)

	function typeClick(){//가맹점 신청 페이지 이동
		var type2=document.getElementById("join_form_type2");//가맹점
		
		type2.onclick=function(){//사업버튼 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/comjoin_form.do' />");
			comSubmit.submit();
		}
	}
	//모든 이벤트 통합(폼입력체크, 이용약관 체크박스, 회원가입버튼클릭시)(개인)
	function EventTot1(){
		var telType=document.getElementById("join_form_telType");//연락처로 가입 버튼
		var emType=document.getElementById("join_form_emType");//이메일로 가입 버튼
		
		var checktot=document.getElementById("join_form_agreeAllCheck");//통합 체크박스(개인)
		var check1=document.getElementById("join_form_agreeCheck1");//이용약관(게인)
		var check2=document.getElementById("join_form_agreeCheck2");//개인정보 수집(개인)
		
		var tel1=document.getElementById("join_form_tel");//휴대전화(개인)
		var tel1text=document.getElementById("join_form_tel_text");//휴대전화(개인)
		var em1=document.getElementById("join_form_email");//이메일(개인)
		var em1text=document.getElementById("join_form_email_text");//이메일(개인)
		var name1=document.getElementById("join_form_name");//이름(개인)
		var name1text=document.getElementById("join_form_name_text");//이름(개인)
		var pw1=document.getElementById("join_form_pw");//비번(개인)
		var pw1text=document.getElementById("join_form_pw_text");//비번(개인)
		var pwc1=document.getElementById("join_form_pwc");//비번확인(개인)
		var pwc1text=document.getElementById("join_form_pwc_text");//비번확인(개인)
		
		var joinBtn=document.getElementById("join_form_joinGoBtn");//회원가입가기(개인)
		
		//휴대전화로 가입버튼 클릭시
		telType.onclick=function(){
			telType.style.borderTop="1px solid #A6A6A6";
			telType.style.borderLeft="1px solid #A6A6A6";
			telType.style.borderRight="1px solid #A6A6A6";
			telType.style.borderBottom="0px";
			telType.style.color="#368D9C";
			
			emType.style.borderTop="0px";
			emType.style.borderLeft="0px";
			emType.style.borderRight="0px";
			emType.style.borderBottom="1px solid #A6A6A6";
			emType.style.color="#A6A6A6";
			
			joinTypeTel="yes";
			joinTypeEm="no";
			
			tel1.style.display="inline-block";
			em1.style.display="none";
			em1text.style.display="none";
			em1.value="";
			emok="no";
		}
		//이메일로 가입버튼 클릭시
		emType.onclick=function(){
			emType.style.borderTop="1px solid #A6A6A6";
			emType.style.borderLeft="1px solid #A6A6A6";
			emType.style.borderRight="1px solid #A6A6A6";
			emType.style.borderBottom="0px";
			emType.style.color="#368D9C";
			
			telType.style.borderTop="0px";
			telType.style.borderLeft="0px";
			telType.style.borderRight="0px";
			telType.style.borderBottom="1px solid #A6A6A6";
			telType.style.color="#A6A6A6";
			
			joinTypeTel="no";
			joinTypeEm="yes";
			
			em1.style.display="inline-block";
			tel1.style.display="none";
			tel1text.style.display="none";
			tel1.value="";
			telok="no";
		}
		//이용약관 통합부분 
		checktot.onclick=function(){
			if(agreetot=="no"){
				checktot.style.backgroundColor="#368D9C";
				check1.style.backgroundColor="#368D9C";
				check2.style.backgroundColor="#368D9C";
				checktot.style.borderColor="#D5D5D5";
				check1.style.borderColor="#D5D5D5";
				check2.style.borderColor="#D5D5D5";
				agreetot="yes";
				agree1="yes";
				agree2="yes";
			}else if(agreetot=="yes"){
				checktot.style.backgroundColor="#fff";
				check1.style.backgroundColor="#fff";
				check2.style.backgroundColor="#fff";
				agreetot="no";
				agree1="no";
				agree2="no";
			}
		}
		//이용약관
		check1.onclick=function(){
			if(agree1=="no"){
				check1.style.backgroundColor="#368D9C";
				check1.style.borderColor="#D5D5D5";
				agree1="yes";
				if(agree2=="yes"){//약관중 다른하나가 클릭된 상태라면 통합체크박스도 자동으로 체크
					checktot.style.backgroundColor="#368D9C";
					checktot.style.borderColor="#D5D5D5";
					agreetot="yes";
				}
			}else if(agree1=="yes"){
				check1.style.backgroundColor="#fff";
				agree1="no";
				if(agreetot=="yes"){//통합체크박스가 체크되있는 상태에서 약관중 하나를 해제하면 통합체크박스 헤제
					checktot.style.backgroundColor="#fff";
					agreetot="no";
				}
			}
		}
		//개인정보동의
		check2.onclick=function(){
			if(agree2=="no"){
				check2.style.backgroundColor="#368D9C";
				check2.style.borderColor="#D5D5D5";
				agree2="yes";
				if(agree1=="yes"){//약관중 다른하나가 클릭된 상태라면 통합체크박스도 자동으로 체크
					checktot.style.backgroundColor="#368D9C";
					checktot.style.borderColor="#D5D5D5";
					agreetot="yes";
				}
			}else if(agree2=="yes"){
				check2.style.backgroundColor="#fff";
				agree2="no";
				if(agreetot=="yes"){//통합체크박스가 체크되있는 상태에서 약관중 하나를 해제하면 통합체크박스 헤제
					checktot.style.backgroundColor="#fff";
					agreetot="no";
				}
			}
		}
		//휴대전화(개인)
		tel1.onblur=function(){
			if(tel1.value==""){//아무 값도 없을 때
				tel1text.style.display="block";
				tel1text.innerHTML="휴대전화를 입력하세요";
				telok="no";
			}else if(tel1.value.match(/^\d{9,10}/)){
				tel1text.style.display="none";
				phoneCheck();//휴대전화 중복검사
			}else{
				tel1text.style.display="block";
				tel1text.innerHTML="숫자만 입력하고 정상적인 휴대전화를 입력하세요";
				telok="no";
			}
		}
		//이메일(개인)
		em1.onblur=function(){
			if(em1.value==""){//아무 값도 없을 때
				em1text.style.display="block";
				em1text.innerHTML="이메일을 입력하세요";
				emok="no";
			}else if(em1.value.match(/^\w+[@]\w+[.][a-zA-Z]{2,10}$/)){
				em1text.style.display="none";
				emCheck();//이메일 중복검사
			}else{
				em1text.style.display="block";
				em1text.innerHTML="이메일 형식에 맞춰주세요";
				emok="no";
			}
		}
		//성명(개인)
		name1.onblur=function(){
			if(name1.value==""){//아무 값도 없을 때
				name1text.style.display="block";
				name1text.innerHTML="실명을 입력하세요";
				nameok="no";
			}else if(name1.value.match(/[^가-힣A-Za-z]/)){
				name1text.style.display="block";
				name1text.innerHTML="이름에 사용불가능한 형식입니다.";
				nameok="no";
			}else if(name1.value.length>20 || name1.value.length<2){//2~20자리(영문명 포함위해)
				name1text.style.display="block";
				name1text.innerHTML="이름은 2~20자리까지 가능합니다";
				nameok="no";
			}else{
				name1text.style.display="none";
				nameok="yes";
			}
		}
		//비밀번호(개인)
		pw1.onblur=function(){
			if(pw1.value==""){//아무 값도 없을 때
				pw1text.style.display="block";
				pw1text.innerHTML="비밀번호를 입력하세요";
				pwok="no";
			}else if(pw1.value.length>20 || pw1.value.length<8){//8~20자리
				pw1text.style.display="block";
				pw1text.innerHTML="비밀번호는 8~20자리까지 가능합니다";
				pwok="no";
			}else{
				pw1text.style.display="none";
				pwok="yes";
			}
			pwc1.value="";//비밀번호 값을 건드리기만 해도 비번확인값을 초기화 해서 다시입력하게해
			pwcok="no";
		}
		//비밀번호 확인(개인)
		pwc1.onblur=function(){
			if(pwc1.value==""){//아무 값도 없을 때
				pwc1text.style.display="block";
				pwc1text.innerHTML="위에 작성한 비밀번호 값을 한번더 입력하세요";
				pwcok="no";
			}else if(pwc1.value!=pw1.value){
				pwc1text.style.display="block";
				pwc1text.innerHTML="위 비밀번호와 일치하지 않습니다";
				pwcok="no";
			}else if(pwc1.value==pw1.value){
				pwc1text.style.display="none";
				pwcok="yes";
			}
		}
		
		//회원가입버튼
		joinBtn.onclick=function(){
			if(((joinTypeTel=="yes" && telok=="yes") || (joinTypeEm=="yes" && emok=="yes"))
			&& nameok=="yes" && pwok=="yes" && pwcok=="yes" && agreetot=="yes"){
				
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/joinGo.do' />");
				comSubmit.addParam("PHONE_NUM", $("#join_form_tel").val());
				comSubmit.addParam("EMAIL", $("#join_form_email").val());
				comSubmit.addParam("NAME", $("#join_form_name").val());
				comSubmit.addParam("PWD", $("#join_form_pw").val());
				comSubmit.submit();
				
			}else{
				if(agreetot=="no"){
					checktot.style.borderColor="#ff0000";
					check1.style.borderColor="#ff0000";
					check2.style.borderColor="#ff0000";
				}if(joinTypeTel=="yes" && telok=="no"){
					tel1text.style.display="block";
					tel1text.innerHTML="휴대전화를 입력하세요";
				}if(joinTypeEm=="yes" && emok=="no"){
					em1text.style.display="block";
					em1text.innerHTML="이메일을 입력하세요";
				}if(nameok=="no"){
					name1text.style.display="block";
					name1text.innerHTML="이름을 입력하세요";
				}if(pwok=="no"){
					pw1text.style.display="block";
					pw1text.innerHTML="비밀번호를 입력하세요";
				}if(pwcok=="no"){
					pwc1text.style.display="block";
					pwc1text.innerHTML="위에 작성한 비밀번호를 입력하세요";
				}
			}
		}
	}
	//오늘 날짜 시간 가져오기
	function timer() {
	  var d = new Date();

	  var s =
		ZeroAdd(d.getFullYear(), 4) + '-' +
	    ZeroAdd(d.getMonth() + 1, 2) + '-' +
	    ZeroAdd(d.getDate(), 2) + ' ' +

	    ZeroAdd(d.getHours(), 2) + ':' +
	    ZeroAdd(d.getMinutes(), 2) + ':' +
	    ZeroAdd(d.getSeconds(), 2);

	  return s;
	}

	//1자리 나올때 앞에 0붙여서 두자리로 만들어주기
	function ZeroAdd(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	
	//이메일 중복 검사
	function emCheck(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/joinEmailCheck.do' />");
		comAjax.setCallback("fn_emCheckCallback");
		comAjax.addParam("ID", $("#join_form_email").val());
		comAjax.addParam("SEL", "member");
		
		comAjax.ajax();
	}
	function fn_emCheckCallback(data){
		var response=data.RESPONSE;
		if(response=="yes"){
			$("#join_form_email_text").css({'display':'none'});
			emok="yes";
		}else if(response=="no"){
			$("#join_form_email_text").css({'display':'block'});
			$("#join_form_email_text").html("이미 가입된 이메일입니다. 본인이 가입한 것이 아니라면 아래 고객센터에 문의하세요");
			emok="no";
		}
	}
	
	//연락처 중복 검사
	function phoneCheck(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/joinPhoneCheck.do' />");
		comAjax.setCallback(fn_phoneCheckCallback);
		comAjax.addParam("ID", $("#join_form_tel").val());
		comAjax.addParam("SEL", "member");
		comAjax.ajax();
	}
	
	function fn_phoneCheckCallback(data){
		var response=data.RESPONSE;
		if(response=="yes"){
			$("#join_form_tel_text").css({'display':'none'});
			telok="yes";
		}else if(response=="no"){
			$("#join_form_tel_text").css({'display':'block'});
			$("#join_form_tel_text").html("이미 가입된 휴대전화 입니다. 본인이 가입한 것이 아니라면 아래 고객센터에 문의하세요");
			telok="no";
		}
		
	}
	
	

});
</script>
</head>
<body id="join_main_body">
	<form id="commonForm" name="commonForm"></form>
	<div id="index_head">
		<jsp:include page="../main/header_main.jsp" flush="false"/>
		<%-- <%@ include file="header_main.jsp" %> --%>
	</div>
	
	<h3 id="join_form_title">회원가입(개인)</h3>
	<div id="join_form_typeTot">
		<li id="join_form_type1">개인</li>
		<li id="join_form_type2">가맹점 신청 »</li>
	</div>
	<div class="join_form_conTot" id="join_form_conTot1">
		<li id="join_form_telType">연락처로 가입</li>
		<li id="join_form_emType">이메일로 가입</li>
		<form name="join_form_form" method="post">
			<input type="tel" name="join_form_tel" id="join_form_tel" placeholder="연락처">
				<li id="join_form_tel_text"></li>
			<input type="email" name="join_form_email" id="join_form_email" placeholder="이메일">
				<li id="join_form_email_text"></li>
			<input type="text" name="join_form_name" id="join_form_name" placeholder="성명">
				<li id="join_form_name_text"></li>
			<input type="password" name="join_form_pw" id="join_form_pw" placeholder="비밀번호">
				<li id="join_form_pw_text"></li>
			<input type="password" id="join_form_pwc" placeholder="비밀번호 확인">
				<li id="join_form_pwc_text"></li>
		</form>
		
		<div id="join_form_agreeAllCheck_Tot">
			<div id="join_form_agreeAllCheck">
				<span id="join_form_checkImg1" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="join_form_agreeAllCheckText">아래 내용에 모두 동의</div>
		</div>
		<br>
		<div id="join_form_agreeCheck_Tot">
			<div id="join_form_agreeCheck1">
				<span id="join_form_checkImg2" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="join_form_agreeCheckText1">
				<a href="#" onclick="window.open('agree1.jsp', 'pop1', 'width=500, height=500'); return false;">이용약관 동의</a>
			</div>
			<br>
			<br>
			<div id="join_form_agreeCheck2">
				<span id="join_form_checkImg2" class="glyphicon glyphicon-ok"></span>
			</div>
			<div id="join_form_agreeCheckText2">
				<a href="#" onclick="window.open('agree2.jsp', 'pop2', 'width=500, height=500'); return false;">개인정보 수집/이용 동의</a>
			</div>
		</div>
		<br>
		<input type="button" id="join_form_joinGoBtn" value="회원가입">
	</div>
	
	<div class="index_footer">
		<jsp:include page="../main/footer_main.jsp" flush="false"/>
	</div>
</body>
</html>
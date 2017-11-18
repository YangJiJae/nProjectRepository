/**
 * 
 */

function conshow(userid){//슬라이드(로그인/아웃구분)
	var conH=document.getElementById("header_main_menucon");
	var totH;
	
	if(userid=="null"){//로그인 안했을 때
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
}
//페이지 이동
function pagego(a){
	location.href="index.jsp?rm="+a;
}
//메인페이지 이동
function mainPageGo(){
	location.href="index.jsp";
}
//로그아웃
function logoutGo(a){
	var check=confirm("정말로 로그아웃 하시겠습니까?");
	if(check){
		location.href=a;
	}
}
//관리 or 나의 페이지 이동
function myadPageGo(a){
	if(a=="user"){
		location.href="index.jsp?rm=../myPage/myPage_form.jsp";
	}else if(a=="com"){
		location.href="index.jsp?rm=../adPage/adPage_form.jsp";
	}
}
//페이지 이동
function conPageGo(a){
	location.href="index.jsp?rm="+a;
}
function startPageGo(a){
	if(a=="null"){//로그인 안했을 때
		location.href="index.jsp?rm=../login/login_form.jsp";
	}else if(a!="null"){
		var sp=a.split("/");
		if(sp[1]=="user"){
			location.href="index.jsp?rm=../myPage/myPage_form.jsp";
		}else if(sp[1]=="com"){
			location.href="index.jsp?rm=../adPage/adPage_form.jsp";
		}
	}
}
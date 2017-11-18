/**
 * 
 */
touchLinkChek();//접속주소 클릭시 이벤트

//접속주소 클릭시 이벤트
function touchLinkChek(){
	var link=document.getElementById("CuPonUse_form_linktext");
	
	link.onclick=function(){
		//location.href=link.innerHTML;
		window.open(link.innerHTML,"_blank");
	}
}
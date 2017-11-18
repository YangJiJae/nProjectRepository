/**
 * 
 */
var agreetot="no";//통합 체크박스 클릭시 yes로 변경
var agree1="no";//이용약관동의 클릭시 yes로 변경
var agree2="no";//개인정보동의 클릭시 yes로 변경

//(가맹점)회원가입 폼 정상적으로 입력됬을시 yes로 변경
var telok="no";
var emok="no";
var pwok="no";
var pwcok="no";
var nameok="no";
var offnameok="no";
var offaddressok="no";
var officeTelok="no";
var idok="no";

EventTot2();//모든 이벤트 통합(가입방법,폼입력체크,이용약관 체크박스,회원가입버튼클릭시)(개인)

//모든 이벤트 통합(폼입력체크, 이용약관 체크박스, 회원가입버튼클릭시)(개인)
function EventTot2(){
	var checktot=document.getElementById("comjoin_form_agreeAllCheck");//통합 체크박스(가맹점)
	var check1=document.getElementById("comjoin_form_agreeCheck1");//이용약관(가맹점)
	var check2=document.getElementById("comjoin_form_agreeCheck2");//개인정보 수집(가맹점)
	
	var tel1=document.getElementById("comjoin_form_comTel");//휴대전화(가맹점)
	var tel1text=document.getElementById("comjoin_form_comTel_text");//휴대전화(가맹점)
	var em1=document.getElementById("comjoin_form_comEmail");//이메일(가맹점)
	var em1text=document.getElementById("comjoin_form_comEmail_text");//이메일(가맹점)
	var pw1=document.getElementById("comjoin_form_comPw");//비번(가맹점)
	var pw1text=document.getElementById("comjoin_form_comPw_text");//비번(가맹점)
	var pwc1=document.getElementById("comjoin_form_comPwc");//비번확인(가맹점)
	var pwc1text=document.getElementById("comjoin_form_comPwc_text");//비번확인(가맹점)
	var name1=document.getElementById("comjoin_form_comCaptainName");//대표자(가맹점)
	var name1text=document.getElementById("comjoin_form_comCaptainName_text");//대표자(가맹점)
	var name2=document.getElementById("comjoin_form_comOfficName");//회사명(가맹점)
	var name2text=document.getElementById("comjoin_form_comOfficName_text");//회사명(가맹점)
	var address=document.getElementById("comjoin_form_comOfficAddress");//회사주소(가맹점)
	var addresstext=document.getElementById("comjoin_form_comOfficAddress_text");//회사주소(가맹점)
	var officeTel1=document.getElementById("comjoin_form_comOfficTel");//회사연락처(가맹점)
	var officeTel1text=document.getElementById("comjoin_form_comOfficTel_text");//회사연락처(가맹점)
	var id1=document.getElementById("comjoin_form_comId");//아이디(가맹점)
	var id1text=document.getElementById("comjoin_form_comId_text");//아이디(가맹점)
	var datetime=document.getElementById("comjoin_form_date");//가입날짜(개인)
	
	var joinBtn=document.getElementById("comjoin_form_joinGoBtn");//회원가입가기(가맹점)
	
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
	//휴대전화(가맹점)
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
			tel1text.innerHTML="숫자만 입력하고 정상적인 연락처를 입력하세요";
			telok="no";
		}
	}
	//이메일(가맹점)
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
	//성명(가맹점)
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
	//회사명(가맹점)
	name2.onblur=function(){
		if(name2.value==""){//아무 값도 없을 때
			name2text.style.display="block";
			name2text.innerHTML="회사명을 입력하세요";
			offnameok="no";
		}else if(name2.value.length>20 || name2.value.length<2){//2~20자리(영문명 포함위해)
			name2text.style.display="block";
			name2text.innerHTML="회사명은 2~20자리까지 가능합니다";
			offnameok="no";
		}else{
			name2text.style.display="none";
			offnameok="yes";
		}
	}
	//회사주소(가맹점)
	address.onblur=function(){
		if(address.value==""){//아무 값도 없을 때
			addresstext.style.display="block";
			addresstext.innerHTML="주소를 입력하세요";
			offaddressok="no";
		}else if(address.value.length>40 || address.value.length<6){//5~40자리(영문명 포함위해)
			addresstext.style.display="block";
			addresstext.innerHTML="회사주소는 6~40자리까지 가능합니다";
			offaddressok="no";
		}else{
			addresstext.style.display="none";
			offaddressok="yes";
		}
	}
	//회사연락처(가맹점)
	officeTel1.onblur=function(){
		if(officeTel1.value==""){//아무 값도 없을 때
			officeTel1text.style.display="block";
			officeTel1text.innerHTML="회사연락처를 입력하세요";
			officeTelok="no";
		}else if(officeTel1.value.match(/^\d{9,10}/)){
			officeTel1text.style.display="none";
			officeTelok="yes";
		}else{
			officeTel1text.style.display="block";
			officeTel1text.innerHTML="숫자만 입력하고 정상적인 연락처를 입력하세요";
			officeTelok="no";
		}
	}
	//아이디(가맹점)
	id1.onblur=function(){
		if(id1.value==""){//아무 값도 없을 때
			id1text.style.display="block";
			id1text.innerHTML="아이디를 입력하세요";
			idok="no";
		}else if(id1.value.match(/[^A-Za-z0-9]/)){
			id1text.style.display="block";
			id1text.innerHTML="아이디에 사용불가능한 형식입니다.";
			idok="no";
		}else if(id1.value.length>20 || id1.value.length<5){//2~20자리(영문명 포함위해)
			id1text.style.display="block";
			id1text.innerHTML="아이디는 5~20자리까지 가능합니다";
			idok="no";
		}else{
			id1text.style.display="none";
			idok="yes";
		}
	}
	//비밀번호(가맹점)
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
	//비밀번호 확인(가맹점)
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
		if(telok=="yes" && emok=="yes" && nameok=="yes" && offnameok=="yes"
		&& offaddressok=="yes" && pwok=="yes" && pwcok=="yes"
		&& agreetot=="yes" && idok=="yes" && officeTelok=="yes"){
			datetime.value=timer();//현재시간 넣어주기
			document.comjoin_form_form.action="../join/comjoinGo.jsp";
			document.comjoin_form_form.submit();
		}else{
			if(agreetot=="no"){
				checktot.style.borderColor="#ff0000";
				check1.style.borderColor="#ff0000";
				check2.style.borderColor="#ff0000";
			}if(idok=="no"){
				id1text.style.display="block";
				id1text.innerHTML="아이디를 입력하세요";
			}if(officeTelok=="no"){
				officeTel1text.style.display="block";
				officeTel1text.innerHTML="회사연락처를 입력하세요";
			}if(telok=="no"){
				tel1text.style.display="block";
				tel1text.innerHTML="휴대전화를 입력하세요";
			}if(emok=="no"){
				em1text.style.display="block";
				em1text.innerHTML="이메일을 입력하세요";
			}if(nameok=="no"){
				name1text.style.display="block";
				name1text.innerHTML="대표자명을 입력하세요";
			}if(offnameok=="no"){
				name2text.style.display="block";
				name2text.innerHTML="회사명을 입력하세요";
			}if(offaddressok=="no"){
				addresstext.style.display="block";
				addresstext.innerHTML="주소를 입력하세요";
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
	$.ajax({
		type:"POST",
		url:"../join/joinEmailCheck.jsp",
		data:{em:$("#comjoin_form_comEmail").val()
			,sel:"com"},
		success:function(data){
			var response=data.trim();
			if(response=="yes"){
				$("#comjoin_form_comEmail_text").css({'display':'none'});
				emok="yes";
			}else if(response=="no"){
				$("#comjoin_form_comEmail_text").css({'display':'block'});
				$("#comjoin_form_comEmail_text").html("이미 가입된 이메일입니다. 본인이 가입한 것이 아니라면 아래 고객센터에 문의하세요");
				emok="no";
			}
		}
	});
}
//연락처 중복 검사
function phoneCheck(){
	$.ajax({
		type:"POST",
		url:"../join/joinPhoneCheck.jsp",
		data:{phone:$("#comjoin_form_comTel").val()
			,sel:"com"},
		success:function(data){
			var response=data.trim();
			if(response=="yes"){
				$("#comjoin_form_comTel_text").css({'display':'none'});
				telok="yes";
			}else if(response=="no"){
				$("#comjoin_form_comTel_text").css({'display':'block'});
				$("#comjoin_form_comTel_text").html("이미 가입된 휴대전화 입니다. 본인이 가입한 것이 아니라면 아래 고객센터에 문의하세요");
				telok="no";
			}
		}
	});
}
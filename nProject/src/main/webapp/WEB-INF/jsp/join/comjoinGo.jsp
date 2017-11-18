<%@page import="nmm.com.NmmDAOimple"%>
<%@page import="nmm.com.NmmDAO"%>
<%@page import="nmm.com.NmmVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");//한글깨짐 방지
String tel = request.getParameter("comjoin_form_comTel");
String comtel = request.getParameter("comjoin_form_comOfficTel");
String email = request.getParameter("comjoin_form_comEmail");
String id = request.getParameter("comjoin_form_comId");
String name = request.getParameter("comjoin_form_comCaptainName");
String comname = request.getParameter("comjoin_form_comOfficName");
String comaddress = request.getParameter("comjoin_form_comOfficAddress");
String pw = request.getParameter("comjoin_form_comPw");
String date = request.getParameter("comjoin_form_date");

//비정상적으로 접근시
if(tel==null || comtel==null || email==null || id==null
|| name==null || comname==null || comaddress==null
|| pw==null || date==null){
	%><script>location.replace("../main/index.jsp");</script><%
}else{
	NmmVO vo = new NmmVO();
	vo.setUcphone(tel);
	vo.setCompany_phone(comtel);
	vo.setUcemail(email);
	vo.setCompany_id(id);
	vo.setUcname(name);
	vo.setCompany_name(comname);
	vo.setCompany_address(comaddress);
	vo.setPassword(pw);
	vo.setInput_date(date);

	NmmDAO dao = new NmmDAOimple();
	int result1 = dao.joinComUser(vo);
	if (result1 == 1) {
		%>
		<script>
			alert('가맹점 가입 성공');
			location.replace('../main/index.jsp?rm=../login/login_form.jsp');
		</script>
		<%
		//response.sendRedirect("../main/index.jsp");
	} else{
		%>
		<script>
			alert('가맹점 가입에 문제가 있습니다');
			window.history.back();
		</script>
		<%
	}
}
%>
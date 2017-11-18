<%@page import="nmm.com.NmmDAOimple"%>
<%@page import="nmm.com.NmmDAO"%>
<%@page import="nmm.com.NmmVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");//한글깨짐 방지
String tel = request.getParameter("join_form_tel");
String email = request.getParameter("join_form_email");
String name = request.getParameter("join_form_name");
String pw = request.getParameter("join_form_pw");
String date = request.getParameter("join_form_date");

//비정상적으로 접근시
if(tel==null || email==null || name==null
|| pw==null || date==null){
	%><script>location.replace("../main/index.jsp");</script><%
}else{
	NmmVO vo = new NmmVO();
	vo.setUcphone(tel);
	vo.setUcemail(email);
	vo.setUcname(name);
	vo.setPassword(pw);
	vo.setInput_date(date);

	NmmDAO dao = new NmmDAOimple();
	int result1 = dao.joinUser(vo);
	if (result1 == 1) {
		%>
		<script>
			alert('회원가입 성공');
			location.replace('../main/index.jsp?rm=../login/login_form.jsp');
		</script>
		<%
		//response.sendRedirect("../main/index.jsp");
	} else{
		%>
		<script>
			alert('회원가입에 문제가 있습니다');
			window.history.back();
		</script>
		<%	
	}
}
%>
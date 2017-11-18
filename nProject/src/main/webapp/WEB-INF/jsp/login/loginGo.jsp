<%@page import="nmm.com.NmmDAOimple"%>
<%@page import="nmm.com.NmmDAO"%>
<%@page import="nmm.com.NmmVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");//한글깨짐 방지

String typetot = request.getParameter("login_form_typetot");//개인인지 가맹점인지
String pw = request.getParameter("login_form_pw");

NmmVO vo = new NmmVO();
NmmDAO dao = new NmmDAOimple();

if(typetot.equals("user")){//개인
	String id = request.getParameter("login_form_id");

	vo.setUcemail(id);
	vo.setUcphone(id);
	vo.setPassword(pw);
	
	int result1 = dao.loginUser(vo);
	if (result1==1) {
		session.setAttribute("id", id+"/"+typetot);//로그인 새션유지(개인회원 이름)+개인or가맹점구분
		%>
		<script>
			alert('로그인 성공');
			location.replace('../main/index.jsp');
		</script>
		<%
		//response.sendRedirect("../main/index.jsp");
	} else{
		%>
		<script>
			alert('개인 로그인 실패(가입시 이메일로 하셨는지 휴대전화로 하셨는지 아니면 비밀번호를 정확하게 입력해주세요)');
			window.history.back();
		</script>
		<%
	}
	
}else if(typetot.equals("com")){//가맹점
	String comid = request.getParameter("login_form_comid");

	vo.setCompany_id(comid);
	vo.setPassword(pw);
	
	int result1 = dao.loginCom(vo);
	if (result1==1) {
		session.setAttribute("id", comid+"/"+typetot);//로그인 새션유지(개인회원 이름)+개인or가맹점구분
		%>
		<script>
			alert('가맹점 로그인 성공');
			location.replace('../main/index.jsp');
		</script>
		<%
		//response.sendRedirect("../main/index.jsp");
	} else{
		%>
		<script>
			alert('가맹점 로그인 실패(가맹점은 이메일,휴대전화가 아닌 아이디 로그인만 접속됩니다.)');
			window.history.back();
		</script>
		<%
	}
}
%>
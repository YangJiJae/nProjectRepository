<%@page import="nmm.com.NmmDAOimple"%>
<%@page import="nmm.com.NmmDAO"%>
<%@page import="nmm.com.NmmVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");//한글깨짐 방지
	String phone = request.getParameter("phone");
	String select = request.getParameter("sel");//개인인지 가맹점인지 구분
	
	//비정상적으로 접근시
	if(phone==null || select==null){
		%><script>location.replace("../main/index.jsp");</script><%
	}else{
		NmmVO vo = new NmmVO();
		vo.setUcphone(phone);
		
		int result1=0;
		NmmDAO dao = new NmmDAOimple();
		
		if(select.equals("user")){//개인
			result1 = dao.joinUserPhCheck(vo);
		}else if(select.equals("com")){//가맹점
			result1 = dao.joinComPhCheck(vo);
		}
		
		String ok="no";
		if(result1 == 1){//중복시
			ok="no";
		} else{
			ok="yes";
		}
	%>
	<%=ok%>
<%} %>

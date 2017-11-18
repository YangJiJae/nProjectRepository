<%@page import="nmm.com.NmmDAOimple"%>
<%@page import="nmm.com.NmmDAO"%>
<%@page import="nmm.com.NmmVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");//한글깨짐 방지
	String email = request.getParameter("em");
	String select = request.getParameter("sel");//개인인지 가맹점인지 구분
	
	//비정상적으로 접근시
	if(email==null || select==null){
		%><script>location.replace("../main/index.jsp");</script><%
	}else{
		System.out.println(email);
		
		NmmVO vo = new NmmVO();
		vo.setUcemail(email);
		
		int result1=0;
		NmmDAO dao = new NmmDAOimple();
		
		if(select.equals("user")){//개인
			result1 = dao.joinUserEmCheck(vo);
		}else if(select.equals("com")){//가맹점
			result1 = dao.joinComEmCheck(vo);
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

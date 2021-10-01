<%@page import="dto.SessionDto"%>
<%@page import="dao.CustomerDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
String password = request.getParameter("password");

// id = 'admin', password = 'jcpdev'
Map<String, String> map = new HashMap<>();
map.put("email", id);
map.put("password", password);

CustomerDao dao = CustomerDao.getInstance();
SessionDto user = dao.login(map);

if (user != null) {
	// 로그인 정보 일치
//	session.setAttribute("uid", id);
	session.setAttribute("user", user);
	
	request.setAttribute("message", "로그인되었습니다.");
	request.setAttribute("url", "home.jsp");
	pageContext.include("error/alert.jsp");	// 해당페이지를 삽입
	// response.sendRedirect("home.jsp");
} else {
	// 로그인 정보 불일치
	out.print("<script>alert('로그인 정보가 틀렸습니다.');"+
	"location.href='loginView.jsp';</script>");
	

	//response.sendRedirect("loginView.jsp");
}
%>
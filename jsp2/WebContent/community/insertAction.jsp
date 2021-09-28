<%@page import="dao.FreeboardDao"%>
<%@page import="dto.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 코드작성 5분	
	// post method로 받을때, encoding 방식이 전달되지 않아서 request encoding 방식 정의 필요
	request.setCharacterEncoding("utf-8");
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String ip = request.getRemoteAddr();
	
	Freeboard dto = new Freeboard();
	dto.setSubject(subject);
	dto.setName(name);
	dto.setPassword(password);
	dto.setContent(content);
	dto.setIp(ip);
	
	FreeboardDao dao = FreeboardDao.getInstance();
	dao.insert(dto);
	
	response.sendRedirect("insertView.jsp");
	
	//out.print(dto);
	// pageContext.forward("insertView.jsp");
%>
<%@page import="dao.FreeboardDao"%>
<%@page import="dto.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String subject = request.getParameter("subject");
//	String password = request.getParameter("password");
	String content = request.getParameter("content");
//	String ip = request.getRemoteAddr();
	
	Freeboard dto = new Freeboard();
	dto.setIdx(idx);
	dto.setSubject(subject);
//	dto.setPassword(password);
	dto.setContent(content);
//	dto.setIp(ip);
	
	FreeboardDao dao = FreeboardDao.getInstance();
	dao.update(dto);
	
	response.sendRedirect("updateAction.jsp?idx="+idx);
%>
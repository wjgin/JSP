<%@page import="dao.CommentDao"%>
<%@page import="dto.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String ip = request.getRemoteAddr();
	int mref = Integer.parseInt(request.getParameter("mref"));
	
	Comment dto = new Comment(0, mref, name, password, content, null, ip);
	CommentDao dao = CommentDao.getInstance();
	dao.insert(dto);
	dao.updateCommentCnt(mref);
	
	response.sendRedirect("detailAction.jsp?page=1&idx=" + mref);
%>
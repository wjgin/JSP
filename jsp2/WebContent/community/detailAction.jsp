<%@page import="java.util.List"%>
<%@page import="dto.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	
	FreeboardDao dao = FreeboardDao.getInstance();
	Freeboard bean = dao.getOne(idx);
	
	CommentDao cdao = CommentDao.getInstance();
	List<Comment> cmts = cdao.getComment(idx);
	
	request.setAttribute("cmtlist", cmts);
	request.setAttribute("page", pageNo);
	request.setAttribute("bean", bean);
	
	pageContext.forward("detailView.jsp");
%>
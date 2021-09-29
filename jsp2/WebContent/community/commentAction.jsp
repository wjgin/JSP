<%@page import="dao.CommentDao"%>
<%@page import="dto.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CommentDao dao = CommentDao.getInstance();
int mref;
if (request.getParameter("del") != null) {
	int cmtidx = Integer.parseInt(request.getParameter("cmtidx"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	dao.deleteCmt(cmtidx);
	mref = idx;
} else {
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String ip = request.getRemoteAddr();
	mref = Integer.parseInt(request.getParameter("mref"));

	Comment dto = new Comment(0, mref, name, password, content, null, ip);
	dao.insert(dto);
//	dao.updateCommentCnt(mref);
}

dao.updateCountAll(mref);
response.sendRedirect("detailAction.jsp?page=1&idx=" + mref);
%>
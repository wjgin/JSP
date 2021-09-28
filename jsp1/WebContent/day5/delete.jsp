<%@page import="day5.dao.MybatisDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));

MybatisDao dao = MybatisDao.getInstance();
dao.delete(idx);

out.print("<script>");
out.print("alert('고객 idx" + idx + "삭제 되었습니다.');");
out.print("location.href = 'registration.html';");
out.print("</script>");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
	request.setAttribute("message", "로그인아웃 되었습니다.");
	request.setAttribute("url", "home.jsp");
	pageContext.include("error/alert.jsp");	// 해당페이지를 삽입
	
    // 세션 끊기
    session.invalidate();
    // response.sendRedirect("home.jsp");
    
    %>
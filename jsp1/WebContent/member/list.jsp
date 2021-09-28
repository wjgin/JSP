<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
			request.setCharacterEncoding("utf-8");
			CustomerDao dao = CustomerDao.getInstance();
			List<Customer> list = dao.selectAll();
			request.setAttribute("list", list);
			
			// 요청 전달
			pageContext.forward("list_view.jsp");
		%>
	
	<!-- 사용자 입력과 출력은 포함 x, 데이터의 처리만을 담당 
	.java 형식으로 작성될 수 있음-->
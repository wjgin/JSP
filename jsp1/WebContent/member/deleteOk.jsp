<%@page import="day3.dto.Customer"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));

CustomerDao dao = CustomerDao.getInstance();
Customer cus = new Customer();
cus.setIdx(idx);

dao.delete(cus);

// response.sendRedirect("list.jsp");

// 스크립트를 추가하고자 할 때, alert 창을 띄우기 위함
out.print("<script>");
out.print("alert('고객 idx' + idx + '삭제 되었습니다.');");
out.print("location.href = 'list.jsp';");
out.print("</script>");
%>
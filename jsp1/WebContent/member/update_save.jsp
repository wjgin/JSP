<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

int idx = Integer.parseInt(request.getParameter("idx"));
String email = request.getParameter("email");
String address = request.getParameter("address");
if (address.equals("기타"))
	address = request.getParameter("addr_etc");

Customer cus = new Customer();
cus.setIdx(idx);
cus.setEmail(email);
cus.setAddress(address);

CustomerDao dao = CustomerDao.getInstance();
dao.update(cus);

// 고객 정보 수정 후 돌아갈 url 
// response.sendRedirect("list.jsp"); 
response.sendRedirect("update.jsp?alert=&idx="+idx);
%>

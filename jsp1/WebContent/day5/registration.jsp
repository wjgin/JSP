<%@page import="day5.dao.MybatisDao"%>
<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");

	// html의 파라미터 받아오기
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	int age = Integer.parseInt(request.getParameter("age"));
	String address = request.getParameter("address");
	if (address.equals("기타"))
		address = request.getParameter("addr_etc");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	String hobbies = Arrays.toString(hobby).substring(1, Arrays.toString(hobby).length() - 1);
	
	// insert 실행
	Customer cus = new Customer(0, name, password, email, address, gender, age, hobbies);
	MybatisDao dao = MybatisDao.getInstance();
	int idx = dao.insert(cus);
	
	// 요청 전달
	request.setAttribute("customer", cus);
	request.setAttribute("idx", idx);
	pageContext.forward("registration_view.jsp");
%>

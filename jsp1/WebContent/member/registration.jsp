<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%
				request.setCharacterEncoding("UTF-8");
				
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

				Customer cus = new Customer(0, name, password, email, address, gender, age, hobbies);
				CustomerDao dao = CustomerDao.getInstance();
				dao.insert(cus);
				
				//1) 추가된 회원 정보만 확인
				request.setAttribute("customer", cus);
				pageContext.forward("registration_view.jsp");
				
				//2) 사용자가 용청하지 않은 회원 리스트 list.jsp로 요청 바꾸기
				// 요청 전달이 아닌 요청 변경(url 변경)
				//response.sendRedirect("list.jsp");
			%>

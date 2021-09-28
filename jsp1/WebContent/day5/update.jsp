<%@page import="day5.dao.MybatisDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String alert = request.getParameter("alert");

int idx = Integer.parseInt(request.getParameter("idx"));

MybatisDao dao = MybatisDao.getInstance();
Customer cus = dao.select(idx);


/* out.print(idx); // 테스트 용
out.print(cus); // 테스트 용 */

request.setAttribute("cus", cus);
if(alert != null) request.setAttribute("alert", "y");
pageContext.forward("update_view.jsp");
%>

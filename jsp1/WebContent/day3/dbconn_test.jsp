<%@page import="util.MySQLConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[1] - db test</title>
</head>
<body>
<h4>MySQL connection Test</h4>
<hr>
DB 연결 결과 :
<%
	Connection conn = MySQLConnectionUtil.connect();
	out.print(conn);
	out.print("<br>");
	if(conn == null) 
		out.print("연결 실패");
	else
		out.print("연결 성공");
%>
</body>
</html>
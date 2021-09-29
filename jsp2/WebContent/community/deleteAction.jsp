<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
String password = request.getParameter("password");

FreeboardDao dao = FreeboardDao.getInstance();
Map<String, Object> map = new HashMap<>();
map.put("password", password);

int n = dao.delete(map);
String message = null;
String href = null;

out.print("<script>");

if (n == 1) { //delete 실행
	message = "글이 삭제 되었습니다.";
	href = "listAction.jsp";
} else { //n==0 : password wrong
	message = "글의 비밀번호가 틀렸습니다.";
	href = "detailAction.jsp?page=1&idx=" + idx;
	
}
out.print("alert('" + message + "');" + 
"location.href='" + href + "';" + 
"</script>");
%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
int pageNo = Integer.parseInt(request.getParameter("page"));
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
	href = "listAction.jsp?page=" + pageNo;
} else { //n==0 : password wrong
	message = "글의 비밀번호가 틀렸습니다.";
	href = "detailAction.jsp?page="+ pageNo + "&idx=" + idx;
	
}
out.print("alert('" + message + "');" + 
"location.href='" + href + "';" + 
"</script>");
%>
<!--
참조 관계 삭제
1. 메인글 삭제 불가 : restrict
2. 메인글과 댓글 모두 삭제 : cascade
3. 메인글
4. 메인글 삭제 댓글의 mref 값은 null로 변경 : set null or set default
 -->

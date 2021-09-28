<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP1 ������Ʈ[3]</title>
</head>
<body>
	<!-- JSP ���� ��ü (implicit) : �������� �ʰ� ����ϴ� ��ü
	1) out(JspWritter Ŭ����Ÿ��) 
	2) request(HttpServletRequest): �޼ҵ� ������ �˾Ƴ� �� �ִ� �������� Ȯ��
		: ����ڰ� ��û�� ������ ��ü 
	-->
	
	<!-- request ��ü�� ������ ���忡�� Ŭ���̾�Ʈ�� ���� ���� -->
	<h3>request(HttpServletRequest) ��ü�� ����</h3>
	<ul>
		<!-- U����R�ڿ�L��ġ(�ּ�) -->
		<li>��û URL : <%=request.getRequestURL()%></li>
		<!-- U����R�ڿ�I�ĺ��� -->
		<li>��û URI : <%=request.getRequestURI()%></li>
		<li>����IP : <%=request.getLocalAddr()%>, <%=request.getLocalName() %></li>
		<li>���� port : <%=request.getLocalPort()%></li>
		<!-- IPv6 (64����Ʈ, 8�ڸ�) -->
		<li>Ŭ���̾�Ʈ IP : <%=request.getRemoteAddr()%></li>
		<!-- ������Ʈ �̸� -->
		<li>���ؽ�Ʈ(context) : <%=request.getContextPath()%></li>
		<% request.setCharacterEncoding("UTF-8"); %>
		<li>�������ڵ� ���� : <%=request.getCharacterEncoding()%></li>
		<li></li>
		<li></li>
		<!-- ��� IPv4 ���� : Run -> Run Configurations -> tomcat -> Arguments -> VM Arg �� �Է�
                        -Djava.net.preferIPv4Stack=true -->
	</ul>

</body>
</html>
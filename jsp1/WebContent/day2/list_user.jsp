<%@page import="java.util.List"%>
<%@page import="day1.MyUser"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP1 ������Ʈ[2]</title>
</head>
<body>
	<!-- �����ͺ��̽����� ��������� �޾ƿ� ������ �Դϴ�. -->
	<%
		//MyUser ��ü ����Ʈ�� �����ϰ� ������ ����.
	List<MyUser> list = new ArrayList<>();
	/* List : �������̽� , <> Generic Type(����Ʈ�� ��ҵ� ������ Ÿ�� ����) 
	   ArrayList : List�� ������ Ŭ����
	*/

	list.add(new MyUser("ȫ�浿", 23, "������"));
	list.add(new MyUser("������", 34, "����� ���ʱ�"));
	list.add(new MyUser("�ڼ���", 32, "����� ������"));
	list.add(new MyUser("����", 29, "�Ⱦ��"));
	list.add(new MyUser("����", 41, "�ǿս�"));
	list.add(new MyUser("���ӽ�", 54, "��õ��"));
	%>
	<table style="margin: auto;">
		<tr>
			<th>��ȣ</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
		</tr>
		<%
			// �ڹ��ڵ� : ��ũ��Ʈ��
		MyUser temp;
		for (int i = 0; i < list.size(); i++) {
			temp = list.get(i);
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=temp.getName()%></td>
			<td><%=temp.getAge()%></td>
			<td><%=temp.getLocation()%></td>
		</tr>
		<%
			}
		%>


	</table>


</body>
</html>
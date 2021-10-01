<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day10 el 내장 객체</title>
</head>
<body>
	<h3>EL 내장(implicit)객체</h3>
	<!-- 데이터를 가져오는 우선순위 
	pageContext, request, session, application -->

	<% pageContext.setAttribute("data1", 23); 
	//pageContext.setAttribute("data", 23); 
	%>
	<% request.setAttribute("data2", "hi~~~");
	//request.setAttribute("data", "hi~~~"); %>
	<% session.setAttribute("data3", "hi jsp");
	//session.setAttribute("data", "hi jsp"); %>
	<!-- session에 한번 저장된 attribute는 session의 timeout이나 종료 전까지는 남아있음.-->
	<% application.setAttribute("data4", "hello java");
	application.setAttribute("data", "hello java"); %>
	<!-- 톰캣서버가 종료되거나 application이 서버에서 종료되면 그때 application 객체 소멸 -->

	<dl>
		<dt>pageScope</dt>
		<dd>pageScope에 저장된 객체(애트리뷰트) ${pageScope.data1 }</dd>
		<dd>pageScope에 저장된 객체(애트리뷰트) \${pageScope.data}:
			${pageScope.data}</dd>


		<dt>requestScope</dt>
		<dd>request에 저장된 객체(애트리뷰터) 저장 ${requestScope.data2 }</dd>
		<dd>request에 저장된 객체(애트리뷰터) 저장 \${requestScope.data}:
			${requestScope.data}</dd>


		<dt>sessionScope</dt>
		<dd>session에 저장된 객체(애트리뷰트 ) 저장 ${sessionScope.data3 }</dd>
		<dd>session에 저장된 객체(애트리뷰트 ) 저장 \${sessionScope.data}:
			${sessionScope.data}</dd>


		<dt>applicationScope</dt>
		<dd>application에 저장된 객체(애트리뷰트 ) 저장 ${applicationScope.data4 }</dd>
		<dd>application에 저장된 객체(애트리뷰트 ) 저장 \${applicationScope.data}:
			${applicationScope.data}</dd>
		<dd>scope을 생략하고 사용 \${data} ?: ${data}</dd>

		<dt>param</dt>
		<dd>request.getParameter 메소드를 대신하는 el 객체</dd>
		<dt>header</dt>
		<dd>request.getHeader 메소드로 특정 요청헤더 항목을 가져올 때 사용</dd>
		<dt>cookie</dt>
		<dd>브라우저에 저장된 쿠기 값 가져올 때 사용</dd>
		
		<dt>pageContext</dt>
		<dd>요청을 처리하는 페이지 정보를 저장하는 객체, 예) \${pageContext.request.remoteAddr}: ${pageContext.request.remoteAddr}</dd>
		<dd>el을 사용할때는 jsp 내장객체를 제공하지 않음. pageContext만 존재하고 이를 통해 나머지 내장객체에 접근</dd>
		<%
		// pageContext를 jsp 내장객체를 리턴하는 메소드가 있음.
		//jsp request 객체 대신에
		pageContext.getRequest();
	// jsp session 객체
	pageContext.getSession();
	//	jsp response
	pageContext.getRequest();
	// jsp out
	pageContext.getOut();
	
	// jsp application
	pageContext.getServletContext();
	// 
	pageContext.getServletConfig();
	pageContext.getPage();
	
	%>
		<dt>기타 3가지</dt>
		<dd>paramValuese, headerValues, initParam</dd>
	</dl>
</body>
</html>
package com.jcpdev.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 서블릿: http 요청을 처리하는 자바클래스. HttpServlet을 상속
public class FirstServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	// 요청 Method가 Get일 때 처리되는 메소드: 메소드 매개변수 타입 req, resp
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// requset, response 외의 JSP 내장객체는 모두 선언해서 사용해야함
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		// JSP 내장객체 out 선언
		PrintWriter out = response.getWriter(); // JspWriter의 부모 PrintWriter 타입으로 선언
		// html 문서의 내용
		out.print("<h3>JSP와 서블릿</h3>");
		out.print("서블릿 출력");
		
		// 현재 request에 대해서 session 개체가 필요할 때
		HttpSession session = request.getSession();
		
		// 1) request에 애트리뷰트 객체 저장
		session.setAttribute("data", "first");
		request.setAttribute("number", 123);
		// request.setAttribute("data", 123); // request가 우선 적용
		
		// 2) view 파일로 forward
		// pageContext.forward("first.jsp"); -> pageContext는 jsp의 내장객체
		// 서블릿에서의 방법
		// first.jsp(view 파일)가 현재의 request, response를 전달 받을 수 있도록 감싸는 객체가 RequestDispatcher
		RequestDispatcher rd = request.getRequestDispatcher("first.jsp");
		rd.forward(request, response);
		
	}
	
	// 요청Method가 POST일 때 처리되는 메소드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}

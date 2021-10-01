package com.jcpdev.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿: http 요청을 처리하는 자바클래스. HttpServlet을 상속
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	// 요청 Method가 Get일 때 처리되는 메소드: 메소드 매개변수 타입 req, resp
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// requset, response 외의 JSP 내장객체는 모두 선언해서 사용해야함
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		// JSP 내장객체 out 선언
		PrintWriter out = response.getWriter(); // JspWriter의 부모 PrintWriter 타입으로 선언
		
		out.print("<h3>JSP와 서블릿</h3>");
		out.print("서블릿 출력");
	}
	
	// 요청Method가 POST일 때 처리되는 메소드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}

package com.jcpdev.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(description = "두번째 서블릿 연습", urlPatterns = { "/second.dev" })
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SecondServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		// JSP 내장객체 out 선언
		PrintWriter out = response.getWriter(); // JspWriter의 부모 PrintWriter 타입으로 선언
		// html 문서의 내용
		out.print("<h3>JSP와 서블릿</h3>");
		out.print("서블릿 출력");
		
		// 현재 request에 대해서 session 개체가 필요할 때
		HttpSession session = request.getSession();
		session.setAttribute("message", "second");
		request.setAttribute("number", 999); // response.sendRedirect 하면 의미없는 동작
		
		// url 요청을 바꿈(리다이렉트) -> url 지정 (response 애트리뷰트에 set된 값만 가져감)
		response.sendRedirect("first.dev");
		// response.sendRedirect(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.jcpdev.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/3th.dev")
public class ThirdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThirdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 3th.jsp 파일을 view 파일로 사용
		RequestDispatcher rd = request.getRequestDispatcher("3th.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html"); // 태그를 인식
		PrintWriter out = response.getWriter();
		
		out.print("<h4>파라미터</h4>");
		out.print("name:" + name);
		out.print("age: " + age);
		
		// 요청메소드가 post인 경우=> 데이터 저장(db insert) 동작
		// response.sendRedirect(url);
	}

}

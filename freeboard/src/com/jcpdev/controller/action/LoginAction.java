package com.jcpdev.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.CustomerDao;
import com.jcpdev.dto.SessionDto;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		String id = request.getParameter("userid");
		String password = request.getParameter("password");

		Map<String, String> map = new HashMap<>();
		map.put("email", id);
		map.put("password", password);

		CustomerDao dao = CustomerDao.getInstance();
		SessionDto user = dao.login(map);

		if (user != null) {
			// 로그인 정보 일치
			session.setAttribute("user", user);
			request.setAttribute("message", "로그인 되었습니다.");
			request.setAttribute("url", "./");
		} else {
			// 로그인 정보 불일치
			request.setAttribute("message", "로그인 정보가 올바르지 않습니다.");
			request.setAttribute("url", "login.do");   //변경

			//response.sendRedirect("loginView.jsp");
		}
		
		forward.isRedirect = false;
		forward.url = "error/alert.jsp";
		return forward;
	}

}

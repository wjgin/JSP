package com.jcpdev.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.FreeboardDao;

public class DeleteAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// ActionForward forward = new ActionForward();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));
		String password = request.getParameter("password");

		FreeboardDao dao = FreeboardDao.getInstance();
		Map<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("password", password);

		int n = dao.delete(map);
		String message = null;
		String href = null;

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		if (n == 1) { //delete 실행
			message = "글이 삭제 되었습니다.";
			href = "list.do?page=" + pageNo;
		} else { //n==0 : password wrong
			message = "글의 비밀번호가 틀렸습니다.";
			href = "detail.do?page="+ pageNo + "&idx=" + idx;
		}
		out.print("<script>"
				+ "alert('" + message + "');"
				+ "location.href = '" + href + "';"
				+ "</script>");
		
		// forward.isRedirect = true;
		return null;
	}

}

package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.FreeboardDao;
import com.jcpdev.dto.Freeboard;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		
		Freeboard dto = new Freeboard();
		dto.setSubject(subject);
		dto.setName(name);
		dto.setPassword(password);
		dto.setContent(content);
		dto.setIp(ip);
		
		FreeboardDao dao = FreeboardDao.getInstance();
		dao.insert(dto);
		
		forward.isRedirect = true;
		forward.url = "list.do";
		
		return forward;
	}

}

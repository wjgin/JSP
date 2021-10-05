package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.FreeboardDao;
import com.jcpdev.dto.Freeboard;

public class ModifyAction implements Action{

	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		boolean isRedirect = true;
		
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Freeboard dto = new Freeboard();
		dto.setIdx(idx);
		dto.setSubject(subject);
		dto.setContent(content);
		
		FreeboardDao dao = FreeboardDao.getInstance();
		dao.update(dto);
		
		return isRedirect;
	}

}

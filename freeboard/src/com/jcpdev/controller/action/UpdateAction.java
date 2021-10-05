package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.FreeboardDao;
import com.jcpdev.dto.Freeboard;

public class UpdateAction implements Action{

	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		boolean isRedirect = false;
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));

		Freeboard dto = new Freeboard();
		FreeboardDao dao = FreeboardDao.getInstance();
		dto = dao.getOne(idx);

		request.setAttribute("page", pageNo);
		request.setAttribute("bean", dto);
		
		return isRedirect;
	}

}

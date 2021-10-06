package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.FreeboardDao;
import com.jcpdev.dto.Freeboard;

public class UpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));

		Freeboard dto = new Freeboard();
		FreeboardDao dao = FreeboardDao.getInstance();
		dto = dao.getOne(idx);

		request.setAttribute("page", pageNo);
		request.setAttribute("bean", dto);
		
		forward.isRedirect = false;
		forward.url = "community/update.jsp";
		
		return forward;
	}

}

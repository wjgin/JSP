package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.CommentDao;
import com.jcpdev.dto.Comment;

public class CommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		CommentDao dao = CommentDao.getInstance();
		
		int pageNo = Integer.parseInt(request.getParameter("page"));
		int mref;
		
		if (request.getParameter("del") != null) {
			int cmtidx = Integer.parseInt(request.getParameter("cmtidx"));
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.deleteCmt(cmtidx);
			mref = idx;
		} else {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			String ip = request.getRemoteAddr();
			mref = Integer.parseInt(request.getParameter("mref"));

			Comment dto = new Comment(0, mref, name, password, content, null, ip);
			dao.insert(dto);
		}

		dao.updateCountAll(mref);
		
		forward.isRedirect = true;
		forward.url = "detail.do?idx=" + mref + "&page=" + pageNo;
		
		return forward;
	}

}

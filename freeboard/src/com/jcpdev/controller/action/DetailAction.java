package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.CommentDao;
import com.jcpdev.dao.FreeboardDao;
import com.jcpdev.dto.Comment;
import com.jcpdev.dto.Freeboard;

public class DetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));

		Freeboard dto = new Freeboard();
		FreeboardDao dao = FreeboardDao.getInstance();
		dto = dao.getOne(idx);

		CommentDao cdao = CommentDao.getInstance();
		List<Comment> cmts = cdao.getComment(idx);
		
		request.setAttribute("cmtlist", cmts);
		request.setAttribute("page", pageNo);
		request.setAttribute("bean", dto);
		
		forward.isRedirect = false;
		forward.url = "community/detail.jsp";
		
		return forward;
	}

}

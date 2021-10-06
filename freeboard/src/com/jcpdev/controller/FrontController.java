package com.jcpdev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.controller.action.Action;
import com.jcpdev.controller.action.ActionForward;
import com.jcpdev.controller.action.CommentAction;
import com.jcpdev.controller.action.DeleteAction;
import com.jcpdev.controller.action.DetailAction;
import com.jcpdev.controller.action.GalleryListAction;
import com.jcpdev.controller.action.InsertAction;
import com.jcpdev.controller.action.ListAction;
import com.jcpdev.controller.action.LoginAction;
import com.jcpdev.controller.action.LogoutAction;
import com.jcpdev.controller.action.ModifyAction;
import com.jcpdev.controller.action.UpdateAction;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	
	// 요청 method 구별없이 실행 -> doGet() 또는 doPost() 메소드 실행 내용 있으면 실행
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * System.out.println(request.getContextPath());
		 * System.out.println(request.getServletPath());
		 */
		ActionForward forward = null;
		// boolean isRedirect = false;
		
		String spath = request.getServletPath();
		String path = "home.jsp";
		// String url = "./";
		
		if(spath.equals("/list.do")) {
			Action action = new ListAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/login.do")) {
			path = "login.jsp";
			forward = new ActionForward(false, path);
		} else if(spath.equals("/insert.do")) {
			path = "community/insert.jsp";
			forward = new ActionForward(false, path);
		} else if(spath.equals("/detail.do")) {
			Action action = new DetailAction();
			forward = action.execute(request, response);
		}  else if(spath.equals("/save.do")) {
			Action action = new InsertAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/update.do")) {
			Action action = new UpdateAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/modify.do")) {
			Action action = new ModifyAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/delete.do")) {
			Action action = new DeleteAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/comment.do")) {
			Action action = new CommentAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/loginAction.do")) {
			Action action = new LoginAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/logout.do")) {
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		} else if(spath.equals("/gallery.do")) {
			path = "gallery/gallery.jsp";
			forward = new ActionForward(false, path);
		}else if(spath.equals("/regist.do")) {
			Action action = new GalleryListAction();
			forward = action.execute(request, response);
		}
		
		
		
		if(!forward.isRedirect()) { // 타입이 boolean이면 getter가 isXXX
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		} else {
			response.sendRedirect(forward.getUrl());
		} 
		
	}
}

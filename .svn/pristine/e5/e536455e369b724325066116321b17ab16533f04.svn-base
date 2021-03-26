package com.astral.app.confirm;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.confirm.ReviewConfirmListAction;

public class ConfirmFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		// /astral
		String contextPath = req.getContextPath();
		// /member/MemberLoginOk.me
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		
		
		switch(command) {
			case "/confirm/ReviewConfirmList.co":
				try {
					forward = new ReviewConfirmListAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			
			default:
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/error/error.jsp");
		}

		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}

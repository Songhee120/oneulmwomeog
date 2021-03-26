package com.astral.app.food;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.ActionForward;

public class FoodFrontController extends HttpServlet{
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
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		
		if (command.equals("/food/FoodRandomChoiceOk.fo")) {
			try {
				forward = new FoodRandomChoiceOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/food/FoodSelectCheck.fo")){
			try {
				forward = new FoodSelectCheck().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/food/FindRoad.fo")){
			try {
				forward = new FindRoadAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/food/FoodReset.fo")){
			try {
				forward = new FoodResetAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/cafe/CafeSelect.fo")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/food/cafe_select.jsp");
		}else if(command.equals("/cafe/CafeFindRoad.fo")){
			try {
				forward = new CafeFindRoadAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			forward = new ActionForward();
			forward.setPath("/error/error.jsp");
			forward.setRedirect(false);
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

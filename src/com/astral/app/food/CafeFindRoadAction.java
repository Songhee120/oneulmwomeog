package com.astral.app.food;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.HistoryDAO;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.vo.HistoryVO;

public class CafeFindRoadAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
				
		//길찾기 좌표
		req.setAttribute("res_x", req.getParameter("res_x"));
		req.setAttribute("res_y", req.getParameter("res_y"));
		req.setAttribute("res_name", req.getParameter("res_name"));
		req.setAttribute("loc_x", req.getParameter("loc_x"));
		req.setAttribute("loc_y", req.getParameter("loc_y"));
		req.setAttribute("loc_name", req.getParameter("loc_name"));
		
		forward.setPath("/food/cafeRoad.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}

package com.astral.app.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.HistoryDAO;
import com.astral.app.member.vo.HistoryVO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.ReviewVO;

public class ReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ReviewDAO r_dao = new ReviewDAO();
		HistoryDAO h_dao = new HistoryDAO();
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		int review_no = Integer.parseInt(req.getParameter("review_no"));
		String mem_id = (String)session.getAttribute("mem_id");
		int mem_no = r_dao.memberSeq(mem_id);
		ReviewVO r_vo = r_dao.getAllDetails(review_no);
		
		

		
		req.setAttribute("reviewBean", r_vo);
		req.setAttribute("history_list", h_dao.history_list(mem_no));			
		forward.setPath("/review/review_modify.jsp");

		forward.setRedirect(false);
		
		
		return forward;
	}

}

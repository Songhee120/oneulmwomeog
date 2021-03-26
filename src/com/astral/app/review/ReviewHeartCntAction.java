package com.astral.app.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.review.dao.HeartDAO;

public class ReviewHeartCntAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		
		int review_no = Integer.parseInt(req.getParameter("review_no"));
		
		HeartDAO h_dao = new HeartDAO();
		
		int count = h_dao.heart_cnt(review_no);
		h_dao.updateReviewHeart(review_no);
		
		out.println(count);
		out.close();
		
		return null;
	}

}

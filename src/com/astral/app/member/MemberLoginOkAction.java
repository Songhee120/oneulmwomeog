package com.astral.app.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.HistoryDAO;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.ReviewVO;

public class MemberLoginOkAction implements Action {

	public static Thread thread;
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		MemberDAO m_dao = new MemberDAO();
		ReviewDAO r_dao = new ReviewDAO();
		FilesDAO f_dao = new FilesDAO();
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String id = req.getParameter("login_email");
		String pw = req.getParameter("login_password");
		
		
		List<ReviewVO> best = null;
		
		if(m_dao.login(id, pw)) {
			session.setAttribute("mem_id", id);
			int mem_no = m_dao.getMemberNumber(id);

			Runnable runnable = new HistoryDAO();
			thread = new Thread(runnable);
			thread.setName("" + mem_no);
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/member/login_index.jsp");
			
			thread.start();
		}else {
			forward.setRedirect(false);
			forward.setPath("/member/index.jsp?login=false");
		}
		return forward;
	}

}

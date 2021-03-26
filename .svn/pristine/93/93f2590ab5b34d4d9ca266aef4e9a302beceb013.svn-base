package com.astral.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;

public class MemberCheckEmailOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		MemberDAO m_dao = new MemberDAO();
			
		String id = (String)session.getAttribute("mem_id");
		String new_email = req.getParameter("new_email");
		
		boolean isOverlap = m_dao.checkEmail(new_email);
				
		if(isOverlap) {
			out.println("not-ok");
		}else {
			if(m_dao.changeMyEmail(id, new_email)) {
				out.println("ok");
			}
		}
		out.close();
		return null;
	}

}

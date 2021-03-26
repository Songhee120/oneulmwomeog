package com.astral.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;

public class MemberCheckNickOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		MemberDAO m_dao = new MemberDAO();
			
		String id = (String)session.getAttribute("mem_id");
		String new_nickname = req.getParameter("new_nickname");
		
		boolean isOverlap = m_dao.checkNick(new_nickname);
				
		if(isOverlap) {
			out.println("not-ok");
		}else {
			if(m_dao.changeMyNick(id, new_nickname)) {
				out.println("ok");
				System.out.println("들어옴!");
			}
		}
		out.close();
		
		return null;
	}

}
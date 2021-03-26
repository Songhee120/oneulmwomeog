package com.astral.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.vo.MemberVO;

public class MemberMyDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		ActionForward forward = null;

		HttpSession session = req.getSession();
		MemberDAO m_dao = new MemberDAO();
		MemberVO m_vo = m_dao.myInfo((String)session.getAttribute("mem_id"));
		m_vo.setMem_birth(m_vo.getMem_birth().substring(0, 10));
		if (m_vo != null) {
			forward = new ActionForward();
			forward.setPath("/member/update.jsp");
			forward.setRedirect(false);
			req.setAttribute("mem_vo", m_vo);
		}
		return forward;
	}
}

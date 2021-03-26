package com.astral.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;

public class MemberFindPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		MemberDAO m_dao = new MemberDAO();
		ActionForward forward = null;

		HttpSession session = req.getSession();
		// session에저장된 인증번호를 받는 변수
		String key = (String) session.getAttribute("key_num");
		// 회원이 입력한 인증번호를 받는 변수
		String user_key = req.getParameter("pw_mean");

		String mem_id = req.getParameter("id");
		String mem_name = req.getParameter("name");

		if (m_dao.searchMyPw(mem_id, mem_name) && key.equals(user_key)) {
			forward = new ActionForward();
			System.out.println("들어옴");
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/member/index.jsp");
		} 
		return forward;
	}

}

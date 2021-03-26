package com.astral.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;

public class MemberFindIdAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		ActionForward forward = null;
		MemberDAO m_dao = new MemberDAO();
		//session에저장된 인증번호를 받는 변수
		String key = (String)session.getAttribute("key_num");
	
		//회원이 입력한 인증번호를 받는 변수
		String user_key = req.getParameter("id_mean");
		String email = req.getParameter("input_id_email");
		String name = req.getParameter("name");
		//아이디를 담은 변수 
		String id = m_dao.searchMyId(name, email);
		System.out.println(id);
		//아이디가 없거나 인증번호가 틀렸을 때 페이지 이동 없이 상황에 맞는 메세지 출력 필요
		if(id != null && user_key.equals(key)) {
			forward = new ActionForward();
			forward.setRedirect(false);
			session.invalidate();
			forward.setPath("/member/memberShowId.jsp");
			req.setAttribute("mem_id", id);
		}
		
		return forward;
	}
}

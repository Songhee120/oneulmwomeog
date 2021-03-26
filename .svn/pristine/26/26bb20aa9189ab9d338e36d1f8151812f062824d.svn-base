package com.astral.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.vo.MemberVO;

public class MemberChangePwOkAction implements Action {

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
		String mem_id = session.getAttribute("mem_id").toString();
		
		String email = req.getParameter("input_pw2_email");				
		String mem_pw = req.getParameter("mem_pw");
		String mem_newpw = req.getParameter("mem_newpw");
		System.out.println("들어왔니?"); 

		if (m_dao.changeMyUpdatePw(mem_id, mem_newpw)&& key.equals(user_key) ) {
			
			forward = new ActionForward();						
			System.out.println("들어옴");
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/member/login_index.jsp");
		} 
		
		
		return forward;
	}

}
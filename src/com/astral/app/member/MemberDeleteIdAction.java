package com.astral.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.vo.MemberVO;



public class MemberDeleteIdAction implements Action{
		 @Override
		public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			 req.setCharacterEncoding("UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 
			 HttpSession session = req.getSession();
			 ActionForward forward = new ActionForward();
			 MemberDAO m_dao = new MemberDAO();
			 MemberVO m_vo = new MemberVO();
			 String id = (String)session.getAttribute("mem_id");
			 
			 
			 m_dao.deleteMyId(id);
			 

			 
			 if(m_dao.deleteMyId(id)) {
			 
			 forward.setRedirect(true);
			 forward.setPath(req.getContextPath()+"/member/index.jsp");
			 
			 }else {
				 
				 forward = null;
			 }
			 
			 return forward;
			 
			 
			
		}
}

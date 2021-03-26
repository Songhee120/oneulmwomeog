package com.astral.app.food;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.AuthorityDAO;
import com.astral.app.member.dao.MemberDAO;

public class FoodResetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		MemberDAO m_dao = new MemberDAO();
		AuthorityDAO a_dao = new AuthorityDAO();
		if((String)session.getAttribute("mem_id") != null) {
			int mem_no = m_dao.getMemberNumber((String)session.getAttribute("mem_id"));
			a_dao.deleteAuthority(mem_no);			
		}else {
			Cookie[] cookies = req.getCookies();
			Cookie check = null;
			if(cookies != null && cookies.length != 0) {
				for(Cookie cookie : cookies) {
					if(cookie.getName().equals("cookie_authority")) {
						check = cookie;
					}
				}
			}
			if(check != null) {
				check.setMaxAge(0);
				resp.addCookie(check);
			}
		}
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html;charset=utf-8");
		out.println("ok");
		
		return null;
	}
}

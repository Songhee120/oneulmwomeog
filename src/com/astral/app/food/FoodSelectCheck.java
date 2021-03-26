package com.astral.app.food;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.AuthorityDAO;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.vo.AuthorityVO;

public class FoodSelectCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		AuthorityDAO a_dao = new AuthorityDAO();
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		JSONObject json = new JSONObject();
		
		json.put("authority", "ok");
		//회원
		if((String)session.getAttribute("mem_id") != null) {
			int mem_no = m_dao.getMemberNumber((String)session.getAttribute("mem_id"));
			
			//회원번호를 통해 사용 기록을 확인
			AuthorityVO a_vo = a_dao.mem_check(mem_no);
			//기록이 없다면 바로 페이지 이동
			if(a_vo != null){
				//1시간 이내에 사용한 기록이 있다면 경고를 한다.
				double t = a_dao.timeCheck(a_vo.getAuthority_date());
				if(t < 60) {
					json.put("time", 60 - (int)t);
					json.replace("authority", "not-ok");
					//1시간이 지났다면 기록을 삭제한다.
				}else {
					a_dao.deleteAuthority(mem_no);
				}
			}		
		//비회원
		}else {
			Cookie[] cookies = req.getCookies();
			Cookie user_cookie = null;
			if(cookies != null && cookies.length != 0) {
				for(Cookie cookie : cookies) {
					if(cookie.getName().equals("cookie_authority")) {
						user_cookie = cookie;
					}
				}
			}
			if(user_cookie != null) {
				//json.replace("authority", "not-ok");
				//System.out.println("번호: " + user_cookie.getValue());
			}
		}
		resp.setCharacterEncoding("application/x-json; charset=UTF-8");
		out.println(json.toJSONString());
		
		return null;
	}
}

package com.astral.app.food;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.food.dao.FoodDAO;
import com.astral.app.member.dao.AuthorityDAO;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.vo.AuthorityVO;

public class FoodRandomChoiceOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		Date now = new Date();
		HttpSession session = req.getSession();
		FoodDAO f_dao = new FoodDAO();
		AuthorityDAO a_dao = new AuthorityDAO();
		MemberDAO m_dao = new MemberDAO();
		List<String> food_list = new ArrayList<String>();
		
		int ppl_count = Integer.parseInt(req.getParameter("ppl_count"));
		int price = Integer.parseInt(req.getParameter("price"));
		int starv_level = Integer.parseInt(req.getParameter("starv_level"));
		int now_time = Integer.parseInt(now.toString().split(" ")[3].split(":")[0]);
		int time = 0;
		if(now_time >= 22 || now_time < 7) {
			time = 1;
		}else if(now_time >= 7 && now_time < 11) {
			time = 2;
		}else if(now_time >= 11 && now_time < 15) {
			time = 3;
		}else if(now_time >= 15 && now_time < 18) {
			time = 4;
		}else if(now_time >= 18 && now_time < 22) {
			time = 5;
		}
		
		Random r = new Random();
		PrintWriter out = resp.getWriter();
		String result = null;
		food_list = f_dao.getFoodList(ppl_count, price, starv_level, time);
		int mem_no = 0;
		
		//회원일때만 데이터를 저장한다.
		if((String)session.getAttribute("mem_id") != null) {
			mem_no = m_dao.getMemberNumber((String)session.getAttribute("mem_id"));	
		//비회원일때 쿠키 저장
		}else {
			Cookie new_cookie = new Cookie("cookie_authority", "true");
			//1시간
			new_cookie.setMaxAge(60*60);
			resp.addCookie(new_cookie);
		}
		
		if(food_list.size() == 0) {
			result = "none";
		}else {
			int index = r.nextInt(food_list.size());
			result = food_list.get(index);
			if(mem_no != 0) {
				//사용을 했으므로 기록한다.
				a_dao.insertAuthority(mem_no);				
			}
		}
		resp.setContentType("text/html;charset=utf-8");
		out.println(result);		
		return null;
	}

}

package com.astral.app.review;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.HistoryDAO;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.dao.Profile_FilesDAO;
import com.astral.app.member.vo.HistoryVO;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.HeartDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.ReviewVO;
import com.astral.app.scrap.dao.ScrapDAO;

public class ReviewShowOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
	    ReviewDAO r_dao = new ReviewDAO();
	    ReviewVO r_vo = new ReviewVO();
	    FilesDAO f_dao = new FilesDAO();
	    HeartDAO h_dao = new HeartDAO();
	    ScrapDAO s_dao = new ScrapDAO();
	    HistoryDAO his_dao = new HistoryDAO();
	    Profile_FilesDAO p_dao = new Profile_FilesDAO();

		
		HttpSession session = req.getSession();
		HashMap<String, Object> m = new HashMap<>();
		
		int review_no = Integer.parseInt(req.getParameter("review_no"));
		int mem_no = m_dao.getMemberNumber((String)session.getAttribute("mem_id"));

		String mem_nickName = r_dao.getMemberNickName(review_no);
		String res_address = r_dao.getResAddress(review_no);
		
		
	    String fileName = f_dao.getFileName(review_no);
	    String profileName = p_dao.getFileName(mem_no);

		//flag만들기
		String flag = "";
		for(HistoryVO h_vo : his_dao.history_list(r_vo.getMem_no())) {
			if(h_vo.getRes_name().equals(r_vo.getRes_name())){
				flag += "none";
			}
		}
		
		//웹브라우저에서 req에 담겨져 넘어온 cookie를 담는다.
		//웹 브라우저 -> 웹서버
		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;
		//쿠키가 null이 아니거나 길이가 0보다 크면 값이 존재
		if(cookies != null && cookies.length > 0) {
			//길이만큼 반복을 돌려
			int i = 0;
			for(Cookie cookie : cookies) {
				//쿠키의 name(key)과 비교하여
				if(cookie.getName().equals("cookie" + review_no)) {
					//저장되어 있다면 해당 쿠키를 변수에 담는다.
					viewCookie = cookie;
				}
			}
		}
		
		//변수가 null이라면 처음 리뷰를 본것이므로 if문에 들어간다.
		//if문에 들어가지 않았다면 이미 해당 리뷰 번호가 존재하므로 새로고침이나 다른 행동으로 인한 조회수 증가를 막는다.
		if(viewCookie == null) {
			//쿠키에 리뷰번호를 담아준다.
			Cookie newCookie = new Cookie("cookie" + review_no, "|" + review_no + "|");
			//쿠키 수명(하루)
			newCookie.setMaxAge(60*60*24);
			//쿠키추가, 응답(resp)에 담아준다.
			resp.addCookie(newCookie);
			//조회수 증가
			r_dao.updateViews(review_no);	
		}
		
		int memberNo = r_dao.memberSeq((String)session.getAttribute("mem_id"));

		m.put("review_no", review_no);
		m.put("mem_no", memberNo);
		
		int check = h_dao.heart_check(m);
		int scrapCheck = s_dao.scrap_check(memberNo, review_no);
		r_vo = r_dao.getAllDetails(review_no);
		ActionForward forward = null;

		if(r_vo != null) {
			req.setAttribute("flag", flag);
			req.setAttribute("reviewBean", r_vo);
			req.setAttribute("mem_nickName", mem_nickName);
			req.setAttribute("res_address", res_address);
			req.setAttribute("memberNo", memberNo);
			req.setAttribute("check", check);
			req.setAttribute("scrapCheck", scrapCheck);
	        req.setAttribute("profileName", profileName);

			if(fileName != null) {
				req.setAttribute("filesBeanList", fileName);
			}
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/review/myreview.jsp");
			
		}
		return forward;
	}
}

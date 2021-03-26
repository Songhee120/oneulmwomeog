package com.astral.app.food;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.HistoryDAO;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.vo.HistoryVO;

public class FindRoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession sesssion = req.getSession();
		MemberDAO m_dao = new MemberDAO();
		HistoryDAO h_dao = new HistoryDAO();
		HistoryVO h_vo = new HistoryVO();
		ActionForward forward = new ActionForward();
		
		//회원일 경우에만 history저장
		if((String)sesssion.getAttribute("mem_id") != null) {
			String mem_id = (String)sesssion.getAttribute("mem_id");
			int mem_no = m_dao.getMemberNumber(mem_id);
			
			//히스토리 저장용
			String res_name = req.getParameter("res_name");
			String res_url = req.getParameter("res_url");
			String res_address = req.getParameter("res_address");
			
			//vo에 저장
			h_vo.setMem_no(mem_no);
			h_vo.setRes_name(res_name);
			h_vo.setRes_url(res_url);
			h_vo.setRes_address(res_address);
			h_dao.insertHistory(h_vo);
			
			//테이블에 데이터 넣기
			List<Integer> history_list = h_dao.allHistory(mem_no);

			//오래된 데이터 삭제
			if(history_list.size() > 10) {
				h_dao.deleteHistory(history_list.get(10));
			}
		}
		
		//길찾기 좌표
		req.setAttribute("res_x", req.getParameter("res_x"));
		req.setAttribute("res_y", req.getParameter("res_y"));
		req.setAttribute("res_name", req.getParameter("res_name"));
		req.setAttribute("loc_x", req.getParameter("loc_x"));
		req.setAttribute("loc_y", req.getParameter("loc_y"));
		req.setAttribute("loc_name", req.getParameter("loc_name"));
		forward.setPath("/food/findRoad.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}

package com.astral.app.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.notice.dao.NoticeDAO;
import com.astral.app.notice.vo.NoticeVO;

public class NoticeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		NoticeDAO n_dao = new NoticeDAO();
		
		int notice_no = Integer.parseInt(req.getParameter("seq"));
		
		NoticeVO n_vo = n_dao.noticeDetail(notice_no);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("/notice/noticemodify.jsp");
		forward.setRedirect(false);
		req.setAttribute("notice", n_vo);
		
		
		
		return forward;
	}

}

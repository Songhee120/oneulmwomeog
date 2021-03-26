package com.astral.app.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.notice.dao.NoticeDAO;

public class NoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		NoticeDAO n_dao = new NoticeDAO();
		
		int notice_no = Integer.parseInt(req.getParameter("seq"));
		
		n_dao.noticeDelete(notice_no);
		
		ActionForward forward = new ActionForward();
		forward.setPath(req.getContextPath() + "/notice/NoticeList.no");
		forward.setRedirect(true);
		
		return forward;
	}

}

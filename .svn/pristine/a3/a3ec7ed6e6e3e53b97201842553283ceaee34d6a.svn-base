package com.astral.app.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.notice.dao.NoticeDAO;
import com.astral.app.notice.vo.NoticeVO;

public class NoticeWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		NoticeVO n_vo = new NoticeVO();
		NoticeDAO n_dao = new NoticeDAO();
		
		String notice_title = req.getParameter("notice_title");
		String notice_type = req.getParameter("notice_type");
		String notice_content = req.getParameter("notice_content");
		
		n_vo.setNotice_title(notice_title);
		n_vo.setNotice_type(notice_type);
		n_vo.setNotice_content(notice_content);
		
		n_dao.noticeWrite(n_vo);
		
		ActionForward forward = new ActionForward();
		forward.setPath(req.getContextPath() + "/notice/NoticeList.no");
		forward.setRedirect(true);
		
		return forward;
	}

}

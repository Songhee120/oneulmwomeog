package com.astral.app.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.notice.dao.NoticeDAO;
import com.astral.app.notice.vo.NoticeVO;

public class NoticeModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		NoticeVO n_vo = new NoticeVO();
		NoticeDAO n_dao = new NoticeDAO();
		
		int notice_no = Integer.parseInt(req.getParameter("seq"));
		String notice_title = req.getParameter("notice_title");
		String notice_type = req.getParameter("notice_type");
		String notice_content = req.getParameter("notice_content");
		
		n_vo.setNotice_title(notice_title);
		n_vo.setNotice_type(notice_type);
		n_vo.setNotice_content(notice_content);
		n_vo.setNotice_no(notice_no);
		
		n_dao.noticeModify(n_vo);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/notice/NoticeDetail.no?seq=" + notice_no);
		
		return forward;
	}

}

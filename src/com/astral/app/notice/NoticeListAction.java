package com.astral.app.notice;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.notice.dao.NoticeDAO;
import com.astral.app.notice.vo.NoticeVO;

public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		NoticeDAO n_dao = new NoticeDAO();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		
		String now_date = format.format(now);
		//파라미터로 넘어온 페이지를 받는다.
		String temp = req.getParameter("page");
		//파라미터로 넘어온 검색 value
		String notice_search = req.getParameter("notice_search");
		//파라미터로 넘어온 select(option) value값이 넘어온다.
		String type = req.getParameter("select_type");
		int select_type = 0;
		//null이 아닐 때(단순 이동)에만 형 변환
		if(type != null) {
			select_type = Integer.parseInt(type);			
		}
		//넘어온 파라미터에 값의 여부에 따라 1페이지를 보여줄지 해당 페이지를 보여줄지 정한다.
		int page = temp == null? 1 : Integer.parseInt(temp);
		
		int pageSize = 5;
		
		int endRow = page * pageSize;
		int startRow = endRow - (pageSize - 1);
		
		//검색했을 경우, 셀렉했을 경우 있으므로 같이 보내준다.
		int totalCnt = n_dao.getTotalCnt(notice_search, select_type);
		
		
		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + 4;
		
		int realEndPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > realEndPage ? realEndPage : endPage;
		
		//검색했을 경우, 셀렉했을 경우 있으므로 같이 보내준다.
		List<NoticeVO> noticeList = n_dao.getNoticeList(notice_search, select_type, startRow, endRow);
		//날짜에 시간 빼기
		for(NoticeVO notice : noticeList) {
			if(notice.getNotice_date().substring(0, 10).compareTo(now_date.substring(0, 10)) == 0) {
				notice.setNotice_date(notice.getNotice_date().substring(11, 16));
			}else {
				notice.setNotice_date(notice.getNotice_date().substring(0, 10));
			}
		}
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("noticeList", noticeList);
		//검색 한 이후에 결과를 유치한채 페이지가 변환되어야한다. 그래서 검색결과와 셀렉트를 같이 내보내주어 유지시킨다.
		req.setAttribute("notice_search", notice_search);
		req.setAttribute("select_type", select_type);
		forward.setPath("/notice/notice.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}

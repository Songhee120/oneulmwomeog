package com.astral.app.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.ActionForward;


public class NoticeFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		
		switch(command) {
			//공지사항 이동
			case "/notice/NoticeList.no":
				try {
					forward = new NoticeListAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//글쓰기 이동
			case "/notice/NoticeWrite.no":
				forward= new ActionForward();
				forward.setPath("/notice/write.jsp");
				forward.setRedirect(false);
				break;
			//글 작성
			case "/notice/NoticeWriteOk.no":
				try {
					forward = new NoticeWriteOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//글 보기
			case "/notice/NoticeDetail.no":
				try {
					forward = new NoticeDetailAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//글 삭제
			case "/notice/NoticeDelete.no":
				try {
					forward = new NoticeDeleteAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//글 수정 이동
			case "/notice/NoticeModify.no":
				try {
					forward = new NoticeModifyAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//글 수정 완료
			case "/notice/NoticeModifyOk.no":
				try {
					forward = new NoticeModifyOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			default:
				forward = new ActionForward();
				forward.setPath("/error/error.jsp");
				forward.setRedirect(false);
		}
	
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}

package com.astral.app.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.ActionForward;

public class ReviewFrontController extends HttpServlet{
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
		// /astral
		String contextPath = req.getContextPath();
		// /member/MemberLoginOk.me
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		
		
		switch(command) {
			//글쓰기 페이지 이동
			case "/review/ReviewWrite.re":
				try {
					forward = new ReviewWriteAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//글쓰기
			case "/review/ReviewWriteOk.re":
				try {
					forward = new ReviewWriteOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//Best 게시판 불러오기
			case "/review/ReviewBestView.re":
				try {
					forward = new ReviewBestViewAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
				
			//사진 클릭시, myreview.jsp로 이동하는 컨트롤러
			case "/review/ReviewShowOk.re":
				try {
					forward = new ReviewShowOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
				
			case "/review/ReviewHeartOk.re":
				try {
					forward = new ReviewHeartOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
				
			case "/review/ReviewHeartCnt.re":
				try {
					forward = new ReviewHeartCntAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
				
			case "/review/ReviewDeleteOk.re":
				try {
					forward = new ReviewDeleteOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "/review/ReviewModify.re":
				try {
					forward = new ReviewModifyAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "/review/ReviewModifyOk.re":
				try {
					forward = new ReviewModifyOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
	        //New 게시판 불러오기 - jstl
	        case "/review/ReviewNewViewFirst.re":
	            try {
	               forward = new ReviewNewViewFirstOkAction().execute(req, resp);
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	            break;
	         //New 게시판 더 불러오기 - ajax
	         case "/review/ReviewNewViewMore.re":
	            try {
	               forward = new ReviewNewViewMoreOkAction().execute(req, resp);
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	            break;
	         //검색
	         case "/review/ReviewSearch.re":
	            try {
	               forward = new ReviewNewViewMoreOkAction().execute(req, resp);
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	            break;	
	         //뒤로가기
	         case "/review/ReviewReturnHome.re":
	             forward = new ActionForward();
	             forward.setPath("/member/login_index.jsp");
	             forward.setRedirect(false);
	             break;
			default:
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/error/error.jsp");
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

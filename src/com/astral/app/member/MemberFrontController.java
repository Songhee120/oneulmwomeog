package com.astral.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.astral.action.ActionForward;

public class MemberFrontController extends HttpServlet {
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
		// /astral/member/MemberLoginOk.me
		String requestURI = req.getRequestURI();
		// /astral
		String contextPath = req.getContextPath();
		// /member/MemberLoginOk.me
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;

		// 회원가입
		if (command.equals("/member/MemberJoinOk.me")) {
			try {
				forward = new MemberJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//전화번호 전송하기
		} else if (command.equals("/member/MemberSendPhoneNo.me")) {
			try {
				forward = new MemberSendPhoneNoAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 아이디 중복체크
		} else if (command.equals("/member/MemberCheckIdOk.me")) {
			try {
				forward = new MemberCheckIdOk().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 로그인
		} else if (command.equals("/member/MemberLoginOk.me")) {
			try {
				forward = new MemberLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 로그인 페이지 이동
		} else if (command.equals("/member/MemberLogin.me")) {
			forward = new ActionForward();
			forward.setPath("/member/index.jsp");
			forward.setRedirect(false);
			// 로그 아웃
		} else if (command.equals("/member/MemberLogOut.me")) {
			try {
				forward = new MemberLogOutAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 아이디 찾기 이동
		} else if (command.equals("/member/MemberFindId.me")) {
			try {
				forward = new MemberFindIdAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 마이페이지 이동
		} else if (command.equals("/member/MemberMyPage.me")) {
			try {
				forward = new MemberMyPageAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/member/MemberMydetail.me")) {
			try {
				forward = new MemberMyDetailAction().execute(req, resp);
				System.out.println(forward.isRedirect());
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/member/MemberChangeProfileOk.me")) {
			try {
				forward = new MemberChangeProfileOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/member/MemberCheckNickOk.me")) {
			try {
				forward = new MemberCheckNickOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/member/MemberCheckTelOk.me")) {
			try {
				forward = new MemberCheckTelOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/member/MemberCheckEmailOk.me")) {
			try {
				forward = new MemberCheckEmailOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/member/MemberFindPw.me")) {
			try {
				forward = new MemberFindPwAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//비밀번호 변경하기
		} else if (command.equals("/member/MemberChangePw.me")) {
			try {
				forward = new MemberChangePwOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// 메일 보내기
		} else if (command.equals("/member/MemberSendMail.me")) {
			try {
				forward = new MemberSendMailAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/member/MemberDeleteId.me")) {
				try {
					forward = new MemberDeleteIdAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
		} else {
			forward = new ActionForward();
			forward.setPath("/error/error.jsp");
			forward.setRedirect(false);
		}
		// 정보 수정

		// forward에 따라 전송 방식 선택 true:redirect false:forward
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

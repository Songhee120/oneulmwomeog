package com.astral.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.dao.Profile_FilesDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberChangeProfileOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		Profile_FilesDAO f_dao = new Profile_FilesDAO();
		MemberDAO m_dao = new MemberDAO();
		
		int mem_no = m_dao.getMemberNumber(mem_id);
		
		String saveFolder = "E:\\웹 개발\\JSP\\workspace\\astral2\\WebContent\\profile";
		
		int fileSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		if(f_dao.updateFile(mem_no, multi)) {
			out.println("ok");
		}else {
			out.println("not-ok");
		}
		
		return null;
	}

}

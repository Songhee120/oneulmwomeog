package com.astral.app.scrap;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.scrap.dao.ScrapDAO;

public class ScrapDeleteOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      HttpSession session = req.getSession();
      MemberDAO m_dao = new MemberDAO();
      ScrapDAO s_dao = new ScrapDAO();
      
      int mem_no = m_dao.getMemberNumber((String)session.getAttribute("mem_id"));
      int review_no = Integer.parseInt(req.getParameter("review_no"));
      
      s_dao.deleteScrap(mem_no, review_no);
      
      ActionForward forward = new ActionForward();
      
      forward.setRedirect(false);
      forward.setPath("/scrap/ScrapViewFirstOk.sc");
      
      return forward;
   }

}
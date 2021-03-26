package com.astral.app.scrap;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.scrap.dao.ScrapDAO;

public class ScrapOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");

      MemberDAO m_dao = new MemberDAO();
      ScrapDAO s_dao = new ScrapDAO();
      HttpSession session = req.getSession();
      PrintWriter out = resp.getWriter();

      int review_no = Integer.parseInt(req.getParameter("review_no"));
      int mem_no = m_dao.getMemberNumber((String) session.getAttribute("mem_id"));

      int data = s_dao.scrap_check(mem_no, review_no);
      System.out.println("hello:" + review_no);
      System.out.println("hello:" + mem_no);
      
      resp.setCharacterEncoding("text/html;charset=utf-8");

      if (data == 0) {
         System.out.println("찜추가");
         out.println("ok");
         s_dao.addScrap(mem_no, review_no);
      } else {
         System.out.println("찜삭제");
         out.println("nok");
         s_dao.deleteScrap(mem_no, review_no);
      }

      return null;
   }
}
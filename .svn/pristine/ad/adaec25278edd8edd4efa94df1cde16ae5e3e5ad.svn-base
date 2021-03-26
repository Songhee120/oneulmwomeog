package com.astral.app.review;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.review.dao.HeartDAO;

public class ReviewHeartOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      
      HashMap<String, Object> m = new HashMap<>();
      HttpSession session = req.getSession();
      MemberDAO m_dao = new MemberDAO();
      String mem_id = (String)session.getAttribute("mem_id");

      
      //리뷰 작성자의 회원번호
      int review_mem_no = Integer.parseInt(req.getParameter("mem_no"));
      
      //좋아요를 누른 유저의 회원번호
      int mem_no = m_dao.getMemberNumber(mem_id);

      m.put("review_no", req.getParameter("review_no"));
      m.put("mem_no", mem_no);
      
      PrintWriter out = resp.getWriter();
      HeartDAO h_dao = new HeartDAO();
      
      int result = h_dao.heart_check(m);
      int num = 0;
      
      resp.setCharacterEncoding("text/html;charset=utf-8");
      
      if(result == 0) {
          out.println("ok");
          num = 1;         
          h_dao.heart_update(m);         
       }else {
          out.println("nok");
          num = -1;
          h_dao.heart_delete(m);
       }
      h_dao.updateMemberHeart(review_mem_no, num);
      return null;
   }
}
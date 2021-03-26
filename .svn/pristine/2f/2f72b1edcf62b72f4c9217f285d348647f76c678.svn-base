package com.astral.app.scrap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.ReviewVO;
import com.astral.app.scrap.dao.ScrapDAO;
import com.astral.app.scrap.vo.ScrapVO;

public class ScrapViewFirstOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");

      HttpSession session = req.getSession();

      ScrapDAO s_dao = new ScrapDAO();
      MemberDAO m_dao = new MemberDAO();
      ReviewDAO r_dao = new ReviewDAO();
      FilesDAO f_dao = new FilesDAO();
      
      String mem_id = (String)session.getAttribute("mem_id");
      int mem_no = m_dao.getMemberNumber(mem_id);
      
      /*List<ScrapVO> scrapList = s_dao.getScrapList(mem_no);*/
      List<ScrapVO> getScrap = s_dao.getScrap(0, mem_no);
      List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
      List<String> fileList = new ArrayList<String>();

      HashMap<String, Object> scrap = null;
      List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
      
      for (int i = 0; i < getScrap.size(); i++) {
         System.out.println(getScrap.get(i).getScrap_no());
         reviewList.add(r_dao.getAllDetails(getScrap.get(i).getReview_no()));
         fileList.add(f_dao.getFileName(getScrap.get(i).getReview_no()));
         System.out.println("scrapViewFirst들어옴1");
      }

      for (int i = 0; i < reviewList.size(); i++) {
         scrap = new HashMap<>();
         System.out.println("scrapViewFirst들어옴2");
         scrap.put("review_no", reviewList.get(i).getReview_no());
         scrap.put("scrap_no", getScrap.get(i).getScrap_no());
         scrap.put("review_star", reviewList.get(i).getReview_star());
         scrap.put("res_name", reviewList.get(i).getRes_name());
         scrap.put("res_address", reviewList.get(i).getRes_address());
         scrap.put("filename", f_dao.getFileName(reviewList.get(i).getReview_no()));

         list.add(scrap);
      }

      req.setAttribute("list", list);
      
      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/scrap/scrap.jsp");
      return forward;
   }

}
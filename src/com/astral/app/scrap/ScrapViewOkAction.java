package com.astral.app.scrap;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.ReviewVO;
import com.astral.app.scrap.dao.ScrapDAO;
import com.astral.app.scrap.vo.ScrapVO;

public class ScrapViewOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");
      HttpSession session = req.getSession();
      
      JSONObject json_in = null;
      JSONArray json = new JSONArray();
      
      String mem_id = (String)session.getAttribute("mem_id");
      MemberDAO m_dao = new MemberDAO();
      int mem_no = m_dao.getMemberNumber(mem_id);
      int page = Integer.parseInt(req.getParameter("page"));
      boolean deleteScrap = Boolean.parseBoolean(req.getParameter("deleteScrap"));
      
      System.out.println("page:" + page);
      System.out.println("mem_no:" + mem_no);
      
      ScrapDAO s_dao = new ScrapDAO();
      ReviewDAO r_dao = new ReviewDAO();
      FilesDAO f_dao = new FilesDAO();
            
      if(deleteScrap) {
         int review_no = Integer.parseInt(req.getParameter("deleteReview_no"));         
         s_dao.deleteScrap(mem_no, review_no);
      }
      
      /*List<ScrapVO> getScrap = s_dao.getScrap(page);*/
      List<ScrapVO> getScrap = s_dao.getScrap(page, mem_no);
      /*List<ScrapVO> scrapList = s_dao.getScrapList(mem_no);*/
      List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
      List<String> fileList = new ArrayList<String>();
         
      for(int i=0; i<getScrap.size(); i++) {
         System.out.println(getScrap.get(i).getScrap_no());
         reviewList.add(r_dao.getAllDetails(getScrap.get(i).getReview_no()));
         fileList.add(f_dao.getFileName(getScrap.get(i).getReview_no()));         
      }
      
      for (int i = 0; i < reviewList.size(); i++) {
         json_in = new JSONObject();
         json_in.put("scrap_no", getScrap.get(i).getScrap_no());
         json_in.put("review_no", reviewList.get(i).getReview_no());
         json_in.put("review_star", reviewList.get(i).getReview_star());
         json_in.put("res_name", reviewList.get(i).getRes_name());
         json_in.put("res_address", reviewList.get(i).getRes_address());
         json_in.put("filename", f_dao.getFileName(reviewList.get(i).getReview_no()));
         
         json.add(json_in);
      }
            
      resp.setContentType("application/x-json; charset=UTF-8");
      PrintWriter out = resp.getWriter();
      out.print(json.toJSONString());   
      return null;
   }

}
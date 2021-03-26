package com.astral.app.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.ReviewVO;

public class ReviewNewViewFirstOkAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");
      
      ReviewDAO r_dao = new ReviewDAO();
      FilesDAO f_dao = new FilesDAO();
      
      List<ReviewVO> reviewList = null;

      // 검색 & 일반 조회 분기처리
      if (req.getParameter("review_search") != null) {
         // 검색 값, 타입 받아오기
         String review_search = req.getParameter("review_search");
         String select_type = req.getParameter("select_type");
         // 값으로 검색하기
         reviewList = r_dao.search(review_search, select_type, 0);
         // 검색 값 req에 담아주기 (추가 데이터 요청 받으면 필요함)
         req.setAttribute("search_val", review_search);
         req.setAttribute("select_type", select_type);
      } else {
         // 일반 조회
         reviewList = r_dao.getNewReviews(0);
      }
      
      HashMap<String, Object> review = null;
      List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
      
      for(int i=0;i<reviewList.size();i++) {
         review = new HashMap<String, Object>();
         review.put("review_no", reviewList.get(i).getReview_no());
         review.put("review_star", reviewList.get(i).getReview_star());
         review.put("res_name", reviewList.get(i).getRes_name());
         review.put("res_address", reviewList.get(i).getRes_address());
         review.put("filename", f_dao.getFileName(reviewList.get(i).getReview_no()));
         
         list.add(review);
      }
      req.setAttribute("list", list);
      
      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/review/new_review.jsp");
      return forward;
   }

}
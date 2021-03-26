package com.astral.app.review;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.review.dao.FilesDAO;
import com.astral.app.review.dao.HeartDAO;
import com.astral.app.review.dao.ReviewDAO;
import com.astral.app.review.vo.FilesVO;
import com.astral.app.scrap.dao.ScrapDAO;

public class ReviewDeleteOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	   
	  HttpSession session = req.getSession();

      ReviewDAO r_dao = new ReviewDAO();
      FilesDAO f_dao = new FilesDAO();
      ScrapDAO s_dao = new ScrapDAO();
      HeartDAO h_dao = new HeartDAO();
      MemberDAO m_dao = new MemberDAO();
      ActionForward forward = new ActionForward();
      
      String saveFolder = "E:\\웹 개발\\JSP\\workspace\\astral\\WebContent\\upload";
      
      String mem_id = (String)session.getAttribute("mem_id");
      int review_no = Integer.parseInt(req.getParameter("review_no"));
      int mem_no = m_dao.getMemberNumber(mem_id);

      HashMap<String, Object> map = new HashMap<>();
      map.put("review_no", review_no);
      map.put("mem_no", mem_no);

      for (FilesVO file : f_dao.getDetail(review_no)) {
          File f = new File(saveFolder + "\\" + file.getFile_name());
          
          if(!(file.getFile_name().equals("default_food.jpg"))) {            
             if(f.exists()) {
                f.delete();
             }
          }
       }
 
      Cookie[] cookies = req.getCookies();
      
      //삭제한 리뷰의 쿠키 삭제
      if(cookies != null && cookies.length != 0) {
    	  for(Cookie cookie : cookies) {
    		  if(cookie.getName().equals("cookie" + review_no)) {
    			  	//쿠키의 지속시간을 0으로 바꿈으로서 제거
    			  	cookie.setMaxAge(0);
    			  	//서버에 추가 요청
    			  	resp.addCookie(cookie);
    		  }
    	  }
      }

      //회원의 리뷰 수 1 감소
      int review_cnt = -1;

      
      f_dao.deleteFiles(review_no);
      s_dao.deleteOnlyScrap(review_no);
      h_dao.deleteOnlyheart(review_no);
      r_dao.updateMemberReview(mem_no, review_cnt);
      r_dao.deleteReview(review_no);
      
      forward.setRedirect(true);
      forward.setPath(req.getContextPath() + "/member/login_index.jsp#post");
      
      return forward;
   }
}
package com.astral.app.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.astral.action.Action;
import com.astral.action.ActionForward;
import com.astral.app.member.dao.MemberDAO;
import com.astral.app.member.dao.Profile_FilesDAO;
import com.astral.app.member.dao.RankDAO;
import com.astral.app.member.vo.MemberVO;
import com.astral.app.member.vo.Profile_FilesVO;

public class MemberMyPageAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");
      
      HttpSession session = req.getSession();
      JSONObject obj = new JSONObject();
      
      boolean rank_change = false;
   
      MemberDAO m_dao = new MemberDAO();
      MemberVO m_vo = m_dao.myInfo((String)session.getAttribute("mem_id"));
      RankDAO rank_dao = new RankDAO();
      
      //회원번호
      int mem_no = m_vo.getMem_no();
      
      //기존 회원의 랭크
       int mem_rank = m_dao.getMemberRank(mem_no);
       System.out.println("기존 회원의 랭크 : " + mem_rank);
       
       //회원의 리뷰 수
       int mem_review_cnt = m_dao.getMemberReviewCnt(mem_no);
       //랭크 테이블에서 회원의 리뷰 수보다 랭크 테이블의 기준 리뷰 수가 더 작은 행의 개수를 불러온다.
       int rank_review = rank_dao.rank_review(mem_review_cnt);
   
       //회원의 좋아요 수
       int mem_heart = m_dao.getMemberHeart(mem_no);
       //랭크 테이블에서 회원의 좋아요 수보다 랭크 테이블의 기준 좋아요 수가 더 작은 행의 개수를 불러온다.
       int rank_heart = rank_dao.rank_heart(mem_heart);
      
       //리뷰 수 또는 좋아요 변화 시 회원의 랭크
        int new_mem_rank = rank_review >= rank_heart ? rank_heart : rank_review;
        
        //window.onload로 인해 마이페이지 버튼을 누르지 않고 뒤로가기로도 이 서블릿에 들르기 때문에 등급의 변화가 있을 때 2번 동시에
        //접근하기 때문에 rank_change가 false로 전달되기 때문에 마이페이지 버튼을 눌러서 접근할 때만 등급의 변화가 있을 때 
        //rank_change를 true로 하게끔한다.
        if(req.getParameter("check")!=null) {
           //기존 회원의 랭크와 좋아요 변화 시 회원의 랭크가 일치하지 않는 경우 회원의 랭크를 업데이트 한다.
           if(mem_rank != new_mem_rank) {
              rank_dao.mem_rank_update(mem_no, new_mem_rank); 
              rank_change = true;
           }
        }
        
        //회원의 랭크
        String mem_rank_name = rank_dao.getRankName(new_mem_rank);
                         
        Profile_FilesDAO f_dao = new Profile_FilesDAO();
        Profile_FilesVO f_vo = new Profile_FilesVO();
      
        //랭크 파일이름
        String rank_file_name = rank_dao.getFileName(new_mem_rank);
       
        //프로필 파일 이름
        String profile_file_name = f_dao.getFileName(m_dao.getMemberNumber(m_vo.getMem_id()));
            
        if(m_vo != null) {
	         obj.put("mem_profile", profile_file_name);
	         obj.put("mem_name", m_vo.getMem_name());
	         obj.put("mem_nickname", m_vo.getMem_nickname());
	         obj.put("mem_point", m_vo.getMem_point());
	         obj.put("mem_rank_file", rank_file_name);
	         obj.put("mem_rank_change", rank_change);
	         obj.put("mem_rank_name", mem_rank_name);
	         obj.put("mem_review_cnt", m_vo.getMem_review_cnt());
	         obj.put("mem_heart", m_vo.getMem_heart());
	       
	         resp.setContentType("application/x-json; charset=UTF-8");
	         resp.getWriter().print(obj);
        } 
      
      return null;
   }
}
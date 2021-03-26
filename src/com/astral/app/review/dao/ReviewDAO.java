package com.astral.app.review.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.review.vo.ReviewVO;
import com.astral.mybatis.config.SqlMapConfig;

public class ReviewDAO {
	private static final int KEY = 3;

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;

	public ReviewDAO() {
		// 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
		sql_session = sessionf.openSession(true);
	}
	
	//회원번호
	public int memberSeq(String mem_id) {
		return sql_session.selectOne("review.memberSeq", mem_id);
	}
	//게시글 번호
	public int getReviewSeq() {
		return sql_session.selectOne("review.getSeq");
	}
	//게시글 추가
	public boolean insertReview(ReviewVO r_vo) {
		return sql_session.insert("review.insertReview", r_vo) == 1;
	}
	//베스트 게시글 가져오기
	public List<ReviewVO> getBestReviews(){
		return sql_session.selectList("review.getBestReviews");
	}
	
	//모든 게시글(정보들) 가져오기
	public ReviewVO getAllDetails(int review_no) {
		return sql_session.selectOne("review.getAllDetails", review_no);
	}
	
	//사용자 닉네임 가져오기(review_no로)
	public String getMemberNickName(int review_no) {
		return sql_session.selectOne("review.getMemberNickName", review_no);
	}
	
	//음식점 주소 (띄워쓰기 2번째 문자열까지)
	public String getResAddress(int review_no) {
		return sql_session.selectOne("review.getResAddress", review_no);
	}
	
	//조회수
	public void updateViews(int review_no) {
		sql_session.update("review.updateViews", review_no);
	}
	
	//게시글 삭제
	public void deleteReview(int review_no) {
		sql_session.delete("review.deleteReview", review_no);
	}
	
	//게시글 수정
	public void modifyReview(ReviewVO r_vo) {
		sql_session.update("review.modifyReview", r_vo);
	}
	
    // 뉴 게시글 가져오기
    public List<ReviewVO> getNewReviews(int page) {
       HashMap<String, Integer> pageMap = cntRow(page);
       return sql_session.selectList("review.getNewReviews", pageMap);
    } 

    // 리뷰 전체 개수
    public int getReviewCnt() {
       return sql_session.selectOne("review.getReviewCnt");
    }

    // 리뷰 검색
    public List<ReviewVO> search(String review_search, String select_type, int page) {
       List<ReviewVO> result = new ArrayList<ReviewVO>();
       HashMap<String, Object> param = new HashMap<String, Object>(); 
       //review_search, startRow, endRow 
      
       int startRow = cntRow(page).get("startRow");
       int endRow = cntRow(page).get("endRow");
       param.put("review_search", review_search);
       param.put("startRow", startRow);
       param.put("endRow", endRow);

       switch (select_type) {
      
       // 상호명 검색
       case "res_name": 
          result = sql_session.selectList("review.searchName", param);
          break;

       // 지역 검색
       case "res_address":
          result = sql_session.selectList("review.searchAddress", param);
          break;
       }
       return result;
    }

    // startRow, endRow 계산하기
    public HashMap<String, Integer> cntRow(int page) {
       int startRow = page * 12 + 1;
       int endRow = page * 12 + 12;

       HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
       pageMap.put("startRow", startRow);
       pageMap.put("endRow", endRow);

       return pageMap;
    } 
    
    //작성자 회원번호
    public int getMemberNumber(int review_no) {
       return sql_session.selectOne("review.getMemberNumber", review_no);
    }
    
    //작성자 게시글 수 업데이트
    public void updateMemberReview(int mem_no, int review_cnt) {
       HashMap<String, Integer> map = new HashMap<>();
       map.put("mem_no", mem_no);
       map.put("review_cnt", review_cnt);
       
       sql_session.update("review.updateMemberReview", map);
    }
    
    // 리뷰목록
    public List<ReviewVO> getReviewConfirm(int mem_no, int startRow, int endRow) {
          List<ReviewVO> result = new ArrayList<ReviewVO>();
          HashMap<String, Object> param = new HashMap<String, Object>(); 
          //startRow, endRow 
          
          param.put("startRow", startRow);
          param.put("endRow", endRow);
          param.put("mem_no", mem_no);

          return sql_session.selectList("review.getReviewConfirm", param);
    }

	// 게시물 토탈카운트
	public int getConfirmCnt(int mem_no) {
		return sql_session.selectOne("review.getConfirmCnt", mem_no);
	}
}

package com.astral.app.review.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.mybatis.config.SqlMapConfig;

public class HeartDAO {
   private static final int KEY = 3;

   SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
   SqlSession sql_session;

   public HeartDAO() {
      // 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
      sql_session = sessionf.openSession(true);
   }
   
   public int heart_check(HashMap<String, Object> m) {
      return sql_session.selectOne("heart.heart_check", m);
   }
   
   public void heart_update(HashMap<String, Object> m) {
      sql_session.insert("heart.heart_update", m);
   }
   
   public void heart_delete(HashMap<String, Object> m) {
      sql_session.delete("heart.heart_delete", m);
   }
   
   public int heart_cnt(int review_no) {
      return sql_session.selectOne("heart.heart_cnt", review_no);
   }
   
   public void updateReviewHeart(int review_no) {
      sql_session.update("heart.updateReviewHeart", review_no);
   }
   
   public void deleteOnlyheart(int review_no) {
      sql_session.delete("heart.deleteOnlyheart", review_no);
   }
   
   //회원 하트 수 갱신
   public void updateMemberHeart(int review_mem_no, int num) {
      HashMap<String, Integer> mem_heart = new HashMap<>();
      mem_heart.put("review_mem_no", review_mem_no);
      mem_heart.put("num", num);
      sql_session.update("heart.updateMemberHeart", mem_heart);
   }
   
}
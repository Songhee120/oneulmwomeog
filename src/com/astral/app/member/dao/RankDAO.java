package com.astral.app.member.dao;

import java.util.Enumeration;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.member.vo.Profile_FilesVO;
import com.astral.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class RankDAO {
   SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
   SqlSession sql_session;

   public RankDAO() {
      // 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
      sql_session = sessionf.openSession(true);
   }
   
   //랭크 테이블에서 회원의 리뷰 수보다 랭크 테이블의 기준 리뷰 수가 더 작은 행의 개수
   public int rank_review(int mem_review_cnt) {
      return sql_session.selectOne("rank.rank_review", mem_review_cnt);
   }
   
   //랭크 테이블에서 회원의 좋아요 수보다 랭크 테이블의 기준 좋아요 수가 더 작은 행의 개수
   public int rank_heart(int mem_heart) {
      return sql_session.selectOne("rank.rank_heart", mem_heart);
   }
   
   //회원 랭크 업데이트 
   public void mem_rank_update(int mem_no, int new_mem_rank) {
      HashMap<String, Integer> mem = new HashMap<>();
      mem.put("mem_no", mem_no);
      mem.put("new_mem_rank", new_mem_rank);
      sql_session.update("rank.mem_rank_update", mem);
   }
   
   //랭크 파일
   public String getFileName(int new_mem_rank) {
      return sql_session.selectOne("rank.getFileName", new_mem_rank);
   }
   
   //등급 이름
   public String getRankName(int new_mem_rank) {
      return sql_session.selectOne("rank.getRankName", new_mem_rank);
   }
}
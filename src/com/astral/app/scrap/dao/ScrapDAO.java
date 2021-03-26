package com.astral.app.scrap.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.scrap.vo.ScrapVO;
import com.astral.mybatis.config.SqlMapConfig;

public class ScrapDAO {
   private static final int KEY = 3;

   SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
   SqlSession sql_session;

   public ScrapDAO() {
      // 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
      sql_session = sessionf.openSession(true);
   }
   
   // 찜목록 추가
   public void addScrap(int mem_no, int review_no) {
      HashMap<String, Integer> scrapMap = new HashMap<String, Integer>();
      scrapMap.put("mem_no", mem_no);
      scrapMap.put("review_no", review_no);

      sql_session.insert("scrap.addScrap", scrapMap);
   }

   // 찜목록 삭제
   public void deleteScrap(int mem_no, int review_no) {
      HashMap<String, Integer> scrapMap = new HashMap<String, Integer>();
      scrapMap.put("mem_no", mem_no);
      scrapMap.put("review_no", review_no);

      sql_session.delete("scrap.deleteScrap", scrapMap);
   }

   public int scrap_check(int mem_no, int review_no) {
      HashMap<String, Integer> scrapMap = new HashMap<>();
      scrapMap.put("mem_no", mem_no);
      scrapMap.put("review_no", review_no);
      return sql_session.selectOne("scrap.scrap_check", scrapMap);
   }

   public void deleteOnlyScrap(int review_no) {
      sql_session.delete("scrap.deleteOnlyScrap", review_no);
   }

   // 찜목록 리스트
   public List<ScrapVO> getScrapList(int mem_no) {
      return sql_session.selectList("scrap.getScrapList", mem_no);
   }
   
   // startRow, endRow 계산하기
   public HashMap<String, Integer> cntRow(int page, int mem_no) {
      int startRow = page * 3 + 1;
      int endRow = page * 3 + 3;
      
      HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
      pageMap.put("startRow", startRow);
      pageMap.put("endRow", endRow);
      pageMap.put("mem_no", mem_no);
      
      System.out.println("pageMap:" + pageMap);
      return pageMap;
   }
   
   public List<ScrapVO> getScrap(int page, int mem_no){
      HashMap<String, Integer> pageMap = cntRow(page, mem_no);
      
      System.out.println("getScrap:" + pageMap);
      return sql_session.selectList("scrap.getScrap", pageMap);
   }

}
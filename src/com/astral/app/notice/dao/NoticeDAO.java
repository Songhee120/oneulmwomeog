package com.astral.app.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.notice.vo.NoticeVO;
import com.astral.mybatis.config.SqlMapConfig;

public class NoticeDAO {
	private static final int KEY = 3;

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;

	public NoticeDAO() {
		// 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
		sql_session = sessionf.openSession(true);
	}
	//공지사항 전체 개수
	public int getTotalCnt(String notice_search, int select_type) {
		int result = 0;
		String type = null;
		Map<String, String> notice = new HashMap<>();
		notice.put("notice_search", notice_search);
		switch(select_type) {
		//선택 없을 때
		case 0:
			//단순한 페이지 이동
			if(notice_search == null) {
				result =  sql_session.selectOne("notice.getTotalCnt");
			//단순 검색
			}else {
				result = sql_session.selectOne("notice.getSTotalCnt", notice);			
			}
			break;
		//이벤트
		case 1:
			//이벤트만 검색
			type = "이벤트";
			if(notice_search == null) {
				result =  sql_session.selectOne("notice.getSelectTotalCnt", type);
			}else {
				notice.put("type", type);
				result = sql_session.selectOne("notice.getSSTotalCnt", notice);			
			}
			break;
		//서비스
		case 2:
			//서비스만 검색
			type = "서비스";
			if(notice_search == null) {
				result =  sql_session.selectOne("notice.getSelectTotalCnt", type);
			}else {
				notice.put("type", type);
				result = sql_session.selectOne("notice.getSSTotalCnt", notice);			
			}
			break;
		//오류
		case 3:
			//오류만 검색
			type = "에러";
			if(notice_search == null) {
				result =  sql_session.selectOne("notice.getSelectTotalCnt", type);
			}else {
				notice.put("type", type);
				result = sql_session.selectOne("notice.getSSTotalCnt", notice);			
			}
			break;
		}
		
		return result;
	}
	
	//공지사항 리스트
	public List<NoticeVO> getNoticeList(String notice_search, int select_type, int startRow, int endRow){
		Map<String, Object> notice = new HashMap<String, Object>();
		//리스트를 가져오기에 기본
		notice.put("startRow", startRow);
		notice.put("endRow", endRow);
		List<NoticeVO> notice_list = null;
		String type = null;
		
		if(notice_search != null) {
			notice.put("notice_search", notice_search);
		}
		
		switch(select_type) {
		//선택 없을 때
		case 0:
			//단순한 페이지 리스트
			if(notice_search == null) {
				notice_list =  sql_session.selectList("notice.getNoticeList", notice);
			//단순 검색 리스트
			}else {
				notice_list = sql_session.selectList("notice.getSNoticeList", notice);			
			}
			break;
		//이벤트
		case 1:
			//이벤트만 검색
			type = "이벤트";
			notice.put("type", type);
			if(notice_search == null) {
				notice_list =  sql_session.selectList("notice.getSelectNoticeList", notice);
			}else {
				notice_list = sql_session.selectList("notice.getSSNoticeList", notice);			
			}
			break;
		//서비스
		case 2:
			//서비스만 검색
			type = "서비스";
			notice.put("type", type);
			if(notice_search == null) {
				notice_list =  sql_session.selectList("notice.getSelectNoticeList", notice);
			}else {
				notice_list = sql_session.selectList("notice.getSSNoticeList", notice);			
			}
			break;
		//오류
		case 3:
			//오류만 검색
			type = "에러";
			notice.put("type", type);
			if(notice_search == null) {
				notice_list =  sql_session.selectList("notice.getSelectNoticeList", notice);
			}else {
				notice_list = sql_session.selectList("notice.getSSNoticeList", notice);			
			}
			break;
		}
		
		return notice_list;
		
		
	}
	//글 쓰기
	public void noticeWrite(NoticeVO n_vo) {
		sql_session.insert("notice.noticeWrite", n_vo);
	}
	
	//글 삭제
	public void noticeDelete(int notice_no) {
		sql_session.delete("notice.noticeDelete", notice_no);
	}
	
	//공지사항 자세히 보기
	public NoticeVO noticeDetail(int notice_no) {
		return sql_session.selectOne("notice.noticeDetail", notice_no);
	}
	
	//글 수정
	public void noticeModify(NoticeVO n_vo) {
		sql_session.update("notice.noticeModify", n_vo);
	}
	
}

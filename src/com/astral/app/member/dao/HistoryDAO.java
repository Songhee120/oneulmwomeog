package com.astral.app.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.member.vo.HistoryVO;
import com.astral.mybatis.config.SqlMapConfig;

public class HistoryDAO implements Runnable{
	private static final int KEY = 3;
	public static boolean stop;
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;

	public HistoryDAO() {
		// 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
		sql_session = sessionf.openSession(true);
		this.stop = false;
	}
	//회원에 맞는 히스토리 가져오기
	public List<HistoryVO> history_list(int mem_no){
		return sql_session.selectList("history.history_list", mem_no);
	}
	//회원이 선택한 히스토리 가져오기
	public HistoryVO selectHistory(int history_no) {
		return sql_session.selectOne("history.selectHistory", history_no);
	}
	//회원이 선택한 음식점 정보 넣기
	public void insertHistory(HistoryVO h_vo) {
		sql_session.insert("history.insertHistory", h_vo);
	}
	//한 회원의 히스토리 개수 가져오기
	public List<Integer> allHistory(int mem_no) {
		return sql_session.selectList("history.allHistory", mem_no);
	}
	//데이터가 10개가 넘을 시 오래된 데이터 삭제
	public void deleteHistory(int history_no) {
		sql_session.delete("history.deleteHistory", history_no);
	}
	
	
	@Override
	public void run() {
		int mem_no = Integer.parseInt(Thread.currentThread().getName());
		int limit = 7;
		
		while(true) {
			//회원번호를 통해 보유 historylist를 가져온다.
			List<HistoryVO> h_vo = history_list(mem_no);			
			//for문을 돌려
			for(HistoryVO h : h_vo) {
				//분으로 계산된 값을 1440으로 나누어 날짜로 변환한다.
				String authority_date = h.getHistory_date();
				double past_time = (double)sql_session.selectOne("authority.timeCheck", authority_date) / 1440;
				//삭제
				//7일이상 보관했다면 삭제시킨다.
				if(past_time >= limit) {
					sql_session.delete("history.deleteHistory", h.getHistory_no());
				}
			}
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				break;
			}	
		}
	}
	
	public void threadStop(boolean stop) {
		this.stop = stop;
	}
}

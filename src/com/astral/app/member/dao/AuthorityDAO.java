package com.astral.app.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.member.vo.AuthorityVO;
import com.astral.mybatis.config.SqlMapConfig;

import oracle.jdbc.aq.AQNotificationListener;

public class AuthorityDAO {
	private static final int KEY = 3;

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;

	public AuthorityDAO() {
		// 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
		sql_session = sessionf.openSession(true);
	}
	//회원 여부 확인
	public AuthorityVO mem_check(int mem_no) {
		return sql_session.selectOne("authority.mem_check", mem_no);
	}
	//시간 확인
	public double timeCheck(String authority_date) {
		return sql_session.selectOne("authority.timeCheck", authority_date);
	}
	//회원 사용 불가
	public void insertAuthority(int mem_no) {
		sql_session.insert("authority.insertAuthority", mem_no);
	}
	//회원 사용 가능
	public void deleteAuthority(int mem_no) {
		sql_session.delete("authority.deleteAuthority", mem_no);
	}
	
}

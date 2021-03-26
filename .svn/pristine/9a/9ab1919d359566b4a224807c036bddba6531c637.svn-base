package com.astral.app.food.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.member.vo.MemberVO;
import com.astral.mybatis.config.SqlMapConfig;

public class FoodDAO {
	private static final int KEY = 3;

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;

	public FoodDAO() {
		// 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
		sql_session = sessionf.openSession(true);
	}
	
	public List<String> getFoodList(int ppl_count, int price, int starv_level, int time) {
		HashMap<String, Integer> select = new HashMap<>();
		List<String> foodList = new ArrayList<String>();
		select.put("time", time);
		select.put("ppl_count", ppl_count);
		select.put("price", price);
		select.put("starv_level", starv_level);
		
		return sql_session.selectList("food.selectFood", select);
	}
}

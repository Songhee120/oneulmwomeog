package com.astral.app.member.dao;

import java.util.Enumeration;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.astral.app.member.vo.Profile_FilesVO;
import com.astral.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class Profile_FilesDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;

	public Profile_FilesDAO() {
		// 세션 팩토리로 세션을 열어주고 모든 쿼리문은 auto 커밋으로 설정
		sql_session = sessionf.openSession(true);
	}
	
	public void insertFile(Profile_FilesVO f_vo) {
		sql_session.insert("profile_files.insertFile", f_vo);
	}
	
	public String getFileName(int mem_no) {
		return sql_session.selectOne("profile_files.getFileName", mem_no);
	}
	
	public boolean updateFile(int mem_no, MultipartRequest multi) {
		Enumeration<String> files = multi.getFileNames();
		
		Profile_FilesVO f_vo = new Profile_FilesVO();
		f_vo.setMem_no(mem_no);
		
		files.hasMoreElements();
		
		String data = files.nextElement();
		
		String systemName = multi.getFilesystemName(data);
		
		f_vo.setProfile_file_name(systemName);
		return sql_session.update("profile_files.updateFile", f_vo) == 1;
	}
}

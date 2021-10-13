package com.jcpdev.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Member;
import com.jcpdev.mybatis.SqlSessionBean;

public class MemberDao {
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	private static MemberDao dao = new MemberDao();

	private MemberDao() {
		
	}
	public static MemberDao getInstance() {
		return dao;
	}
	
	//회원가입 데이터 추가
	public void insert(Member dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("Member.insert", dto);
		mapper.commit();
		mapper.close();
	}
	//로그인
	public Member login(Map<String,String> map) {
		Member result = null;
		SqlSession mapper = sqlFactory.openSession();
		result = mapper.selectOne("Member.loginCheck", map);
		mapper.close();
		return result;
	}
	
	public Member passwordCheck(Map<String,Object> map) {
		SqlSession mapper = sqlFactory.openSession();
		Member dto = mapper.selectOne("passwordCheck",map);
		mapper.close();
		return dto;
	}
	
}

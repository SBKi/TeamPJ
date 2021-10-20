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

	// 회원 가입
	public void insert(Member dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("Member.insert", dto);
		mapper.commit();
		mapper.close();
	}

	// 로그인
	public Member login(Map<String, String> map) {
		Member result = null;
		SqlSession mapper = sqlFactory.openSession();
		result = mapper.selectOne("Member.loginCheck", map);
		mapper.close();
		return result;
	}

	// 회원가입 완료 화면 + @
	public Member getInfo(String id) {
		SqlSession mapper = sqlFactory.openSession();
		Member user = mapper.selectOne("getInfo", id);
		mapper.close();
		return user;
	}

	//
	public Member passwordCheck(Map<String, Object> map) {
		SqlSession mapper = sqlFactory.openSession();
		Member dto = mapper.selectOne("passwordCheck", map);
		mapper.close();
		return dto;
	}

	public Member idCheck(String id) {
		SqlSession mapper = sqlFactory.openSession();
		Member dto = mapper.selectOne("Member.idCheck", id);
		mapper.close();
		return dto;
	}

	public Member findId(Map<String, String> map) {
		Member result = null;
		SqlSession mapper = sqlFactory.openSession();
		result = mapper.selectOne("Member.findId", map);
		mapper.close();
		return result;
	}

	public Member findPassword(Map<String, String> map) {
		Member result = null;
		SqlSession mapper = sqlFactory.openSession();
		result = mapper.selectOne("Member.findPassWord", map);
		mapper.close();
		return result;
	}

	public void update_password(Map<String, String> map) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("Member.update_password", map);
		mapper.commit();
		mapper.close();
	}

	public void update_myprofile(Member dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("Member.update_myprofile", dto);
		mapper.commit();
		mapper.close();
	}

}

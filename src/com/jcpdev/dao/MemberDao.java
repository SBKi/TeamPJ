package com.jcpdev.dao;

import java.util.List;
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

	// �쉶�썝媛��엯 �뜲�씠�꽣 異붽�
	public void insert(Member dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("Member.insert", dto);
		mapper.commit();
		mapper.close();
	}

	// 濡쒓렇�씤
	public Member login(Map<String, String> map) {
		Member result = null;
		SqlSession mapper = sqlFactory.openSession();
		result = mapper.selectOne("Member.loginCheck", map);
		mapper.close();
		return result;
	}

	public Member passwordCheck(Map<String, Object> map) {
		SqlSession mapper = sqlFactory.openSession();
		Member dto = mapper.selectOne("passwordCheck", map);
		mapper.close();
		return dto;
	}

	public Member getInfo(String id) {
		SqlSession mapper = sqlFactory.openSession();
		Member user = mapper.selectOne("getInfo", id);
		mapper.close();
		return user;
	}

}

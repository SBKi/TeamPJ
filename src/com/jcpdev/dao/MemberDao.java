package com.jcpdev.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Member;
import com.jcpdev.dto.NavCnt;
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

	public NavCnt navCntUpdate(String id) {
		String mail_postid = id;
		NavCnt navCnt = new NavCnt();
		SqlSession mapper = sqlFactory.openSession();
		navCnt.setProduct(mapper.selectOne("product.getMyListCnt", id));
		navCnt.setSell(mapper.selectOne("product.getMySoldListCnt", id));
		navCnt.setBuy(mapper.selectOne("product.getMyBuyListCnt", id));
		navCnt.setLike(mapper.selectOne("Favorites.getFavListCnt", id));
		navCnt.setMail(mapper.selectOne("MailSpace.countMails", mail_postid));
		mapper.close();
		return navCnt;
	}

	// 회원가입 완료 화면 + @
	public Member getInfo(String id) {
		SqlSession mapper = sqlFactory.openSession();
		Member user = mapper.selectOne("getInfo", id);
		mapper.close();
		return user;
	}

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

	public int update_member_status(Member dto) {
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.update("Member.update_member_status", dto);
		mapper.commit();
		mapper.close();
		return result;
	}

	public int admin_cnt_ing() { // 활동중인 회원 cnt
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.selectOne("Member.admin_cnt_ing");
		mapper.close();
		return result;
	}

	public int admin_cnt_done() { // 탈퇴 회원 cnt
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.selectOne("Member.admin_cnt_done");
		mapper.close();
		return result;
	}

	public void delete_member(String member_id) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("Member.delete_member", member_id);
		mapper.commit();
		mapper.close();
	}

	public void recover_member(String member_id) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("Member.recover_member", member_id);
		mapper.commit();
		mapper.close();
	}

	public List<Member> getMemberList() {
		List<Member> list = null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("Member.getMemberList");
		 mapper.close();
		return list;
	}

	public List<Member> getWithdrawalMemberList() {
		List<Member> list = null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("Member.getWithdrawalMemberList");
		 mapper.close();
		return list;
	}
}
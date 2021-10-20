package com.jcpdev.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Mail;
import com.jcpdev.mybatis.SqlSessionBean;

public class MailDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static MailDao dao = new MailDao();

	private MailDao() {
	}

	public static MailDao getInstance() {
		return dao;
	}

	public void insert(Mail dto) { // 쪽지 보내기
		SqlSession mapper = factory.openSession();
		mapper.insert("MailSpace.insert", dto);
		mapper.commit();
		mapper.close();
	}

	public List<Mail> getRoomList(String id) {
		List<Mail> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("MailSpace.getRoomList", id);
		mapper.commit();
		return list;
	}

	public List<Mail> getMailList(String mail_room) {
		List<Mail> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("MailSpace.getMailList", mail_room);
		mapper.close();
		return list;
	}

	public int RoomCheck(String mail_room) {
		List<Mail> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("MailSpace.RoomCheck", mail_room);
		mapper.close();
		return list.size();
	}

	public List<Mail> sendMails(String mail_sendid) { // 보낸 쪽지함
		List<Mail> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("MailSpace.sendMails", mail_sendid);
		mapper.close();
		return list;
	}

	public List<Mail> postMails(String mail_postid) { // 받은 쪽지함
		List<Mail> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("MailSpace.postMails", mail_postid);
		mapper.close();
		return list;
	}

	public int countMails(int mail_postid) {
		int cnt = 0;
		SqlSession mapper = factory.openSession();
		cnt = mapper.selectOne("MailSpace.countMails");
		mapper.close();
		return cnt;
	}

	public void delete(int mail_no) { // 쪽지 삭제
		SqlSession mapper = factory.openSession();
		mapper.delete("MailSpace.delete", mail_no);
		mapper.commit();
		mapper.close();
	}

}

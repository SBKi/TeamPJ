package com.jcpdev.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Category;
import com.jcpdev.mybatis.SqlSessionBean;

public class CategoryDao {
	private static CategoryDao dao = new CategoryDao();
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();

	private CategoryDao() {
	}

	public static CategoryDao getInstance() {
		return dao;
	}

	public int admin_cnt_done() {
		SqlSession mapper = sqlFactory.openSession();
		int result = mapper.selectOne("Category.getCnt");
		mapper.close();
		return result;
	}

	public List<Category> getAll() {
		List<Category> list = null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("Category.getAll");
		mapper.close();
		return list;
	}

	public void delte(int no) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.delete("Category.delete", no);
		mapper.commit();
		mapper.close();
	}

	public void insert(Category vo) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("Category.insert", vo);
		mapper.commit();
		mapper.close();
	}

	public int category_check(int category_no) {
		SqlSession mapper = sqlFactory.openSession();
		int result = 0;
		result = mapper.selectOne("Category.category_check", category_no);
		mapper.close();
		return result;
	}

	public int category_name_check(String category_name) {
		SqlSession mapper = sqlFactory.openSession();
		int result = 0;
		result = mapper.selectOne("Category.category_name_check", category_name);
		mapper.close();
		return result;
	}

}

package com.jcpdev.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.mybatis.SqlSessionBean;

public class CategoryDao {
	private static CategoryDao dao = new CategoryDao();
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();

	private CategoryDao() { }
	public static CategoryDao getInstance() {
		return dao;
	}
}

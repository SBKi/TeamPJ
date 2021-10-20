package com.jcpdev.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.mybatis.SqlSessionBean;

public class FavoritesDao {
	private static FavoritesDao dao = new FavoritesDao();
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();

	private FavoritesDao() { }
	public static FavoritesDao getInstance() {
		return dao;
	}
}

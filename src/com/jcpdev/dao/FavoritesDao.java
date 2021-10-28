package com.jcpdev.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Favorites;
import com.jcpdev.mybatis.SqlSessionBean;

public class FavoritesDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static FavoritesDao dao = new FavoritesDao();

	private FavoritesDao() {
	}

	public static FavoritesDao getInstance() {
		return dao;
	}

	public List<Favorites> getFavListId(int product_no) {
		List<Favorites> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("Favorites.getFavListId", product_no);
		mapper.close();
		return list;
	}

	public List<Favorites> getFavListPd(String favorites_member_id) {
		List<Favorites> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("Favorites.getFavListPd", favorites_member_id);
		mapper.close();
		return list;
	}

	public void insert(Favorites fav) { // 관심등록
		SqlSession mapper = factory.openSession();
		mapper.insert("Favorites.insert", fav);
		mapper.commit();
		mapper.close();
	}

	public void delete(Favorites fav) { // 관심등록 삭제
		SqlSession mapper = factory.openSession();
		mapper.delete("Favorites.delete", fav);
		mapper.commit();
		mapper.close();
	}

	public void deleteDone(int favorites_product_no) {
		SqlSession mapper = factory.openSession();
		mapper.delete("Favorites.deleteDone", favorites_product_no);
		mapper.commit();
		mapper.close();
	}

}
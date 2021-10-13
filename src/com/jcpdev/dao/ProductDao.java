package com.jcpdev.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Product;
import com.jcpdev.mybatis.SqlSessionBean;

public class ProductDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static ProductDao dao = new ProductDao();
	
	private ProductDao() { }
	public static ProductDao getInstance() {
		return dao;
	}

	public List<Product> getList(Map<String, Integer> map){   // 전체 리스트 출력
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getList",map);
		mapper.close();
		return list;
	}
	
	
	public Product getOne(int idx) {	// 상풍 상세
		SqlSession mapper = factory.openSession();
		Product dto = mapper.selectOne("product.getOne", idx);  
		mapper.close();
		return dto;
	}
	
	public int getCount() {	// 관심 갯수
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("product.getCount");  
		mapper.close();     
		return cnt;
	}
	
	public List<Product> getBuy(Map<String, Integer> map){   // 구매내역 리스트 출력
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getBuy",map);
		mapper.close();
		return list;
	}
	
	public List<Product> getSell(Map<String, Integer> map){   // 판매내역 리스트 출력
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getSell",map);
		mapper.close();
		return list;
	}
	
	public void insert(Product dto) { // 상품 등록
		SqlSession mapper = factory.openSession();
		mapper.insert("product.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Product dto) { // 상품 수정
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update_like(Product dto) { // 즐겨찾기 추가
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update_like",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void delete_like(Product dto) { // 즐겨찾기 삭제
		SqlSession mapper = factory.openSession();
		mapper.insert("product.delete_like",dto);
		mapper.commit();
		mapper.close();
	}
	
	public List<Product> getLike(Map<String, Integer> map){   // 즐겨찾기 리스트 출력
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getLike",map);
		mapper.close();
		return list;
	}
	
	public int delete(Map<String, Object> map) { // 글 삭제
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("product.delete", map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public void readCount(int idx) {	// 댓글 갯수
		SqlSession mapper = factory.openSession();
		mapper.update("product.readCount", idx);
		mapper.commit();
		mapper.close();     
	}
	
}
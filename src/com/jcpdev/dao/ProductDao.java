package com.jcpdev.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Member;
import com.jcpdev.dto.Product;
import com.jcpdev.mybatis.SqlSessionBean;

public class ProductDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static ProductDao dao = new ProductDao();
	
	private ProductDao() { }
	public static ProductDao getInstance() {
		return dao;
	}
	
	public List<Product> getList(Map<String, Integer> map){   // 상품테이블 리스트
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getList",map);
		mapper.close();
		return list;
	}
	
	public List<Product> getMySellList(Member vo){   // 판매내역
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMySellList",vo);
		mapper.close();
		return list;
	}
	
	public List<Product> getMyBuyList(Member vo){   // 구매내역
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMyBuyList",vo);
		mapper.close();
		return list;
	}
	
	public Product getOne(int idx) {	// 상품번호로 조회
		SqlSession mapper = factory.openSession();
		Product dto = mapper.selectOne("product.getOne", idx);  
		mapper.close();
		return dto;
	}
	
	public int getCount() {	// 즐겨찾기 횟수
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("product.getCount");  
		mapper.close();     
		return cnt;
	}
	
	
	public void insert(Product dto) { // 상품등록
		SqlSession mapper = factory.openSession();
		mapper.insert("product.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update_product(Product dto) { // 상품수정
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update_product",dto);
		mapper.commit();
		mapper.close();
	}
	 
	public void update_like(int product_no) { // 즐겨찾기 등록
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update_like",product_no);
		mapper.commit();
		mapper.close();
	}
	
	public void delete_like(int product_no) { // 즐겨찾기 해제
		SqlSession mapper = factory.openSession();
		mapper.insert("product.delete_like",product_no);
		mapper.commit();
		mapper.close();
	}
	
	public List<Product> getMyLike(Map<String, Integer> map){   // 즐겨찾기 목록 조회
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMyLike",map);
		mapper.close();
		return list;
	}
	
	public int delete(Map<String, Object> map) { // 상품 삭제
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("product.delete", map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public void readCount(int idx) {	// 조회수
		SqlSession mapper = factory.openSession();
		mapper.update("product.readCount", idx);
		mapper.commit();
		mapper.close();     
	}
	
}
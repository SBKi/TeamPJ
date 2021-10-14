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
	
	public List<Product> getList(Map<String, Integer> map){   // �쟾泥� 由ъ뒪�듃 異쒕젰
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getList",map);
		mapper.close();
		return list;
	}
	public List<Product> getMyList(Member vo){   // �쟾泥� 由ъ뒪�듃 異쒕젰
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMyList",vo);
		mapper.close();
		return list;
	}
	
	
	public Product getOne(int idx) {	// �긽�뭾 �긽�꽭
		SqlSession mapper = factory.openSession();
		Product dto = mapper.selectOne("product.getOne", idx);  
		mapper.close();
		return dto;
	}
	
	public int getCount() {	// 愿��떖 媛��닔
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("product.getCount");  
		mapper.close();     
		return cnt;
	}
	
	public List<Product> getBuy(String product_buyer){   // 援щℓ�궡�뿭 由ъ뒪�듃 異쒕젰
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getBuy",product_buyer);
		mapper.close();
		return list;
	}
	
	public List<Product> getSell(String product_seller){   // �뙋留ㅻ궡�뿭 由ъ뒪�듃 異쒕젰
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getSell",product_seller);
		mapper.close();
		return list;
	}
	
	public void insert(Product dto) { // �긽�뭹 �벑濡�
		SqlSession mapper = factory.openSession();
		mapper.insert("product.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Product dto) { // �긽�뭹 �닔�젙
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update",dto);
		mapper.commit();
		mapper.close();
	}
	 
	public void update_like(int product_no) { // 利먭꺼李얘린 異붽�
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update_like",product_no);
		mapper.commit();
		mapper.close();
	}
	
	public void delete_like(int product_no) { // 利먭꺼李얘린 �궘�젣
		SqlSession mapper = factory.openSession();
		mapper.insert("product.delete_like",product_no);
		mapper.commit();
		mapper.close();
	}
	
	public List<Product> getLike(Map<String, Integer> map){   // 利먭꺼李얘린 由ъ뒪�듃 異쒕젰
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getLike",map);
		mapper.close();
		return list;
	}
	
	public int delete(Map<String, Object> map) { // 湲� �궘�젣
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("product.delete", map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public void readCount(int idx) {	// �뙎湲� 媛��닔
		SqlSession mapper = factory.openSession();
		mapper.update("product.readCount", idx);
		mapper.commit();
		mapper.close();     
	}
	
}
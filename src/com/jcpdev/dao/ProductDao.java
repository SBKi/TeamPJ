package com.jcpdev.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Declaration;
import com.jcpdev.dto.Member;
import com.jcpdev.dto.Product;
import com.jcpdev.mybatis.SqlSessionBean;

public class ProductDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static ProductDao dao = new ProductDao();

	private ProductDao() {
	}

	public static ProductDao getInstance() {
		return dao;
	}

	public List<Product> getList() { // 상품테이블 리스트
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getList");
		mapper.close();
		return list;
	}

	public List<Product> getAddList(Map<String, Integer> map) {
		// key(변수명처럼 이해) String, value 는 int
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getAddList", map);
		mapper.close();
		return list;
	}

	public List<Product> getSearchList(String content) { // 상품 검색 리스트
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getSearchList", content);
		mapper.close();
		return list;
	}

	public List<Product> getSearchListAdd(Map<String, Object> map) { // 상품 검색 리스트
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getSearchListAdd", map);
		mapper.close();
		return list;
	}

	public List<Product> getMyList(Member vo) { // 판매중
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMyList", vo);
		mapper.close();
		return list;
	}

	public List<Product> getMySoldList(Member vo) { // 판매내역
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMySoldList", vo);
		mapper.close();
		return list;
	}

	public List<Product> getMyBuyList(Member vo) { // 구매내역
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMyBuyList", vo);
		mapper.close();
		return list;
	}

	public Product getOne(int idx) { // 상품번호로 조회
		SqlSession mapper = factory.openSession();
		Product dto = mapper.selectOne("product.getOne", idx);
		mapper.close();
		return dto;
	}

	public int getCount() { // 즐겨찾기 횟수
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("product.getCount");
		mapper.close();
		return cnt;
	}

	public void insert(Product dto) { // 상품등록
		SqlSession mapper = factory.openSession();
		mapper.insert("product.insert", dto);
		mapper.commit();
		mapper.close();
	}

	public void update_product(Product dto) { // 상품수정
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update_product", dto);
		mapper.commit();
		mapper.close();
	}

	public void update_product_done(Product dto) { // 상품상태 변경 (거래완료)
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update_product_done", dto);
		mapper.commit();
		mapper.close();
	}

	public void update_like(int product_no) { // 즐겨찾기 등록
		SqlSession mapper = factory.openSession();
		mapper.insert("product.update_like", product_no);
		mapper.commit();
		mapper.close();
	}

	public void delete_like(int product_no) { // 즐겨찾기 해제
		SqlSession mapper = factory.openSession();
		mapper.insert("product.delete_like", product_no);
		mapper.commit();
		mapper.close();
	}

	public List<Product> getMyLike(Map<String, Integer> map) { // 즐겨찾기 목록 조회
		List<Product> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.getMyLike", map);
		mapper.close();
		return list;
	}

	public void delete(int product_no) { // 상품 삭제
		SqlSession mapper = factory.openSession();
		mapper.delete("product.delete", product_no);
		mapper.commit();
		mapper.close();
	}

	public void readCount(int idx) { // 조회수
		SqlSession mapper = factory.openSession();
		mapper.update("product.readCount", idx);
		mapper.commit();
		mapper.close();
	}

	public int getMySellCount(String dto) { //
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("product.getMySellCount", dto);
		mapper.close();
		return cnt;
	}

	public Product getProduct(int product_no) {
		Product Vo = null;
		SqlSession mapper = factory.openSession();
		Vo = mapper.selectOne("product.getProduct", product_no);
		mapper.close();
		return Vo;
	}

	public void insert_Declaration(Declaration dto) { // 신고상품 등록
		SqlSession mapper = factory.openSession();
		mapper.insert("product.insert_Declaration", dto);
		mapper.commit();
		mapper.close();
	}

	public List<Declaration> select_Declaration(int declration_product_no) {
		List<Declaration> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.select_Declaration", declration_product_no);
		mapper.close();
		return list;
	}

	public int admin_done_cnt() { // 거래 완료 상품 개수
		SqlSession mapper = factory.openSession();
		int cnt = 0;
		cnt = mapper.selectOne("product.admin_done_cnt");
		mapper.close();
		return cnt;
	}

	public int admin_ing_cnt() { // 거래 중 상품 개수
		SqlSession mapper = factory.openSession();
		int cnt = 0;
		cnt = mapper.selectOne("product.admin_ing_cnt");
		mapper.close();
		return cnt;
	}

	public int admin_total_price() { // 총 거래 금액
		SqlSession mapper = factory.openSession();
		int total = 0;
		total = mapper.selectOne("product.admin_total_price");
		mapper.close();
		return total;
	}

	public int admin_declaration_cnt() { // 신고 상품 개수
		SqlSession mapper = factory.openSession();
		int cnt = 0;
		cnt = mapper.selectOne("product.admin_declaration_cnt");
		mapper.close();
		return cnt;
	}

	public List<Declaration> admin_declaration_product() {
		List<Declaration> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.admin_declaration_product");
		mapper.close();
		return list;
	}

	public List<Declaration> admin_declaration() {
		List<Declaration> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("product.admin_declaration");
		mapper.close();
		return list;
	}
}
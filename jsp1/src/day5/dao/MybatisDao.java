package day5.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import day3.dto.Customer;
import day5.mybatis.SqlSessionBean;

public class MybatisDao {
	// 싱글턴 생성
	private static MybatisDao dao = new MybatisDao();
	private MybatisDao() {}
	public static MybatisDao getInstance() {
		return dao;
	}
	
	// 1.새로운 코딩 : SqlSession 객체를 생성 -> 메소드에서 SqlSessionFactory 객체 가져오기
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	public List<Customer> selectAll() {
		List<Customer> list = null;
		
		// SqlSession 객체 생성 후 sql 실행
		SqlSession mapper = sqlFactory.openSession();
		
		// customer.xml의 id 값, selectList()의 return 타입은 List
		list = mapper.selectList("selectAll");	 
		mapper.close();
		return list;
	}
	
	public Customer select(int idx) {
		Customer cus = null;
		SqlSession mapper = sqlFactory.openSession();
		
		// 두번째 인자 : sql 실행에 필요한 파라미터(customer.xml의 "selectOne"에게 idx를 파라미터로 넘김)
		// selectOne()의 return 타입은 Object(결과가 하나의 row일 때 사용)
		cus = mapper.selectOne("selectOne", idx);	
		mapper.close();
		return cus;
	}
	
	
	// SqlSession의 메소드 insert, delete, update는 멸령을 수행한 행의 개수를 리턴
	public int insert(Customer cus) {
		//SqlSession mapper = sqlFactory.openSession(true); // auto commit true
		SqlSession mapper = sqlFactory.openSession();	// auto commit false
		
		// auto commit?, n값 확인
		int n = mapper.insert("insert", cus);
		mapper.commit();
		mapper.close();
		// cus의 idx 자동증가 값 컬럼 리턴
		return cus.getIdx();
	}
	
	public int delete(int idx) {
		SqlSession mapper = sqlFactory.openSession(true);
		int n = mapper.delete("delete", idx);
		mapper.close();
		return n;
	}
	
	public int update(Customer cus) {
		SqlSession mapper = sqlFactory.openSession(true);
		int n = mapper.update("update", cus);
		mapper.close();
		return n;
	}
}

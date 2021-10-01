package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Freeboard;
import mybatis.SqlSessionBean;

public class FreeboardDao {
	private static FreeboardDao dao = new FreeboardDao();
	private FreeboardDao() {}
	public static FreeboardDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	public Freeboard getOne(int idx) {
		Freeboard dto = null;
		SqlSession mapper = sqlFactory.openSession();
		dto = mapper.selectOne("selectByIdx", idx);
		mapper.close();
		return dto;
	}
	
	public List<Freeboard> getList(Map<String, Integer> map) {
		List<Freeboard> list = null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("getList", map);
		mapper.close();
		return list;
	}
	
	public Freeboard selectByIdx(int idx) {
		Freeboard dto;
		SqlSession mapper = sqlFactory.openSession();
		dto = mapper.selectOne("selectByIdx");
		mapper.close();
		return dto;
	}
	
	public int getCount() {
		int count;
		SqlSession mapper = sqlFactory.openSession();
		count = mapper.selectOne("getCount");
		mapper.close();
		return count;
	}
	
	public void insert(Freeboard dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("freeboard.insert", dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Freeboard dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("update", dto);
		mapper.commit();
		mapper.close();
	}
	
	public int delete(Map<String, Object> map) {
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.delete("delete", map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public Freeboard psswordCheck(Map<String, Object> map) {
		SqlSession mapper = sqlFactory.openSession();
		Freeboard dto = mapper.selectOne("passwordCheck", map);
		mapper.close();
		return dto;
	}
	
	public void readCount(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("readCount", idx);
		mapper.commit();
		mapper.close();
	}
	
}

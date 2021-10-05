package com.jcpdev.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Comment;
import com.jcpdev.mybatis.SqlSessionBean;

public class CommentDao {
	private static CommentDao dao = new CommentDao();
	private CommentDao() {}
	public static CommentDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	
	public List<Comment> getComment(int mref) {
		List<Comment> list = null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("getComments", mref);
		mapper.close();
		return list;
	}
	
	public void insert(Comment dto) {
		SqlSession mapper = sqlFactory.openSession();
		// mapper xml 파일에서 namespace.id 로 중복된 문자열 지정
		mapper.insert("comment.insert", dto);
		mapper.commit();
		mapper.close();
	}
	
	public void updateCommentCnt(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("updateCommentCnt", idx);
		mapper.commit();
		mapper.close();
	}
	
	public void updateCountAll(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("updateCountAll", idx);
		mapper.commit();
		mapper.close();
	}
	
	public void deleteCmt(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.delete("deleteCmt", idx);
		mapper.commit();
		mapper.close();
	}
}

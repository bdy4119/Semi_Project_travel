package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.ReviewDao;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	SqlSession session;
	
	String ns = "Review.";

	
	//리스트에 뿌리기
	@Override
	public List<ReviewDto> review(ReviewParam Param) {
		return session.selectList(ns + "review", Param);
	}

	//페이지넘버
	@Override
	public int getAllReview(ReviewParam Param) {
		return session.selectOne(ns + "getAllReview", Param);
	}
	
	
	
	
	
}

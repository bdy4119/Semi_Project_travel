package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.ReviewDao;
import mul.cam.a.dto.ReviewComment;
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

	
	//reviewdetail
	@Override
	public ReviewDto getReview(int seq) {
		return session.selectOne(ns + "getReview", seq);
	}

	
	//reviewwrite
	@Override
	public int writeReview(ReviewDto dto) {
		return session.insert(ns + "writeReview", dto);
	}
	
	//답글 수정
	@Override
	public int answerReviewUpdate(ReviewDto dto) {
		return session.update(ns + "answerReviewUpdate", dto);
	}
	//답글 추가
	@Override
	public int answerReviewInsert(ReviewDto dto) {
		return session.insert(ns + "answerReviewInsert", dto);
	}

	//댓글 추가
	@Override
	public int commentWrite(ReviewComment comment) {
		return session.insert(ns +"commentWrite", comment);
	}
	
	//댓글 뿌리기
	@Override
	public List<ReviewComment> commentList(int seq) {
		return session.selectList(ns + "commentList", seq);
	}

	
	
	
	
	
}

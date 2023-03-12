package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.ReviewComment;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

public interface ReviewDao {
	
	//글 리스트에 뿌리기
	List<ReviewDto> review(ReviewParam Param);
	
	//페이지
	int getAllReview(ReviewParam Param);
	
	//detail
	ReviewDto getReview(int seq);
	
	
	//글추가
	int writeReview(ReviewDto dto);
	
	
	//답글
	int answerReviewUpdate(ReviewDto dto);
	int answerReviewInsert(ReviewDto dto);
	
	
	//댓글
	int commentWrite(ReviewComment comment);
	List<ReviewComment> commentList(int seq);
	
}

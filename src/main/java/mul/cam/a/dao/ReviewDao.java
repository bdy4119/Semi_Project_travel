package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

public interface ReviewDao {
	
	//글 리스트에 뿌리기
	List<ReviewDto> review(ReviewParam Param);
	
	//페이지
	int getAllReview(ReviewParam Param);
	
	//기존에 저장되어있던 데이터 조회
	//selectReview
	
}

package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dao.ReviewDao;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

public interface ReviewService {

	//리스트 뿌리기
	List<ReviewDto> review(ReviewParam Param);
	
	//페이지 넘버
	int getAllReview(ReviewParam Param);
}

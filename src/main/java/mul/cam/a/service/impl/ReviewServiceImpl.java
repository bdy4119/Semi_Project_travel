package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.ReviewDao;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;
import mul.cam.a.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDao dao;

	
	//리스트 뿌리기
	@Override
	public List<ReviewDto> review(ReviewParam Param) {
		return dao.review(Param);
	}

	
	//페이지 넘버
	@Override
	public int getAllReview(ReviewParam Param) {
		return dao.getAllReview(Param);
	}
	
	
	
	
}

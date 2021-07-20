package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.QnaComment;
import com.bitc.intro.domain.Review;
import com.bitc.intro.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	// 추가
	@Transactional
	public void insert(Review review) {
		reviewMapper.insert(review);
		/*
		 * qnaBoardMapper.updateReplyCnt(comment.getQnaId(), 1);
		 */
	}

	@Transactional
	public List<Review> getList(int id) {
		return reviewMapper.getList(id);
	}

	@Transactional
	public void delete(int id) {
		/*
		 * Review review = reviewMapper.findByNum(rid);
		 * qnaBoardMapper.updateReplyCnt(qcommnet.getQnaId(), -1);
		 */
		reviewMapper.delete(id);

	}

}

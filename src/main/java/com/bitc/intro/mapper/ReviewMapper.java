package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.intro.domain.Review;

@Mapper
public interface ReviewMapper {
	public List<Review> getList(int id);  // 전체보기
	public void insert(Review review); //추가
	public Review findByNum(int id); //상세보기
	public void delete(int id); //삭제


}

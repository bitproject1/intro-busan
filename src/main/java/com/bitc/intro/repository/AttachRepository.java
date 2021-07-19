package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.mapper.AttachMapper;

@Repository
public class AttachRepository {

	@Autowired
	private AttachMapper attachMapper;
	
	public void insertAttach(AttachVO attachVO) {
		attachMapper.insertAttach(attachVO);
	};
	
	public List<AttachVO> getAttachesByHno(int hno) {
		return attachMapper.getAttachesByHno(hno);
	};
	
	public AttachVO getThumbnailByHno(int hno) {
		return attachMapper.getThumbnailByHno(hno);
	};
}

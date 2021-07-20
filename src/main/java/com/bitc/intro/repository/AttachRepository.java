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
	
	public List<AttachVO> getAttachesByHid(int hid) {
		return attachMapper.getAttachesByHid(hid);
	};
	
	public AttachVO getThumbnailByHid(int hid) {
		return attachMapper.getThumbnailByHid(hid);
	};
}

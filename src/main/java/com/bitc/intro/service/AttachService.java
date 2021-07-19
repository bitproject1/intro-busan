package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.repository.AttachRepository;

@Service
public class AttachService {

	@Autowired
	private AttachRepository attachRepository;
	
	
	public List<AttachVO> getAttachesByHno(int hno) {
		return attachRepository.getAttachesByHno(hno);
	}
	
	public AttachVO getThumbnailByHno(int hno) {
		return attachRepository.getThumbnailByHno(hno);
	};
}

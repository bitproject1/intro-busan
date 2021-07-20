
<<<<<<< HEAD
  package com.bitc.intro.mapper;
  
  import java.util.List;
  
  import com.bitc.intro.domain.AttachVO;
  
  public interface AttachMapper {
  
  void insertAttach(AttachVO attachVO);// 첨부 파일 정보를 인서트 하는 메소드
  
  List<AttachVO> getAttachesByHno(int hno);
  
  AttachVO getThumbnailByHno(int hno);
  
  }
 
=======
import java.util.List;

import com.bitc.intro.domain.AttachVO;

public interface AttachMapper {

	void insertAttach(AttachVO attachVO);// 첨부 파일 정보를 인서트 하는 메소드
	
	List<AttachVO> getAttachesByHid(int hid);
	
	AttachVO getThumbnailByHid(int hid);
	
}	
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce

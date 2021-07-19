package com.bitc.intro.domain;

import lombok.Data;

@Data
public class AttachVO {
	
	private String uuid;
	private String uploadpath;
	private String filename;
	private int thumb; // 썸네일은 1 / 그냥 이미지는 0
	private int hno; // 참조할 hotspot id
	
}

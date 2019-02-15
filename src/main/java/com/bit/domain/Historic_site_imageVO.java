package com.bit.domain;

public class Historic_site_imageVO {
	private Integer bno;
	private Integer image_num;
	private String fullname;
	private String site_type;
	
	
	public String getSite_type() {
		return site_type;
	}
	public void setSite_type(String site_type) {
		this.site_type = site_type;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Integer getImage_num() {
		return image_num;
	}
	public void setImage_num(Integer image_num) {
		this.image_num = image_num;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	
}

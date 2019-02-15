package com.bit.domain;

import java.util.Arrays;
import java.util.List;

public class BoardVO {
	
	private Integer bno;
	private String history_name;
	private String detail;
	private String latitude;
	private String longitude;
	private String star;
	private String address1;
	private String address2;
	private String period;
	private String thema;
	private String[] files;
	private int viewcnt;
	private int replycnt;
	private String fullName;
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getHistory_name() {
		return history_name;
	}
	public void setHistory_name(String history_name) {
		this.history_name = history_name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getThema() {
		return thema;
	}
	public void setThema(String thema) {
		this.thema = thema;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", history_name=" + history_name + ", detail=" + detail + ", latitude="
				+ latitude + ", longitude=" + longitude + ", star=" + star + ", address1=" + address1 + ", address2="
				+ address2 + ", period=" + period + ", thema=" + thema + ", files=" + Arrays.toString(files)
				+ ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + ", fullName=" + fullName + "]";
	}
	
	
	

	
	
}

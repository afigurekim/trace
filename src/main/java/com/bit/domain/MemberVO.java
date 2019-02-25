package com.bit.domain;

public class MemberVO {
	private String user_name;
	private String user_id;
	private String user_pw;
	private String birth_day;
	private String sex;
	private String post;
	private String address1;
	private String address2;
	private String contact1;
	private String contact2;
	private String contact3;
	private String email;
	private String phone1;
	private String phone2;
	private String phone3;
	private int emailcheck;

	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
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
	public String getContact1() {
		return contact1;
	}
	public void setContact1(String contact1) {
		this.contact1 = contact1;
	}
	public String getContact2() {
		return contact2;
	}
	public void setContact2(String contact2) {
		this.contact2 = contact2;
	}
	public String getContact3() {
		return contact3;
	}
	public void setContact3(String contact3) {
		this.contact3 = contact3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
	public int getEmailcheck() {
		return emailcheck;
	}
	public void setEmailcheck(int emailcheck) {
		this.emailcheck = emailcheck;
	}
	@Override
	public String toString() {
		return "MemberVO [user_name=" + user_name + ", user_id=" + user_id + ", user_pw=" + user_pw + ", birth_day=" + birth_day
				+ ", sex=" + sex + ", post=" + post + ", address1=" + address1 + ", address2=" + address2
				+ ", contact1=" + contact1 + ", contact2=" + contact2 + ", contact3=" + contact3 + ", email=" + email
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", emailcheck=" + emailcheck
				+ "]";
	}

	
	
	
	
}

package com.astral.app.member.vo;

public class AuthorityVO {
	private int mem_no;
	private String authority_date;
	
	public AuthorityVO() {;}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getAuthority_date() {
		return authority_date;
	}

	public void setAuthority_date(String authority_date) {
		this.authority_date = authority_date;
	}
}

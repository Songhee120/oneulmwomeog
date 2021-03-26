package com.astral.app.member.vo;

public class HistoryVO {
	private int history_no;
	private int mem_no;
	private String res_name;
	private String res_address;
	private String res_url;
	private String history_date;
	

	public HistoryVO() {;}

	public int getHistory_no() {
		return history_no;
	}

	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_address() {
		return res_address;
	}

	public void setRes_address(String res_address) {
		this.res_address = res_address;
	}

	public String getRes_url() {
		return res_url;
	}

	public void setRes_url(String res_url) {
		this.res_url = res_url;
	}
	
	public String getHistory_date() {
		return history_date;
	}
	
	public void setHistory_date(String history_date) {
		this.history_date = history_date;
	}
	
}

package com.rate.model;

import java.sql.Date;

public class RateVO implements java.io.Serializable {

	private Integer rate_no;
	private Integer member_no;
	private Integer ap_no;
	private String rate_handletime;
	private String rate_clean;
	private String rate_service;
	private String rate_price;
	private String rate_location;
	private String comment;
	private Float avg_rating;

	public Integer getRate_no() {
		return rate_no;
	}

	public void setRate_no(Integer rate_no) {
		this.rate_no = rate_no;
	}

	public Integer getMember_no() {
		return member_no;
	}

	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}

	public Integer getAp_no() {
		return ap_no;
	}

	public void setAp_no(Integer ap_no) {
		this.ap_no = ap_no;
	}

	public String getRate_handletime() {
		return rate_handletime;
	}

	public void setRate_handletime(String rate_handletime) {
		this.rate_handletime = rate_handletime;
	}

	public String getRate_clean() {
		return rate_clean;
	}

	public void setRate_clean(String rate_clean) {
		this.rate_clean = rate_clean;
	}

	public String getRate_service() {
		return rate_service;
	}

	public void setRate_service(String rate_service) {
		this.rate_service = rate_service;
	}

	public String getRate_price() {
		return rate_price;
	}

	public void setRate_price(String rate_price) {
		this.rate_price = rate_price;
	}

	public String getRate_location() {
		return rate_location;
	}

	public void setRate_location(String rate_location) {
		this.rate_location = rate_location;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	public Float getAvg_rating() {
		return avg_rating;
	}

	public void setAvg_rating(Float avg_rating) {
		this.avg_rating = avg_rating;
	}
}

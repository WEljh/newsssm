package cn.ljh.newsssm.entity;

import java.util.Date;

public class Comment {

	private java.lang.Integer id;

	private java.lang.Integer nid;

	private java.lang.String comment;

	private Date time;

	private java.lang.String cname;

	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public java.lang.Integer getNid() {
		return nid;
	}

	public void setNid(java.lang.Integer nid) {
		this.nid = nid;
	}

	public java.lang.String getComment() {
		return comment;
	}

	public void setComment(java.lang.String comment) {
		this.comment = comment;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public java.lang.String getCname() {
		return cname;
	}

	public void setCname(java.lang.String cname) {
		this.cname = cname;
	}

}

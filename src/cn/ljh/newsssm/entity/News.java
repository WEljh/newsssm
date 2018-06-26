package cn.ljh.newsssm.entity;

import java.util.Date;


public class News {

	// Fields

	private Integer id;
	private String title;
	private String content;
	private Date date;
	private String cruser;
	private Integer hitnum;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(String title, String content, Date date, String cruser,
			Integer hitnum) {
		this.title = title;
		this.content = content;
		this.date = date;
		this.cruser = cruser;
		this.hitnum = hitnum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getdate() {
		return this.date;
	}

	public void setdate(Date date) {
		this.date = date;
	}

	public String getCruser() {
		return this.cruser;
	}

	public void setCruser(String cruser) {
		this.cruser = cruser;
	}

	public Integer getHitnum() {
		return this.hitnum;
	}

	public void setHitnum(Integer hitnum) {
		this.hitnum = hitnum;
	}

}
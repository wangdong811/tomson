package com.etoak.bean;

import java.util.Date;

/**
 * Students entity. @author MyEclipse Persistence Tools
 */

public class Students implements java.io.Serializable {
	// Fields

	private Integer id;
	private String name;
	private Integer age;
	private Date birth;
	private String status;
	private School sc;

	// Constructors

	public School getSc() {
		return sc;
	}

	public void setSc(School sc) {
		this.sc = sc;
	}

	/** default constructor */
	public Students() {
	}

	/** full constructor */
	public Students(String name, Integer age, Date birth,
			String status) {
		this.name = name;
		this.age = age;
		this.birth = birth;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Date getBirth() {
		return this.birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
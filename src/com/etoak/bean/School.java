package com.etoak.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * School entity. @author MyEclipse Persistence Tools
 */

public class School implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String location;
	private Set<Students> stus=new HashSet<Students>();
	// Constructors

	/** default constructor */
	public School() {
	}

	public Set<Students> getStus() {
		return stus;
	}

	public void setStus(Set<Students> stus) {
		this.stus = stus;
	}

	/** full constructor */
	public School(String name, String location) {
		this.name = name;
		this.location = location;
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

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
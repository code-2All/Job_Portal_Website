package com.entity;

public class user {
	
	private int id;
	private String email;
	private String password;
	public user(String name,String email, String qualification,String password,String role) {
		super();
		this.email = email;
		this.password = password;
		this.qualification = qualification;
		this.role = role;
		this.name = name;
	}
	public user() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String qualification;
	private String role;

	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}

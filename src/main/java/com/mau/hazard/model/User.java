package com.mau.hazard.model;

public class User {
	// form:hidden - hidden value
	Integer id;

	// form:input - textbox
	String name;
	
	String lname;
	String fname;

	// form:input - textbox
	String email;

	// form:textarea - textarea
	String address;

	// form:input - password
	String password;

	// form:input - password
	String confirmPassword;

	// form:radiobutton - radio button
	String sex;

	// form:radiobuttons - radio button
	Integer license;

	// form:select - form:option - dropdown - single select
	Integer active;

	public boolean isNew() {
		return (this.id == null);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public Integer getLicense() {
		return license;
	}

	public void setLicense(Integer license) {
		this.license = license;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	/*@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", address=" + address
				+ ", password=" + password + ", confirmPassword=" + confirmPassword
				+ ", newsletter=" + newsletter + ", framework=" + framework + ", sex=" + sex
				+ ", number=" + number + ", country=" + country + ", skill=" + skill + "]" + isNew();
	}*/

}

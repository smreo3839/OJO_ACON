package kr.mycom.ojo.model;

import java.util.Date;

public class SignupVo {
	private int ucode;
	private int gcode;
	private Date regdate;
	private String name;
	private String uid;
	private String gender;
	private String email;
	
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public int getGcode() {
		return gcode;
	}
	public void setGcode(int gcode) {
		this.gcode = gcode;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "SignupVo [ucode=" + ucode + ", gcode=" + gcode + ", regdate=" + regdate + ", name=" + name + ", uid="
				+ uid + ", gender=" + gender + ", email=" + email + "]";
	}
}

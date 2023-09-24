package kr.mycom.ojo.model;

import java.util.Date;

public class MemberVo {

	private int ucode;
	private String uid;
	private String pwd;
	private String name;
	private String phone;
	private String gender;
	private Date regdate;
	private String profile;
	private String email;
	private int approval_status;
	private String approval_key;
	private int point;

	public MemberVo() {
	};

	public MemberVo(int ucode, String uid, String pwd, String name, String phone, String gender, Date regdate,
			String profile, String email, int approval_status, String approval_key, int point) {
		super();
		this.ucode = ucode;
		this.uid = uid;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.regdate = regdate;
		this.profile = profile;
		this.email = email;
		this.approval_status = approval_status;
		this.approval_key = approval_key;
		this.point = point;
	}

	public int getUcode() {
		return ucode;
	}

	public void setUcode(int ucode) {
		this.ucode = ucode;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(int approval_status) {
		this.approval_status = approval_status;
	}

	public String getApproval_key() {
		return approval_key;
	}

	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberVo [ucode=" + ucode + ", uid=" + uid + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone
				+ ", gender=" + gender + ", regdate=" + regdate + ", profile=" + profile + ", email=" + email
				+ ", approval_status=" + approval_status + ", approval_key=" + approval_key + ", point=" + point + "]";
	}

}

package kr.mycom.ojo.model;

import java.util.Date;

public class JoinVo {
	//group_info , members	
	private Integer ucode;
	//group_info , room_info
	private Integer rcode;
	
	//members    (MemberVo)		         기본키 ucode
	private String uid;
	private String pwd;
	private String m_name;//m_name
	private String m_phone;//m_phone
	private String gender;
	private Date regDate;
	private String profile;
	private String email;
	
	//room_info    (Room_infoVo)    참조키 ucode
	private String r_name;//r_name
	private String addr;
	private String r_phone;//r_phone
	private String rtype;
	private String rprofile;
	private String thumb;
	private String thdetail01;
	private String thdetail02;
	private String thdetail03;
	private String thdetail04;
	private String prc;
	private int viewcnt;
	
	//group_info (GroupVo)			참조키 ucode, rcode
	private Integer gcode; 
	private int cnt;
	private String cate;
	private String regdate;
	private String content;
	private String title;
	
	//room_opt    (Room_optVo)		참조키 rcode
	private String air;
	private String projector;
	private String board;
	private String wifi;
	private String drink;
	private String smoking;
	private String food;
	private String printer;
	
	public Integer getUcode() {
		return ucode;
	}
	public Integer getRcode() {
		return rcode;
	}
	public String getUid() {
		return uid;
	}
	public String getPwd() {
		return pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public String getGender() {
		return gender;
	}
	public Date getRegDate() {
		return regDate;
	}
	public String getProfile() {
		return profile;
	}
	public String getEmail() {
		return email;
	}
	public String getR_name() {
		return r_name;
	}
	public String getAddr() {
		return addr;
	}
	public String getR_phone() {
		return r_phone;
	}
	public String getRtype() {
		return rtype;
	}
	public String getRprofile() {
		return rprofile;
	}
	public String getThumb() {
		return thumb;
	}
	public String getThdetail01() {
		return thdetail01;
	}
	public String getThdetail02() {
		return thdetail02;
	}
	public String getThdetail03() {
		return thdetail03;
	}
	public String getThdetail04() {
		return thdetail04;
	}
	public String getPrc() {
		return prc;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public Integer getGcode() {
		return gcode;
	}
	public int getCnt() {
		return cnt;
	}
	public String getCate() {
		return cate;
	}
	public String getRegdate() {
		return regdate;
	}
	public String getContent() {
		return content;
	}
	public String getTitle() {
		return title;
	}
	public String getAir() {
		return air;
	}
	public String getProjector() {
		return projector;
	}
	public String getBoard() {
		return board;
	}
	public String getWifi() {
		return wifi;
	}
	public String getDrink() {
		return drink;
	}
	public String getSmoking() {
		return smoking;
	}
	public String getFood() {
		return food;
	}
	public String getPrinter() {
		return printer;
	}
	
	
}

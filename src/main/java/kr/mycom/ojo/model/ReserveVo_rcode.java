package kr.mycom.ojo.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

public class ReserveVo_rcode {
	private String recode;
	private String ucode;
	private String rcode;
	private String name;
	private Date regdate;
	private Date regtime;
	private int cnt;
	private Date dateReserve;

	public Date getDateReserve() {
		return dateReserve;
	}

	public void setDateReserve(Date dateReserve) {
		this.dateReserve = dateReserve;
	}

	public String getRecode() {
		return recode;
	}

	public void setRecode(String recode) {
		this.recode = recode;

	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) throws UnsupportedEncodingException {
		String uc = "ucode=" + ucode;
		System.out.println(URLEncoder.encode(uc, "UTF-8"));
		this.ucode = URLEncoder.encode(uc, "UTF-8");
	}

	public String getRcode() {
		return rcode;
	}

	public void setRcode(String rcode) throws UnsupportedEncodingException {
		String rc = "rcode=" + rcode;
		System.out.println(URLEncoder.encode(rc, "UTF-8"));
		this.rcode = URLEncoder.encode(rc, "UTF-8");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getRegtime() {
		return regtime;
	}

	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "ReserveVo [recode=" + recode + ", ucode=" + ucode + ", rcode=" + rcode + ", name=" + name + ", regdate="
				+ regdate + ", regtime=" + regtime + ", cnt=" + cnt + "]";
	}
}

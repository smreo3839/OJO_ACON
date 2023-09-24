package kr.mycom.ojo.model;

import java.util.List;

public class ReviewVo {
	private Integer rvcode;
	private Integer ucode;
	private Integer rcode;
	private String review;
	private int score;
	private String regdate;
	private String name;
	private String profile;

	private List<Review_imgVo> imgdataList;

	public Integer getRvcode() {
		return rvcode;
	}

	public void setRvcode(Integer rvcode) {
		this.rvcode = rvcode;
	}

	public Integer getUcode() {
		return ucode;
	}

	public void setUcode(Integer ucode) {
		this.ucode = ucode;
	}

	public Integer getRcode() {
		return rcode;
	}

	public void setRcode(Integer rcode) {
		this.rcode = rcode;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public List<Review_imgVo> getImgdataList() {
		return imgdataList;
	}

	public void setImgdataList(List<Review_imgVo> imgdataList) {
		this.imgdataList = imgdataList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "ReviewVo [rvcode=" + rvcode + ", ucode=" + ucode + ", rcode=" + rcode + ", review=" + review
				+ ", score=" + score + ", regdate=" + regdate + ", name=" + name + ", profile=" + profile
				+ ", imgdataList=" + imgdataList + "]";
	}

}

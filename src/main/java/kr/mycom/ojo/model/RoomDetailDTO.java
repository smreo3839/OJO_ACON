package kr.mycom.ojo.model;

import java.util.List;

public class RoomDetailDTO {
	private Double avgScore;
	private String reviewCount;
	private int review_ucode;

	public Double getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(Double avgScore) {
		this.avgScore = avgScore;
	}

	public String getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getReview_ucode() {
		return review_ucode;
	}

	public void setReview_ucode(int review_ucode) {
		this.review_ucode = review_ucode;
	}

}

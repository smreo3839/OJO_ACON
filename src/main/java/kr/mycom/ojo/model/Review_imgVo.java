package kr.mycom.ojo.model;

import java.util.List;

import lombok.Data;

@Data
public class Review_imgVo {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private Integer rcode;
	private int ucode;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Integer getRcode() {
		return rcode;
	}

	public void setRcode(Integer rcode) {
		this.rcode = rcode;
	}

	public int getUcode() {
		return ucode;
	}

	public void setUcode(int ucode) {
		this.ucode = ucode;
	}

	@Override
	public String toString() {
		return "Review_imgVo [uuid=" + uuid + ", uploadPath=" + uploadPath + ", fileName=" + fileName + ", rcode="
				+ rcode + ", ucode=" + ucode + "]";
	}

}
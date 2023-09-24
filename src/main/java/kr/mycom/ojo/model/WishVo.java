package kr.mycom.ojo.model;

public class WishVo {
	private int ucode;
	private int rcode;

	public int getUcode() {
		return ucode;
	}

	public void setUcode(int ucode) {
		this.ucode = ucode;
	}

	public int getRcode() {
		return rcode;
	}

	public void setRcode(int rcode) {
		this.rcode = rcode;
	}

	@Override
	public String toString() {
		return "WishVo [ucode=" + ucode + ", rcode=" + rcode + "]";
	}

}

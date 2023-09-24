package kr.mycom.ojo.service;

import java.util.List;

import kr.mycom.ojo.model.WishVo;

public interface WishService {
	public int createWish(WishVo wvo);
	public int deleteWish(WishVo wvo);
	public List<WishVo> readWish(WishVo wvo);
}

package kr.mycom.ojo.persistance;

import java.util.List;

import kr.mycom.ojo.model.WishVo;

public interface WishDao {
	
	public int createWish(WishVo wvo);
	public int deleteWish(WishVo wvo);
	public List<WishVo> readWish(WishVo wvo);
	
}

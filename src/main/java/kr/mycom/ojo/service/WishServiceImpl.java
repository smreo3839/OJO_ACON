package kr.mycom.ojo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.mycom.ojo.model.WishVo;
import kr.mycom.ojo.persistance.WishDao;

@Service
public class WishServiceImpl implements WishService{

	@Inject
	private WishDao dao;
	
	@Override
	public int createWish(WishVo wvo) {
		return dao.createWish(wvo);
	}

	@Override
	public int deleteWish(WishVo wvo) {
		return dao.deleteWish(wvo);
	}

	@Override
	public List<WishVo> readWish(WishVo wvo) {
		return dao.readWish(wvo);
		
	}

}

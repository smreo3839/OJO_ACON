package kr.mycom.ojo.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.mycom.ojo.model.WishVo;

@Repository
public class WishDaoImpl implements WishDao {

	@Inject
	private SqlSession sql;
	private static String namespace = "kr.mycom.ojo.WishMapper";
	
	@Override
	public int createWish(WishVo wvo) {
		return sql.insert(namespace+".create",wvo);
	}

	@Override
	public int deleteWish(WishVo wvo) {
		return sql.delete(namespace+".delete",wvo);
	}

	@Override
	public List<WishVo> readWish(WishVo wvo) {
		return sql.selectList(namespace+".read",wvo);
	}

}

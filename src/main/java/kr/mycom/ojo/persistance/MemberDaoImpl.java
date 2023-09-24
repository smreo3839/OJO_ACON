package kr.mycom.ojo.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.mycom.ojo.model.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.mycom.ojo.MemberMapper";

	@Override
	@Transactional
	public void regist(MemberVo vo) throws Exception {
		sql.insert(namespace + ".regist", vo);
	}

	@Override
	public MemberVo login(MemberVo vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}

	@Override
	public void update(MemberVo vo) throws Exception {
		sql.update(namespace + ".update", vo);
	}

	@Override
	public void withdrawal(MemberVo vo) throws Exception {
		sql.delete(namespace + ".withdrawal", vo);
	}
	
	@Override
	public String findId(MemberVo vo) {
		return sql.selectOne(namespace+ ".searchId", vo);
	}

	@Override
	@Transactional
	public int updatepw(MemberVo vo) throws Exception {
		return sql.update(namespace+".updatepw", vo);
	}

	@Override
	@Transactional
	public int approval_member(MemberVo vo) throws Exception {
		return sql.update(namespace+".approval_member", vo);
	}

	@Override
	public int approved(MemberVo vo) throws Exception {
		return sql.selectOne(namespace+".approved", vo);
	}
	
	@Override
	public MemberVo checkId(String uid) throws Exception {
		return sql.selectOne(namespace+".check_id", uid);
	}

	//경고대상인지
	@Override
	public int alert(int ucode) throws Exception {
		return sql.selectOne(namespace+".alert", ucode);
	}


}

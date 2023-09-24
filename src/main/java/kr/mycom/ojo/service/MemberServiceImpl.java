package kr.mycom.ojo.service;

import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.mycom.ojo.model.MemberVo;
import kr.mycom.ojo.persistance.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDao dao;

	@Override
	public void regist(MemberVo vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public MemberVo login(MemberVo vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void update(MemberVo vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void withdrawal(MemberVo vo) throws Exception {
		dao.withdrawal(vo);
	}

	@Override
	public String findId(MemberVo vo) throws Exception {
		return dao.findId(vo);
	}

	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	@Override
	public int approval_member(MemberVo vo) throws Exception {

		return dao.approval_member(vo);
	}

	@Override
	public int approved(MemberVo vo) throws Exception {
		return dao.approved(vo);
	}

	@Override
	public void updatepw(MemberVo vo) throws Exception {
		dao.updatepw(vo);
	}

	@Override
	public MemberVo checkId(String uid) throws Exception {
		
		return dao.checkId(uid);
		
		
	}

	@Override
	public int alert(int ucode) throws Exception {
		return dao.alert(ucode);
	}

}

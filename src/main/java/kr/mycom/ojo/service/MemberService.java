package kr.mycom.ojo.service;

import kr.mycom.ojo.model.MemberVo;

public interface MemberService {
	public void regist(MemberVo vo) throws Exception;

	public MemberVo login(MemberVo vo) throws Exception;
	public void update(MemberVo vo) throws Exception;
	public void withdrawal(MemberVo vo) throws Exception;
	
	public String findId(MemberVo vo) throws Exception;
	public String create_key() throws Exception;
	public int approval_member(MemberVo vo) throws Exception;
	public int approved(MemberVo vo)throws Exception;
	
	public void updatepw(MemberVo vo) throws Exception;
	public MemberVo checkId(String uid) throws Exception;

	//경고대상인지
	public int alert(int ucode) throws Exception;
}

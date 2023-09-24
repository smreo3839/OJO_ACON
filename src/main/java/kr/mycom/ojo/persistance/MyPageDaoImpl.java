package kr.mycom.ojo.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.Group_join;
import kr.mycom.ojo.model.MemberVo;
import kr.mycom.ojo.model.ReserveVo;
import kr.mycom.ojo.model.ReserveVo_rcode;
import kr.mycom.ojo.model.Room_infoVo;
import kr.mycom.ojo.model.SignupVo;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Inject
	private SqlSession session;
	private static final String namespace = "kr.mycom.ojo.MypageMapper";

	@Override
	public List<GroupVo> listAll(int ucode) throws Exception {
		return session.selectList(namespace + ".mylist", ucode);
	}

	@Override
	public void getTime() {
		String sql = session.selectOne(namespace + ".getTime");
	}

	@Override
	public GroupVo read(Integer gcode) throws Exception {
		return session.selectOne(namespace + ".read", gcode);
	}

	@Override
	public List<ReserveVo> listR(int ucode) throws Exception {
		return session.selectList(namespace + ".viewReserve", ucode);
	}

	@Override
	public List<Room_infoVo> listW(int ucode) throws Exception {
		return session.selectList(namespace + ".mywish", ucode);
	}

	@Override
	public List<SignupVo> listS(int gcode) throws Exception {
		return session.selectList(namespace + ".memberin", gcode);
	}
	
	@Override
	public List<Group_join> listJ(int ucode) throws Exception {
		return session.selectList(namespace+".listSignUp", ucode);
	}
	@Override
	public int groupSignCnt(int gcode) throws Exception {
		return session.selectOne(namespace+".groupSignCnt", gcode);
	}

	@Override
	public List<ReserveVo_rcode> listf(int ucode) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".viewReserve_past", ucode);
	}

	@Transactional
	@Override
	public void AccumulatedPoint(Map<String, Integer> map) {
		int ucode = map.get("ucode");
		System.out.println("dao AccumulatedPoint : " + ucode);
		session.delete(namespace + ".deletviewReserve_past", map);
		session.update(namespace + ".stackPoint", ucode);
	}

	@Override
	public MemberVo userInformation(int ucode) {
		return session.selectOne(namespace + ".userInformation", ucode);
	}

	@Override
	public int selectReserve_past(Map<String, Integer> map) {
		return session.selectOne(namespace + ".selectReserve_past", map);
	}

	//adminster 인지
	@Override
	public int administer(int ucode) throws Exception {
		return session.selectOne(namespace + ".administer", ucode);
	}

}

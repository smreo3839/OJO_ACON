package kr.mycom.ojo.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.Group_join;
import kr.mycom.ojo.model.MemberVo;
import kr.mycom.ojo.model.ReserveVo;
import kr.mycom.ojo.model.ReserveVo_rcode;
import kr.mycom.ojo.model.Room_infoVo;
import kr.mycom.ojo.model.SignupVo;
import kr.mycom.ojo.persistance.MyPageDao;
import kr.mycom.ojo.persistance.ReserveDao;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MyPageDao dao;

	@Override
	public List<GroupVo> listAll(int ucode) throws Exception {
		return dao.listAll(ucode);
	}

	@Override
	public GroupVo read(Integer gcode) throws Exception {
		return dao.read(gcode);
	}

	@Override
	public List<ReserveVo> listR(int ucode) throws Exception {
		return dao.listR(ucode);
	}

	@Override
	public List<Room_infoVo> listW(int ucode) throws Exception {
		return dao.listW(ucode);
	}

	@Override
	public List<SignupVo> listS(int gcode) throws Exception {
		return dao.listS(gcode);
	}

	@Override
	public List<ReserveVo_rcode> listf(int ucode) throws Exception {
		return dao.listf(ucode);
	}
	
	@Override
	public List<Group_join> listJ(int ucode) throws Exception {
		return dao.listJ(ucode);
	}

	@Override
	public int groupSignCnt(int gcode) throws Exception {
		return dao.groupSignCnt(gcode);
	}
	

	@Override
	public int selectReserve_past(Map<String, Integer> map) {
		return dao.selectReserve_past(map);
	}

	/* qr코드 포인트 적립 */
	@Override
	public void AccumulatedPoint(Map<String, Integer> map) {
		dao.AccumulatedPoint(map);

	}

	@Override
	public MemberVo userInformation(int ucode) {
		return dao.userInformation(ucode);

	}

	@Override
	public int administer(int ucode) throws Exception {
		return dao.administer(ucode);
	}

}

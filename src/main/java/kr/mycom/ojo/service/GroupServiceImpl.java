package kr.mycom.ojo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.Group_join;
import kr.mycom.ojo.model.JoinVo;
import kr.mycom.ojo.model.SearchCriteria;
import kr.mycom.ojo.persistance.GroupDao;

@Service
public class GroupServiceImpl implements GroupService {

	@Inject
	private GroupDao dao;

	@Override
	public GroupVo read(Integer gcode) throws Exception {
		return dao.read(gcode);
	}

	@Override
	public void regist(GroupVo vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public void modify(GroupVo vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(int gcode) throws Exception {
		dao.delete(gcode);
	}

	@Override
	public List<GroupVo> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<GroupVo> listPage(int page) throws Exception {
		return null;
	}

	@Override
	public List<GroupVo> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<JoinVo> JoinNameID() throws Exception {
		return dao.JoinNameID();
	}

	@Override
	public void group_join(Group_join vo) throws Exception {
		dao.group_join(vo);
	}

	@Override
	public int selectjoin(Group_join vo) throws Exception {
		return dao.selectjoin(vo);
	}

	@Override
	public void delete_join(Group_join vo) throws Exception {
		dao.delete_join(vo);
	}

	@Override
	public int groupCnt(int gcode) throws Exception {
		return dao.groupCnt(gcode);
	}

	@Override
	public int groupSignCnt(int gcode) throws Exception {
		return dao.groupSignCnt(gcode);
	}

}

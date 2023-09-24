package kr.mycom.ojo.persistance;

import java.util.List;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.Group_join;
import kr.mycom.ojo.model.JoinVo;
import kr.mycom.ojo.model.SearchCriteria;

public interface GroupDao {
	public void getTime();

	public GroupVo read(Integer gcode) throws Exception;

	public List<GroupVo> listAll() throws Exception;

	public List<GroupVo> listPage(int page) throws Exception;

	public void insert(GroupVo vo) throws Exception;

	public void update(GroupVo vo) throws Exception;

	public void delete(int gcode) throws Exception;

	public List<GroupVo> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<JoinVo> JoinNameID() throws Exception;

	public void group_join(Group_join vo) throws Exception;

	public int selectjoin(Group_join vo) throws Exception; // 조인 되었나 카운트 세기

	// 그룹신청 취소
	public void delete_join(Group_join vo) throws Exception;

	public int groupCnt(int gcode) throws Exception;

	public int groupSignCnt(int gcode) throws Exception;	
}

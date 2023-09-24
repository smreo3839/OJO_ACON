package kr.mycom.ojo.persistance;

import java.nio.channels.SeekableByteChannel;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.Group_join;
import kr.mycom.ojo.model.JoinVo;
import kr.mycom.ojo.model.SearchCriteria;

@Repository
public class GroupDaoImpl implements GroupDao {

	@Inject
	private SqlSession session;
	private static final String namespace = "kr.mycom.ojo.GroupMapper";

	@Override
	public void getTime() {
		String sql = session.selectOne(namespace + ".getTime");
		System.out.println(sql);
	}

	@Override
	public GroupVo read(Integer gcode) throws Exception {
		return session.selectOne(namespace + ".read", gcode);
	}

	@Override
	public List<GroupVo> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<GroupVo> listPage(int page) throws Exception {
		return null;
	}

	@Override
	public void insert(GroupVo vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(GroupVo vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int gcode) throws Exception {
		session.delete(namespace + ".delete", gcode);
	}

	@Override
	public void group_join(Group_join vo) throws Exception {
		session.insert(namespace + ".insert_join", vo);
	}

	@Override
	public int selectjoin(Group_join vo) throws Exception {
		return session.selectOne(namespace + ".join_count", vo);
	}

	@Override
	public void delete_join(Group_join vo) throws Exception {
		session.delete(namespace + ".delete_join", vo);
	}

	@Override
	public List<GroupVo> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<JoinVo> JoinNameID() throws Exception {
		return session.selectList(namespace + ".joinNameID");
	}

	@Override
	public int groupCnt(int gcode) throws Exception {
		return session.selectOne(namespace + ".groupCnt", gcode);
	}

	@Override
	public int groupSignCnt(int gcode) throws Exception {
		return session.selectOne(namespace + ".groupSignCnt", gcode);
	}
}

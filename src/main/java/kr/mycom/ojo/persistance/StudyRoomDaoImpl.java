package kr.mycom.ojo.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.MostLikeReview;
import kr.mycom.ojo.model.ReserveVo;
import kr.mycom.ojo.model.ReviewVo;
import kr.mycom.ojo.model.Review_imgVo;
import kr.mycom.ojo.model.RoomDetailDTO;
import kr.mycom.ojo.model.Room_infoVo;
import kr.mycom.ojo.model.Room_info_main;
import kr.mycom.ojo.model.Room_optVo;
import kr.mycom.ojo.model.SearchCriteria;

@Repository
public class StudyRoomDaoImpl implements StudyRoomDao {
	@Inject
	private SqlSession session;

	private static String namespace = "kr.mycom.ojo.RoomMapper";

	@Override
	public List<Room_infoVo> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<Room_infoVo> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void updateViewCnt(Integer rcode) throws Exception {
		session.update(namespace + ".updateViewCnt", rcode);
	}

	@Override
	public Room_infoVo read(Integer rcode) throws Exception {
		return session.selectOne(namespace + ".read", rcode);
	}

	@Override
	public Room_optVo readOpt(Integer rcode) {
		return session.selectOne(namespace + ".readOpt", rcode);
	}

	@Override
	public void insertImgVo(Review_imgVo imgvo) {// 이미지 정보 db에 저장
		session.insert(namespace + ".insertReviewVo", imgvo);
	}

	@Override
	public void insertReview(ReviewVo reviewVo) {
		session.insert(namespace + ".insertReview", reviewVo);
	}

	@Override
	public List<ReviewVo> roomContent(Integer rcode) throws Exception {
		return session.selectList(namespace + ".readContent", rcode);
	}

	@Override
	public List<Review_imgVo> readiImgVo(Integer rcode) {
		return session.selectList(namespace + ".readiImgVo", rcode);
	}

	@Override
	public RoomDetailDTO RoomDetailDTO(Map<String, Integer> map) {
		Integer rcode = map.get("rcode");
		RoomDetailDTO dto = session.selectOne(namespace + ".avgScore", rcode);
		dto.setReview_ucode(session.selectOne(namespace + ".review_ucode", map));
		return dto;
	}

	@Override
	public void removeReview(Map<String, Integer> map) throws Exception {
		session.delete(namespace + ".removeReview", map);
		session.delete(namespace + ".removeReview_img", map);

	}

	@Override
	public List<Review_imgVo> readiImgVoSpecific(Map<String, Integer> map) {
		return session.selectList(namespace + ".readiImgVoSpecific", map);
	}

	@Override
	public List<Room_info_main> MainPage_roomInfo() {
		return session.selectList(namespace + ".MainPage_roomInfo");
	}

	@Override
	public void reserve_join(ReserveVo vo) throws Exception {
		session.insert(namespace + ".reserve_join", vo);
	}

	@Override
	public int reserve_count(ReserveVo vo) throws Exception {
		return session.selectOne(namespace + ".reserve_count", vo);
	}

	@Override
	public void reserve_undo(ReserveVo vo) throws Exception {
		session.delete(namespace + ".reserve_undo", vo);
	}

	@Override
	public int reserveCnt(int rcode) throws Exception {
		return session.selectOne(namespace + ".reserveCnt", rcode);
	}

	// 날짜 차이 및 고정 넣기 및 고정넣기 한번만
	@Override
	public int reserveDiff(ReserveVo rv) throws Exception {
		return session.selectOne(namespace + ".reserveDiff", rv);
	}

	@Override
	public int reserveDiffUser(int ucode) throws Exception {
		return session.selectOne(namespace + ".reserveDiffUser", ucode);
	}

	@Override
	public void reserveFixed(ReserveVo rv) throws Exception {
		session.insert(namespace + ".reserveFixed", rv);
	}

	@Override
	public int reserveFixedCnt(ReserveVo rv) throws Exception {
		return session.selectOne(namespace + ".reserveFixedCnt", rv);
	}

	@Override
	public int reserveDiffday(ReserveVo rv) throws Exception {
		return session.selectOne(namespace + ".reserveDiffday", rv);
	}

	////////

	@Override
	public int pastDaySelectCnt() throws Exception {// fixed테이블에서 지난날짜 카운트
		return session.selectOne(namespace + ".pastDaySelectCnt");
	}

	@Override
	public void reservePastInsert() throws Exception {// past테이블에 지난 예약 정보 넣고
		session.selectOne(namespace + ".reservePastInsert");
	}

	@Override
	public void reWaitPastDelete() throws Exception {// 지난 예약 wait테이블에서 지움
		session.selectOne(namespace + ".reWaitPastDelete");
	}

	@Override
	public void refixedPastDelete() throws Exception {// 지난 예약 fixed테이블에서 지움
		session.selectOne(namespace + ".refixedPastDelete");
	}

	////////
	@Override
	public int MainDaySelectSeven() throws Exception {// 7일 이하데이터 카운트
		return session.selectOne(namespace + ".MainDaySelectSeven");
	}

	@Override
	public void MainDaySevenFixedInsert() throws Exception {// 7일 이하데이터 fixed테이블에 집어넣기
		session.selectOne(namespace + ".MainDaySevenFixedInsert");
	}

	@Override
	public void DeleteDuple() throws Exception {// 중복데이터 삭제
		session.selectOne(namespace + ".DeleteDuple");
	}

	@Override
	public int recCheck(Map<String, Integer> map) throws Exception {
		return session.selectOne(namespace + ".recCheck", map);
	}

	@Override
	public void recUpdate(Map<String, Integer> map) throws Exception {
		session.insert(namespace + ".recUpdate", map);
	}

	@Override
	public void recDelete(Map<String, Integer> map) throws Exception {
		session.delete(namespace + ".recDelete", map);
	}

	@Override
	public int recCount(Integer rvcode) throws Exception {
		return session.selectOne(namespace + ".recCount", rvcode);
	}
	@Override
	public List<Integer> allreview_like(Integer rcode) throws Exception {
		return session.selectList(namespace + ".allreview_like", rcode);
	}
//	메인페이지 최다 좋아요 리뷰 6개 출력 
	@Override
	public List<MostLikeReview> mostLikeReview() throws Exception {
		return session.selectList(namespace + ".mostLikeReview");
	}
}

package kr.mycom.ojo.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.mycom.ojo.model.Criteria;
import kr.mycom.ojo.model.MostLikeReview;
import kr.mycom.ojo.model.ReserveVo;
import kr.mycom.ojo.model.ReviewVo;
import kr.mycom.ojo.model.Review_imgVo;
import kr.mycom.ojo.model.RoomDetailDTO;
import kr.mycom.ojo.model.Room_infoVo;
import kr.mycom.ojo.model.Room_info_main;
import kr.mycom.ojo.model.Room_optVo;
import kr.mycom.ojo.model.SearchCriteria;
import kr.mycom.ojo.persistance.StudyRoomDao;
import lombok.Setter;

@Service
public class RoomServiceImImpl implements RoomService {
	@Inject
	private StudyRoomDao dao;

	@Override
	public List<Room_infoVo> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<Room_infoVo> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Room_infoVo read(Integer rcode) throws Exception {
		dao.updateViewCnt(rcode);
		return dao.read(rcode);
	}

	@Override
	public Room_optVo readOpt(Integer rcode) throws Exception {
		return dao.readOpt(rcode);
	}

	@Override
	public void register_imgVo(ReviewVo review_Vo) throws Exception {
		List<Review_imgVo> list = review_Vo.getImgdataList();
		for (Review_imgVo reviewVo : list) {
			dao.insertImgVo(reviewVo);
		}

	}

	@Override
	public void register_review(ReviewVo review_Vo) throws Exception {
		dao.insertReview(review_Vo);
	}

	@Override
	public List<ReviewVo> roomContent(Integer rcode) throws Exception {
		return dao.roomContent(rcode);
	}

	@Override
	public RoomDetailDTO RoomDetailDTO(Map<String, Integer> map) throws Exception {

		return dao.RoomDetailDTO(map);
	}

	@Override
	public List<Review_imgVo> readiImgVo(Integer rcode) throws Exception {
		return dao.readiImgVo(rcode);
	}

	@Override
	public void removeReview(Map<String, Integer> map) throws Exception {
		dao.removeReview(map);

	}

	@Override
	public List<Review_imgVo> readiImgVoSpecific(Map<String, Integer> map) {
		return dao.readiImgVoSpecific(map);
	}

	@Override
	public void reserve_join(ReserveVo vo) throws Exception {
		dao.reserve_join(vo);

	}

	@Override
	public int reserve_count(ReserveVo vo) throws Exception {
		return dao.reserve_count(vo);
	}

	@Override
	public void reserve_undo(ReserveVo vo) throws Exception {
		dao.reserve_undo(vo);
	}

	@Override
	public int reserveCnt(int rcode) throws Exception {
		return dao.reserveCnt(rcode);
	}

	// 날짜차이 및 녛기
	@Override
	public int reserveDiff(ReserveVo rv) throws Exception {
		return dao.reserveDiff(rv);
	}

	@Override
	public int reserveDiffUser(int ucode) throws Exception {
		return dao.reserveDiffUser(ucode);
	}

	@Override
	public void reserveFixed(ReserveVo rv) throws Exception {
		dao.reserveFixed(rv);
	}

	@Override
	public int reserveFixedCnt(ReserveVo rv) throws Exception {
		return dao.reserveFixedCnt(rv);
	}

	@Override
	public int reserveDiffday(ReserveVo rv) throws Exception {
		return dao.reserveDiffday(rv);
	}

	///
	@Override
	public int pastDaySelectCnt() throws Exception {
		return dao.pastDaySelectCnt();
	}

	@Override
	public void reservePastInsert() throws Exception {
		dao.reservePastInsert();
	}

	@Override
	public void reWaitPastDelete() throws Exception {
		dao.reWaitPastDelete();
	}

	@Override
	public void refixedPastDelete() throws Exception {
		dao.refixedPastDelete();
	}

	/////////////////
	@Override
	public int MainDaySelectSeven() throws Exception {
		return dao.MainDaySelectSeven();
	}

	@Override
	public void MainDaySevenFixedInsert() throws Exception {
		dao.MainDaySevenFixedInsert();
	}

	@Override
	public void DeleteDuple() throws Exception {
		dao.DeleteDuple();
	}

	@Override
	public List<Room_info_main> MainPage_roomInfo() throws Exception {
		return dao.MainPage_roomInfo();
	}

	@Override
	public int recCheck(Map<String, Integer> map) throws Exception {
		return dao.recCheck(map);
	}

	@Override
	public void recUpdate(Map<String, Integer> map) throws Exception {
		dao.recUpdate(map);

	}

	@Override
	public void recDelete(Map<String, Integer> map) throws Exception {
		dao.recDelete(map);

	}

	@Override
	public int recCount(Integer rvcode) throws Exception {
		return dao.recCount(rvcode);
	}

	@Override
	public List<Integer> allreview_like(Integer rcode) throws Exception {
		return dao.allreview_like(rcode);
	}
//	메인페이지 최다 좋아요 리뷰 6개 출력 
	@Override
	public List<MostLikeReview> mostLikeReview() throws Exception {
		return dao.mostLikeReview();
	}

}

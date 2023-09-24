package kr.mycom.ojo.service;

import java.util.List;
import java.util.Map;

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

public interface RoomService {

	public List<Room_infoVo> listAll() throws Exception;

	public List<Room_infoVo> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public Room_infoVo read(Integer rcode) throws Exception;

	public Room_optVo readOpt(Integer rcode) throws Exception;

	public void register_imgVo(ReviewVo review) throws Exception;

	public void register_review(ReviewVo review) throws Exception;

	public List<ReviewVo> roomContent(Integer rcode) throws Exception;

	public List<Review_imgVo> readiImgVo(Integer rcode) throws Exception;

	public RoomDetailDTO RoomDetailDTO(Map<String, Integer> map) throws Exception;

	public void removeReview(Map<String, Integer> map) throws Exception;

	public List<Review_imgVo> readiImgVoSpecific(Map<String, Integer> map) throws Exception;

	public List<Room_info_main> MainPage_roomInfo() throws Exception;

	public void reserve_join(ReserveVo vo) throws Exception;

	public int reserve_count(ReserveVo vo) throws Exception; // 조인 되었나 카운트 세기

	// 그룹신청 취소
	public void reserve_undo(ReserveVo vo) throws Exception;

	public int reserveCnt(int rcode) throws Exception;

	// 날짜 차이
	int reserveDiff(ReserveVo rv) throws Exception;

	public int reserveDiffUser(int ucode) throws Exception;

	public void reserveFixed(ReserveVo rv) throws Exception;// insert reserveFixed

	public int reserveFixedCnt(ReserveVo rv) throws Exception;

	public int reserveDiffday(ReserveVo rv) throws Exception;

	///////////
	public int pastDaySelectCnt() throws Exception;// fixed테이블에서 지난날짜 카운트

	public void reservePastInsert() throws Exception;// past테이블에 지난 예약 정보 넣고

	public void reWaitPastDelete() throws Exception; // 지난 예약 wait테이블에서 지움

	public void refixedPastDelete() throws Exception; // 지난 예약 fixed테이블에서 지움
	//

	public int MainDaySelectSeven() throws Exception; // 7일 이하데이터 카운트

	public void MainDaySevenFixedInsert() throws Exception;// 7일 이하데이터 fixed테이블에 집어넣기

	public void DeleteDuple() throws Exception; // 중복데이터 삭제

	public int recCheck(Map<String, Integer> map) throws Exception;

	public void recUpdate(Map<String, Integer> map) throws Exception;

	public void recDelete(Map<String, Integer> map) throws Exception;

	public int recCount(Integer rvcode) throws Exception;

	public List<Integer> allreview_like(Integer rcode) throws Exception; /* 해당 가게의 리뷰들 rvcode */

	public List<MostLikeReview> mostLikeReview() throws Exception;

}

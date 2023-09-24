package kr.mycom.ojo.persistance;

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

public interface StudyRoomDao {

	public List<Room_infoVo> listAll() throws Exception;

	public List<Room_infoVo> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<ReviewVo> roomContent(Integer rcode) throws Exception;

	public void updateViewCnt(Integer rcode) throws Exception;

	public Room_infoVo read(Integer rcode) throws Exception;

	public Room_optVo readOpt(Integer rcode) throws Exception;

	public void insertImgVo(Review_imgVo imgvo) throws Exception;

	public void insertReview(ReviewVo reviewVo) throws Exception;

	public List<Review_imgVo> readiImgVo(Integer rcode) throws Exception;

	public RoomDetailDTO RoomDetailDTO(Map<String, Integer> map) throws Exception;

	public void removeReview(Map<String, Integer> map) throws Exception;

	public List<Review_imgVo> readiImgVoSpecific(Map<String, Integer> map);

	public void reserve_join(ReserveVo vo) throws Exception;

	public int reserve_count(ReserveVo vo) throws Exception; // 조인 되었나 카운트 세기

	// 그룹신청 취소
	public void reserve_undo(ReserveVo vo) throws Exception;

	public int reserveCnt(int rcode) throws Exception;

	// 날짜 차이
	public int reserveDiff(ReserveVo rv) throws Exception; // 해당유저의 방번호 cnt

	public int reserveDiffUser(int ucode) throws Exception;

	public void reserveFixed(ReserveVo rv) throws Exception;// insert reserveFixed

	public int reserveFixedCnt(ReserveVo rv) throws Exception; // 예약 고정된곳에 해당유저의 예약이 카운트 되는가를 가져옴

	public int reserveDiffday(ReserveVo rv) throws Exception;// 예약날짜와 현재 날짜의 차이 가져오기

	public int pastDaySelectCnt() throws Exception;// fixed테이블에서 지난날짜 카운트

	public void reservePastInsert() throws Exception;// past테이블에 지난 예약 정보 넣고

	public void reWaitPastDelete() throws Exception; // 지난 예약 wait테이블에서 지움

	public void refixedPastDelete() throws Exception; // 지난 예약 fixed테이블에서 지움

	public int MainDaySelectSeven() throws Exception; // 7일 이하데이터 카운트

	public void MainDaySevenFixedInsert() throws Exception;// 7일 이하데이터 fixed테이블에 집어넣기

	public void DeleteDuple() throws Exception; // 중복데이터 삭제

	public List<Room_info_main> MainPage_roomInfo() throws Exception;

	public int recCheck(Map<String, Integer> map) throws Exception;

	public void recUpdate(Map<String, Integer> map) throws Exception;

	public void recDelete(Map<String, Integer> map) throws Exception;

	public int recCount(Integer rvcode) throws Exception;

	public List<Integer> allreview_like(Integer rcode) throws Exception;

	public List<MostLikeReview> mostLikeReview() throws Exception;
}

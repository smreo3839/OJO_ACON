package kr.mycom.ojo.contoller;

import java.awt.event.ActionEvent;
import java.beans.PropertyChangeListener;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.Action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mycom.ojo.model.MemberVo;
import kr.mycom.ojo.model.PageMaker;
import kr.mycom.ojo.model.ReserveVo;
import kr.mycom.ojo.model.ReviewVo;
import kr.mycom.ojo.model.Review_imgVo;
import kr.mycom.ojo.model.Room_infoVo;
import kr.mycom.ojo.model.Room_info_main;
import kr.mycom.ojo.model.SearchCriteria;
import kr.mycom.ojo.model.WishVo;
import kr.mycom.ojo.service.RoomService;
import kr.mycom.ojo.service.WishService;

@Controller
@RequestMapping("/room/*")
public class StudyRoomController implements Action {

	private static final Logger logger = LoggerFactory.getLogger(StudyRoomController.class);

	private void deleteFiles(List<Review_imgVo> attachList) {// 05_30 파일삭제
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		logger.info("delete attach files...................");

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\ojo\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_"
						+ attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:\\ojo\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid()
							+ "_" + attach.getFileName());

					Files.delete(thumbNail);
				}

			} catch (Exception e) {
				logger.error("delete file error" + e.getMessage());
			} // end catch
		});// end foreachd
	}

	@Inject
	private RoomService service;
	@Inject
	RoomService rservice;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {// @ModelAttribute
		logger.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "room/list";
	}

	@RequestMapping(value = "/readDetail", method = RequestMethod.GET)
	public String readDetail(@RequestParam("rcode") Integer rcode, HttpServletRequest req, Model model, ReserveVo rv)
			throws Exception {
		Integer ucode;
		HttpSession session = req.getSession(false);
		MemberVo member;
		if (session.getAttribute("member") == null) {
			ucode = 0;
		} else {
			member = (MemberVo) session.getAttribute("member");
			ucode = member.getUcode();
			///
			rv.setUcode(ucode);
			int FixedCnt = rservice.reserveFixedCnt(rv); // fixed테이블에있는 해당유저 예약 카운트
			logger.info("FixedCnt---" + FixedCnt);
			int WaitCnt = rservice.reserveDiff(rv); // wait테이블에 있는 해당유저 예약 카운트
			logger.info("WaitCnt---" + WaitCnt + ' ' + rv.getRcode() + ' ' + rv.getUcode() + ' ' + rv.getRecode());
			if (WaitCnt > 0) { // wait테이블에 있는 해당유저 예약 카운트가 있으면
				int Waitdiffday = rservice.reserveDiffday(rv); // 현재 시스템 날짜와 예약된 날짜간의 차이를 가져옴
				logger.info("Waitdiffday---" + Waitdiffday);
				if (FixedCnt > 0) { // fixed테이블에 있으면 이미 고정되었기 때문에 아무것도 실행안함
				} else if (FixedCnt < 1 && Waitdiffday < 7) { // fixed테이블에 없고 날짜가7일보다 작으면
					rservice.reserveFixed(rv); // fixed테이블에 wait테이블에 있는거 넣음
				}
			}
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rcode", rcode);
		map.put("ucode", ucode);
		/*
		 * if(session != null) { MemberVo login =
		 * (MemberVo)session.getAttribute("member"); ucode = login.getUcode(); }else {
		 * ucode = 0; }
		 */

		model.addAttribute("Room_infoVo", service.read(rcode));
		model.addAttribute("Room_optVo", service.readOpt(rcode));
		model.addAttribute("roomContent", service.roomContent(rcode));
		model.addAttribute("RoomDetailDTO", service.RoomDetailDTO(map));
		model.addAttribute("imgVo", service.readiImgVo(rcode));
		model.addAttribute("imgVo_ucode", service.readiImgVoSpecific(map)); // 해당 유저가 올린 사진정보
		model.addAttribute("Allreview_like", service.allreview_like(rcode)); 
		return "room/readDetail";
	}

	@PostMapping("/readDetail")
	public String regist(ReviewVo review_Vo, RedirectAttributes rttr, HttpServletRequest request, Model model)
			throws Exception {
		if (review_Vo.getImgdataList() != null) {
			review_Vo.getImgdataList().forEach(attach -> System.out.println(attach));
		}
		String old_url = request.getHeader("referer");
		service.register_review(review_Vo);
		service.register_imgVo(review_Vo);
		return "redirect:" + old_url;

	}

	@GetMapping("/removeReview")
	public String removeReview(@RequestParam("rcode") Integer rcode, HttpServletRequest req) throws Exception {
		System.out.println(rcode);
		Integer ucode;
		HttpSession session = req.getSession(false);
		MemberVo member = (MemberVo) session.getAttribute("member");
		ucode = member.getUcode();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rcode", rcode);
		map.put("ucode", ucode);
		deleteFiles(service.readiImgVoSpecific(map));// 실제이미지 삭제하기위해 해당 가게의 해당 유저가 업로드한 파일 정보 리스트를 불러와 삭제 진행
		service.removeReview(map);
		String old_url = req.getHeader("referer");
		return "redirect:" + old_url;
	}

	@PostMapping("/RecUpdate")
	public void recUpdate(@RequestParam("rvcode") int rvcode, @RequestParam("ucode") int ucode,
			@RequestParam("rcode") int rcode) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rvcode", rvcode);
		map.put("ucode", ucode);
		map.put("rcode", rcode);
		System.out.println("RecUpdate : " + rvcode);
		System.out.println("RecUpdate : " + ucode);
		System.out.println("RecUpdate : " + rcode);
		int count = service.recCheck(map);
		if (count == 0) { // 추천하지 않았다면 추천 추가
			service.recUpdate(map);
		} else { // 추천을 하였다면 추천 삭제
			service.recDelete(map);
		}
	}

	@PostMapping("/RecCount")
	public void recCount(@RequestParam("rvcode") Integer rvcode, HttpServletResponse res) throws Exception {
		System.out.println("RecCount실행");
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		int count = service.recCount(rvcode);
		out.println(count);
		out.close();
	}

	// 예약 등록
	@RequestMapping(value = "/reserve_join", method = RequestMethod.GET)
	public void reserveGET(Model model) throws Exception {

	}

	@RequestMapping(value = "/reserve_join", method = RequestMethod.POST)
	public String reservePOST(RedirectAttributes rttr, ReserveVo rv, HttpSession session, Model model,
			@RequestParam("rcode") int rcode) throws Exception {
		int rcnt = service.reserveCnt(rcode);
		int i = service.reserve_count(rv);

		/////
		Integer ucode;
		MemberVo member;

		member = (MemberVo) session.getAttribute("member");
		ucode = member.getUcode();
		int WaitCnt = rservice.reserveDiffUser(ucode);

		if (WaitCnt > 2) {
			rttr.addFlashAttribute("msg", "FailThree");
		} else if (i > 0) {
			rttr.addFlashAttribute("msg", "Fail");
		} else if (rcnt == 1) {
			rttr.addFlashAttribute("msg", "Failfull");
		} else {
			service.reserve_join(rv);
			// rttr.addFlashAttribute("msg", "set");
			int Waitdiffday = rservice.reserveDiffday(rv);// 날짜차이
			if (Waitdiffday <= 0) { // 현재날짜보다 이전날짜면
				rttr.addFlashAttribute("msg", "PastdayNotReserve");// 지난날짜 신청 못함
				service.reserve_undo(rv); // 넣은거 다시 삭제
			} else {
				rttr.addFlashAttribute("msg", "SUCCESS");
			}
		}
		return "redirect:/room/reserve_join?rcode=" + rcode;
	}

	@RequestMapping(value = "/reserve_undo", method = RequestMethod.GET)
	public String dJoinGET(@RequestParam("rcode") int rcode, ReserveVo rv, RedirectAttributes rttr, HttpSession session)
			throws Exception {

		int i = service.reserve_count(rv); // wait테이블에 갯수
		//
		int ucode = (int) session.getAttribute("userCode");
		int diffCnt = rservice.reserveFixedCnt(rv); // fixed테이블에 갯수

		logger.info("register post................" + i);
		if (diffCnt > 0) {
			rttr.addFlashAttribute("msg", "DoNotDelete");// 취소불가
		} else if (diffCnt < 1 && i > 0) { // fixed테이블에 카운트 되는게 없고, wait테이블에 있다면
			rttr.addFlashAttribute("msg", "delete_join");
			service.reserve_undo(rv);
		} else {
			rttr.addFlashAttribute("msg", "null_join");
		}

		return "redirect:/room/reserve_join?rcode=" + rcode;
	}

	@Inject
	WishService wservice;

	@PostMapping(value = "/wish")
	@ResponseBody
	public void sendWish(HttpServletRequest req, WishVo wvo) {
		String ucode = req.getParameter("ucode");
		String rcode = req.getParameter("rcode");
		String status = req.getParameter("status");

		System.out.println("유저코드 " + ucode + "룸 번호입니다" + rcode + "<<<");
		System.out.println("status >>>>>>" + status);
		System.out.println(">>>>>>>>>>>" + ucode + " " + rcode);

		if (status.equals("full")) {
			System.out.println("AddWish >>>>>>" + status);
			wvo.setUcode(Integer.parseInt(ucode));
			wvo.setRcode(Integer.parseInt(rcode));
			wservice.createWish(wvo);

		} else {
			System.out.println("DeleteWish>>>>>>" + status);
			wvo.getUcode();
			wvo.getRcode();
			wservice.deleteWish(wvo);
		}

	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addPropertyChangeListener(PropertyChangeListener listener) {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getValue(String key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void putValue(String key, Object value) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removePropertyChangeListener(PropertyChangeListener listener) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setEnabled(boolean b) {
		// TODO Auto-generated method stub

	}

}

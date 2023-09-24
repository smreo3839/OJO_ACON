package kr.mycom.ojo.contoller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.Group_join;
import kr.mycom.ojo.model.PageMaker;
import kr.mycom.ojo.model.SearchCriteria;
import kr.mycom.ojo.service.GroupService;

@Controller
@RequestMapping("/group/*")
public class GroupController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Inject
	private GroupService service;

	@RequestMapping("/view") // 그룹코드를 읽어서 해당 게시물 상세보기
	public String view(HttpSession session, @RequestParam("gcode") int gcode, Model model) {
		try {
			int cnt = service.groupCnt(gcode);
			int scnt = service.groupSignCnt(gcode);
			GroupVo vo = service.read(gcode);
			model.addAttribute("view", vo);
			//
			model.addAttribute("scnt", scnt);
			model.addAttribute("cnt", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "group/view";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		try {
			logger.info("list post....");
			model.addAttribute("list", service.listSearchCriteria(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listSearchCount(cri));
			model.addAttribute("pageMaker", pageMaker);

			/* model.addAttribute("list",service.JoinNameID()); */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "group/list";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registGET() throws Exception {
		logger.info("regist get ...........");
		return "group/registerForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(GroupVo vo, RedirectAttributes rttr) throws Exception {
		logger.info("regist post ...........");
		logger.info(vo.toString());

		service.regist(vo);
		return "redirect:/group/list";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET) // 그룹코드를 읽어서(get방식으로) 그 해당 수정폼 뿌려주기
	public String modifyGET(@RequestParam("gcode") int gcode, Model model) throws Exception {
		model.addAttribute(service.read(gcode));
		return "group/modifyForm";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST) // save를 누르면 post방식으로 list로 redirect
	public String modifyPOST(GroupVo board, RedirectAttributes rttr) throws Exception {
		logger.info("modify post............");
		service.modify(board);
		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());
		return "redirect:/group/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeGET(@RequestParam("gcode") int gcode, @ModelAttribute("gcode") int m) throws Exception {
		service.remove(gcode);
		return "group/remove";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGET(Model model) throws Exception {
		return "group/groupJoin";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(RedirectAttributes rttr, Group_join gj, HttpSession session, Model model,
			@RequestParam("gcode") int gcode) throws Exception {
		int cnt = service.groupCnt(gcode);
		int scnt = service.groupSignCnt(gcode);
		int i = service.selectjoin(gj);
		logger.info("register post................" + i);
		if (i > 0) {
			rttr.addFlashAttribute("msg", "Fail");
		} else if (cnt - 1 < scnt) {
			rttr.addFlashAttribute("msg", "Failfull");
		} else {
			rttr.addFlashAttribute("msg", "SUCCESS");
			service.group_join(gj);
		}
		return "redirect:/group/join?gcode=" + gcode;
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String dJoinGET(@RequestParam("gcode") int gcode, Group_join gj, RedirectAttributes rttr) throws Exception {

		int i = service.selectjoin(gj);
		logger.info("register post................" + i);
		if (i > 0) {
			rttr.addFlashAttribute("msg", "delete_join");
			service.delete_join(gj);
		} else {
			rttr.addFlashAttribute("msg", "null_join");
		}

		return "redirect:/group/join?gcode=" + gcode;
	}

}
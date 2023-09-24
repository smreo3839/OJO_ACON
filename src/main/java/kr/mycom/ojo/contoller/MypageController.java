package kr.mycom.ojo.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.mycom.ojo.model.GroupVo;
import kr.mycom.ojo.model.Group_join;
import kr.mycom.ojo.model.MemberVo;
import kr.mycom.ojo.model.ReserveVo;
import kr.mycom.ojo.model.ReserveVo_rcode;
import kr.mycom.ojo.model.Room_infoVo;
import kr.mycom.ojo.model.SignupVo;
import kr.mycom.ojo.service.GroupService;
import kr.mycom.ojo.service.MemberService;
import kr.mycom.ojo.service.MyPageService;
import kr.mycom.ojo.service.ReserveService;
import kr.mycom.ojo.service.RoomService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Inject
	MyPageService pservice;
	MemberService service;
	GroupService gservice;
	RoomService rservice;

	@RequestMapping("/main")
	public void mypage(Model model, HttpServletRequest req) throws Exception {
		logger.info("mypage main....1234");

		HttpSession session = req.getSession(true);

		int ucode = (int) session.getAttribute("userCode");

		List<GroupVo> list = pservice.listAll(ucode);
		model.addAttribute("li", list);

		List<ReserveVo> rlist = pservice.listR(ucode);
		model.addAttribute("reserve", rlist);

		List<Room_infoVo> wlist = pservice.listW(ucode);
		model.addAttribute("room", wlist);
		List<ReserveVo_rcode> flist = pservice.listf(ucode);
		model.addAttribute("Reserve_past", flist);
		model.addAttribute("userInformation", pservice.userInformation(ucode));
		
		List<Group_join> jlist = pservice.listJ(ucode);
		model.addAttribute("myRegList", jlist);
		
		//관리자인지
		int i = pservice.administer(ucode);
		model.addAttribute("admin", i);
	}

	@RequestMapping(value = { "/mylist", "/mywish", "/viewReserve" })
	public void mylist(HttpSession session, Model model, GroupVo vo) throws Exception {
		logger.info("mylist.....");
		int ucode = (int) session.getAttribute("userCode");

		List<GroupVo> list = pservice.listAll(ucode);
		List<Room_infoVo> wlist = pservice.listW(ucode);
		List<ReserveVo> rlist = pservice.listR(ucode);
		
		
		model.addAttribute("reserve", rlist);
		model.addAttribute("li", list);
		model.addAttribute("room", wlist);
	}
	
	@RequestMapping(value= {"/myRegList"})
	public void myRegList(HttpSession session,Model model, GroupVo vo) throws Exception
	{
		logger.info("myReglist.....");
		int ucode =(int)session.getAttribute("userCode");
		
		List<Group_join> jlist = pservice.listJ(ucode);
		model.addAttribute("myRegList", jlist);
	}

	@RequestMapping("/memberlist")
	public void memberlist(HttpSession session, Model model, @RequestParam("gcode") int gcode) throws Exception {
		List<SignupVo> slist = pservice.listS(gcode);
		model.addAttribute("memberin", slist);
	}

	@GetMapping("/qrcode")
	public void qrcode(@RequestParam("ucode") int ucode, @RequestParam("rcode") Integer rcode,
			HttpServletResponse res) throws IOException {
		logger.info("mypage qrcode....");
		System.out.println("qrcode : " + ucode);
		System.out.println("qrcode : " + rcode);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("ucode", ucode);
		map.put("rcode", rcode);
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (pservice.selectReserve_past(map) == 0) {
			out.println("<script>");
			out.println("alert('사용이 만료된 QR코드입니다');");
			out.println("window.open('about:blank','_parent').parent.close();");
			out.println("</script>");
			out.close();
		} else {
			pservice.AccumulatedPoint(map);
			out.println("<script>");
			out.println("alert('포인트가 지급되었습니다');");
			out.println("window.open('about:blank','_parent').parent.close();");
			out.println("</script>");
			out.close();
		}
	}
}

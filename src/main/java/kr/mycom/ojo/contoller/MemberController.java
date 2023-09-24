package kr.mycom.ojo.contoller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mycom.ojo.model.MailSend;
import kr.mycom.ojo.model.MemberVo;
import kr.mycom.ojo.model.ReserveVo;
import kr.mycom.ojo.service.MemberService;
import kr.mycom.ojo.service.RoomService;
import kr.mycom.ojo.service.WishService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Inject
	MemberService service;
	@Inject
	RoomService rservice;

	// �쉶�썝媛��엯
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() {
		logger.info("regist get ...........");
		return "member/registerForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MemberVo vo) throws Exception {
		logger.info("regist post ...........");
		logger.info(vo.toString());
		vo.setApproval_key(service.create_key());
		service.regist(vo);
		
		MailSend ms = new MailSend();
		ms.MailSend(vo);
		return "redirect:/member/varifyForm";
	}

	
	@PostMapping(value="/check_id")
	@ResponseBody
	public int checkid(HttpServletRequest req) throws Exception 
	{
		logger.info("post idCheck");
		
		String userid = req.getParameter("uid");
		MemberVo idcheck = service.checkId(userid); 
		int result = 0;
		
		if(idcheck != null) {
			result = 1;
		}
		
		return result;
	}
	
	// �쉶�썝媛��엯�셿猷�
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success(MemberVo vo) throws Exception {
		logger.info("success get ...........");
		logger.info(vo.toString());

		return "/member/success";
	}
	
	@RequestMapping(value = "/success", method = RequestMethod.POST)
	public String postSuccess(MemberVo vo) throws Exception {
		logger.info("success POST ...........");
		logger.info(vo.toString());
		if(service.approved(vo)== 0) {
			service.approval_member(vo);
			
			return "/member/success";
		}else {
			return "/member/approved";
		}
		
	}
	
	@RequestMapping(value = "/approved", method = RequestMethod.GET)
	public String getApproved(MemberVo vo, HttpServletResponse res) throws Exception {
		logger.info("approved get ...........");
		
		return "/member/approved";
	}
	@RequestMapping(value = "/approved", method = RequestMethod.POST)
	public String approved(MemberVo vo) throws Exception {
		logger.info("approved get ...........");
		
		return "/member/approved";
	}
	
	@RequestMapping(value = "/varifyForm", method = RequestMethod.GET)
	public String varify() throws Exception {
		logger.info("varify get ...........");

		return "/member/varifyForm";
	}
	
	
	
	

	// �쉶�썝 濡쒓렇�씤
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception {
		logger.info("login get ...........");

		return "member/loginForm";
	}
	
	@Inject
	WishService wservice;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVo vo, HttpServletRequest req, RedirectAttributes rttr,HttpServletResponse res,ReserveVo rv) throws Exception {
		logger.info("regist post ...........");
		logger.info(vo.toString());

		HttpSession session = req.getSession(true);
		MemberVo login = service.login(vo);

		if (login != null) {
			int  getStatus= login.getApproval_status();
			System.out.println(">>>>>>>>>>>>>>>>>>>status "+ getStatus);
			if(getStatus == 0) {
				res.setContentType("text/html;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("alert('이메일 인증 후 이용해 주세요');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}else {
				session.setAttribute("member", login);
				session.setAttribute("userCode", login.getUcode());
				rttr.addFlashAttribute("loginSucces", true);
				////
		         int ucode = login.getUcode();// 濡쒓렇�씤�빐�꽌 usercode瑜� 媛��졇�샂
		         rv.setUcode(ucode);
		         int FixedCnt = rservice.reserveFixedCnt(rv); // fixed�뀒�씠釉붿뿉�엳�뒗 �빐�떦�쑀�� �삁�빟 移댁슫�듃
		         int WaitCnt = rservice.reserveDiff(rv); // wait�뀒�씠釉붿뿉 �엳�뒗 �빐�떦�쑀�� �삁�빟 移댁슫�듃
	
		         if (WaitCnt > 0) { // wait�뀒�씠釉붿뿉 �엳�뒗 �빐�떦�쑀�� �삁�빟 移댁슫�듃媛� �엳�쑝硫�
		            int Waitdiffday = rservice.reserveDiffday(rv); // �쁽�옱 �떆�뒪�뀥 �궇吏쒖� �삁�빟�맂 �궇吏쒓컙�쓽 李⑥씠瑜� 媛��졇�샂
		            if (FixedCnt > 0) { // fixed�뀒�씠釉붿뿉 �엳�쑝硫� �씠誘� 怨좎젙�릺�뿀湲� �븣臾몄뿉 �븘臾닿쾬�룄 �떎�뻾�븞�븿
		            } else if (FixedCnt < 1 && Waitdiffday < 7) { // fixed�뀒�씠釉붿뿉 �뾾怨� �궇吏쒓�7�씪蹂대떎 �옉�쑝硫�
		               rservice.reserveFixed(rv); // fixed�뀒�씠釉붿뿉 wait�뀒�씠釉붿뿉 �엳�뒗嫄� �꽔�쓬
		            }
		         }
		         int i = service.alert(login.getUcode());
		         
		         if(i==1) {
		        	 
		        	 res.setContentType("text/html;charset=utf-8");
						PrintWriter out = res.getWriter();
						out.println("<script>");
						out.println("alert('블랙리스트 대상자 입니다. 사이트 이용이 제한 되었습니다. ');");
						session.setAttribute("member", null);
						rttr.addFlashAttribute("loginSucces", false);
						out.println("window.location = document.referrer;");
						 out.println("</script>");
						 out.close();
		         }
		         
	         }
			
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);

			return "redirect:/member/login";
		}

		return "redirect:/";
	}
	
	
///////////Searching for ID////////////////
@RequestMapping(value="/searchID")
public String getSearchIDForm() throws Exception {
	logger.info("get serachID Page...........");
	
	return "member/searchID";
}


@RequestMapping(value="/findId")
public String getfindId() throws Exception {
	logger.info("get findId Page...........");
	
	return "member/findId";
}
@PostMapping(value="/searchID")
public String SearchID(HttpServletResponse response,MemberVo vo,@RequestParam("email") String email, @RequestParam("name") String name, Model model) throws Exception {
	logger.info("searching ID .......");
	
	
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	String id = service.findId(vo);
	System.out.println(">>>>>>>>>>>>" + id);
	model.addAttribute("mailByid", id);
	
	
	if(id== null) {

		out.println("<script>");
		out.println("alert('가입된 아이디가 없습니다')");
		out.println("history.go(-1)");			
		out.println("</script>");
		out.close();
	}
	
	return "member/findId";
}


/////////////////Searching for PW ///////////////////////
@RequestMapping(value="/tempPw")
public String tempPw(){
logger.info("get tempPw Page...........");

return "member/tempPw";
}


@RequestMapping(value="/searchPw",  method = RequestMethod.GET)
public void getSearchPwForm() throws Exception {
	logger.info("get serachPw Page...........");
}

@PostMapping(value="/searchPw")
public String postSearchPwForm
(HttpServletResponse response,MemberVo vo,@RequestParam("uid") String uid, @RequestParam("email") String email,Model model) throws Exception {
	logger.info("post serachPw Page...........");
	System.out.println(vo);
	
		String pw ="";
		for (int i=0; i <12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		vo.setPwd(pw);
		service.updatepw(vo);

		MailSend mailpwd = new MailSend();
		mailpwd.MailSendForPw(vo);
		return "member/tempPw";
	
	
}

	
	

	// 濡쒓렇�븘�썐
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("member");
		session.removeAttribute("userCode");
		return "redirect:/";
	}

	// �쉶�썝�젙蹂� �닔�젙
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET() throws Exception {
		logger.info("modify get ...........");

		return "member/modifyForm";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(HttpSession session, MemberVo vo, SessionStatus status) throws Exception {
		logger.info("modify post ...........");
		logger.info(vo.toString());

		service.update(vo);
		status.setComplete();
		MemberVo login = service.login(vo);
		session.setAttribute("member", login);
		return "redirect:/";
	}

	// �쉶�썝�깉�눜
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public String withdrawal(HttpSession session, MemberVo vo, RedirectAttributes rttr) throws Exception {
		logger.info(vo.toString());
		vo = (MemberVo) session.getAttribute("member");
		session.removeAttribute("member");
		service.withdrawal(vo);

		return "member/withdrawal";
	}

}
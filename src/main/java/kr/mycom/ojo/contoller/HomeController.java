package kr.mycom.ojo.contoller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.mycom.ojo.service.RoomService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	RoomService rservice;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		///
		int day7;
		try {
			day7 = rservice.MainDaySelectSeven(); // 7일 이하데이터 카운트
			if (day7 <= 0) {
				// 아무것도 실행안함
			} else {
				rservice.MainDaySevenFixedInsert(); // 7일 이하데이터 fixed테이블에 집어넣기
				rservice.DeleteDuple();
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		int passday;
		try {
			model.addAttribute("MainPage_roomInfo", rservice.MainPage_roomInfo());
			model.addAttribute("mostLikeReview", rservice.mostLikeReview());
			passday = rservice.pastDaySelectCnt(); // fixed 테이블에서 지난날짜 카운트해서
			if (passday > 0) { // 존재하면
				rservice.reservePastInsert(); // past테이블에 넣고
				rservice.reWaitPastDelete(); // 지난 예약 wait테이블에서 지움
				rservice.refixedPastDelete(); // 지난 예약 fixed테이블에서 지움
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping("test")
	public String home2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index2";
	}
}

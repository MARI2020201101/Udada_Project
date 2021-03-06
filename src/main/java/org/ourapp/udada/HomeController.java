package org.ourapp.udada;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.ourapp.udada.HomeService;
import org.ourapp.udada.challenge.ChallengeController;
import org.ourapp.udada.foodmy.FoodMyResultDTO;
import org.ourapp.udada.foodmy.FoodMyService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final HomeService homeService;
	private final FoodMyService foodMyService;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Authentication auth) throws Exception {
		
		String mEmail=auth.getName();
		
		List<HotJournalDTO> jList = homeService.getHotJournal();
		List<EndSoonChallengeDTO> cList = homeService.endSoonChallenge();
		List<HighRateRecipeDTO> rList = homeService.highRateRecipe();
		int getMyExcs = homeService.getMyExcs(mEmail);
		Double getBmi = homeService.getBmi(mEmail);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate = new Date();
		String today = sdf.format(newDate);

		Map<String,Object> foodKcal = foodMyService.getDayTotalWithRecommend(today, mEmail);	
		
		model.addAttribute("foodKcal", foodKcal); 
		model.addAttribute("jList", jList);
		model.addAttribute("cList", cList);
		model.addAttribute("rList", rList);
		model.addAttribute("getMyExcs", getMyExcs);
		model.addAttribute("getBmi", getBmi);
		
		
	return "/index";
	}

}

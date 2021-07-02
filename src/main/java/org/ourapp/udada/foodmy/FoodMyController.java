package org.ourapp.udada.foodmy;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
public class FoodMyController {
	
	private final FoodMyService foodMyService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member/foodMy")
	public void getList(Authentication auth, Model model ,@RequestParam(required = false) String day) throws Exception{
		
		String today = "";
		if(day!=null) {
			if(isValidDate(day)) today = day;
		}else {
		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date newDate = new Date();
			today = sdf.format(newDate);
		}
		
		String mEmail = auth.getName();
		List<FoodMyResultDTO> list = foodMyService.getList(today, mEmail);
		//FoodMyDayTotalDTO dayTotalDTO = foodMyService.getDayTotal(day, mEmail);
		Map<String,Object> map = foodMyService.getDayTotalWithRecommend(today, mEmail);	
		
		
		log.info("list : " + list);
		log.info("map : " + map);
		
		model.addAttribute("list", list);
		//model.addAttribute("dayTotalDTO", dayTotalDTO);
		model.addAttribute("map", map);
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping( value = "/modifyFoodMy", consumes="application/json" , produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> modifyFoodMy(@RequestBody Map<String, String> params)throws Exception {
		log.info("foodMyDTO params: " + params);
		Long fmNo = Long.parseLong(params.get("fmNo"));
		int fmAmount = Integer.parseInt(params.get("fmAmount"));

		FoodMyDTO foodMyDTO = FoodMyDTO.builder().fmAmount(fmAmount).fmNo(fmNo).build();
		log.info("foodMyDTO : " + foodMyDTO);
		foodMyService.modify(foodMyDTO);

	  return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping( value = "/removeFoodMy", consumes="application/json" , produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> removeFoodMy(@RequestBody Map<String, String> params)throws Exception {
		log.info("foodMyDTO params: " + params);
		Long fmNo = Long.parseLong(params.get("fmNo"));

		foodMyService.delete(fmNo);
	  return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	private boolean isValidDate(String day) {
		  SimpleDateFormat dateFormatParser = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);

		  dateFormatParser.setLenient(false);
		  try {
		      dateFormatParser.parse(day);
		      return true;
		  } catch (Exception e) {
		      return false;
		  }
		}

}

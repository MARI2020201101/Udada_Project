package org.ourapp.udada.food;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.ourapp.udada.foodmy.FoodMyDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/food")
public class FoodController {
	
	private final FoodService foodService;
	
	
	@GetMapping("/list")
	public String getMjList(Model model) throws Exception{
		log.info("Food_MjListController.......................");
		
		List<FoodDTO> list = foodService.getList();
		model.addAttribute("list", list);
		
		return "food/list";
		
	}
	
	@GetMapping("/MinClassPage")
	public void getMinList(Model model, String fMjclass) throws Exception{
		
		log.info("Food_MinListController.......................");
		
		List<FoodDTO> Minlist = foodService.getMinList(fMjclass);
		
		model.addAttribute("Minlist", Minlist);
		
	}
	
	@GetMapping("/FoodInfo")
	public void getNameList(Model model, String fNo) throws Exception{
		
		log.info("Food_NameListController.......................");
		
		FoodDTO dto = foodService.getFoodList(fNo);
		log.info("Foodlist : "+dto);
		model.addAttribute("dto", dto);
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/registerFoodMy", consumes="application/json" , produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> registerFoodMy(@RequestBody Map<String, String> params)throws Exception {
			log.info("foodMyDTO params: " + params);
			String fNo = params.get("fNo");
			String mEmail = params.get("mEmail");
			int fmAmount = Integer.parseInt(params.get("fmAmount"));
			String fmDate = params.get("fmDate");
			if (fmDate=="" || fmDate==null) {
				
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				  Date date = new Date(); 
				  String today = sdf.format(date);
				  fmDate = today;
				 
			}

			FoodMyDTO foodMyDTO = FoodMyDTO.builder().fmAmount(fmAmount).mEmail(mEmail).fNo(fNo).fmDate(fmDate).build();
			log.info("foodMyDTO : " + foodMyDTO);
			foodService.registerFoodMy(foodMyDTO);
		  
		  return new ResponseEntity<>("success", HttpStatus.OK);
		}
	
}

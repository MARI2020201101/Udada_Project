package org.ourapp.udada.food;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequiredArgsConstructor
public class FoodDetailController {
	
	private final FoodDetailService foodDetailService;
	
	@ResponseBody
	@GetMapping("/food/foodname")
	public List<FoodDetailDTO> getNameList(FoodDetailDTO foodDetailDTO) throws Exception{
		

		/*
		List<FoodDetailDTO> foodDetailList = foodDetailService.getFoodList(fMinclass);
		
		model.addAttribute("foodDetailList", foodDetailList);
		
		
		String fName = params.get("fName");
		String fMinclass = params.get("fMinclass");*/
		
		//FoodDetailDTO foodDetailDTO = FoodDetailDTO.builder().fName(fName).fMinclass(fMinclass).build();
		
		List<FoodDetailDTO> list = foodDetailService.getNameList(foodDetailDTO);
		
		log.info(list);
		
		//return new ResponseEntity<>("success", HttpStatus.OK);
		
		return list;
		
	}

}

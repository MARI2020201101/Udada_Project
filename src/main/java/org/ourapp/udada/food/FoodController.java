package org.ourapp.udada.food;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/food")
public class FoodController {
	
	private final FoodService foodService;
	
	@GetMapping("/list")
	public void getList(Model model, FoodCriteria FCri) throws Exception{
		log.info("Food_MjListController.......................");
		
		List<FoodDTO> list = foodService.getList(FCri);	
		model.addAttribute("list", list);
		
		FoodPageMaker pageMaker = new FoodPageMaker();
		pageMaker.setFCri(FCri);
		pageMaker.setTotalCount(foodService.foodCount(FCri));
		
		//list.stream().map(r->r.getRTitle()).forEach(System.out::println);		
	}
	
	@GetMapping("/read")
	public void get(String fNo, Model model) throws Exception{
		
		log.info("read_FoodDetail.......................");
		
		model.addAttribute("dto", foodService.read(fNo));
		
	}
	
}

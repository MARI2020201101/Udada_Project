package org.ourapp.udada.food;

import java.util.List;

import org.springframework.security.core.Authentication;
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
	public void getMjList(Model model) throws Exception{
		log.info("Food_MjListController.......................");
		
		List<FoodDTO> list = foodService.getList();
			
		model.addAttribute("list", list);
		
		/*int total = foodService.countAllWithSearch(pageRequestDTO);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));*/
		
		//List<FoodDTO> list = foodService.getListWithPagingAndSearch(pageRequestDTO);
		//list.stream().map(r->r.getRTitle()).forEach(System.out::println);		
		
	}
	
	@GetMapping("/MinClassPage")
	public void getMinList(Model model, String fMjclass) throws Exception{
		
		log.info("Food_MinListController.......................");
		
		List<FoodDTO> Minlist = foodService.getMinList(fMjclass);
		
		model.addAttribute("Minlist", Minlist);
		
	}
	
	@GetMapping("/FoodInfo")
	public void getNameList(Model model, String fMinclass) throws Exception{
		
		log.info("Food_NameListController.......................");
		
		List<FoodDTO> Foodlist = foodService.getFoodList(fMinclass);
		
		model.addAttribute("Foodlist", Foodlist);
		
	}
	
	@GetMapping("/read")
	public void get(String fNo, Model model) throws Exception{
		
		log.info("read_FoodDetail.......................");
		
		model.addAttribute("dto", foodService.read(fNo));
		
	}
	
}

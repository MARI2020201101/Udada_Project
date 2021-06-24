package org.ourapp.udada.food;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/food")
public class FoodController {
	
	private final FoodService foodService;
	
	/*
	 * @GetMapping("/Food_Soups") public void getFood_Soups(Model model) {
	 * 
	 * List<FoodDTO> list = foodService.getFood_Soups(); model.addAttribute("list",
	 * list);
	 * 
	 * }
	 */
	
	@GetMapping("/list")
	public void getList(Model model) throws Exception{
		log.info("Food_MjListController.......................");
		
		List<FoodDTO> list = foodService.getList();	
		model.addAttribute("list", list);
		
		//list.stream().map(r->r.getRTitle()).forEach(System.out::println);		
	}
	
	@GetMapping("/Mn_list")
	public void getMn_List(String fMjclass, Model model) throws Exception{
		log.info("Food_MnController.......................");
		
		List<FoodDTO> Mn_list = foodService.getMn_List(fMjclass);	
		model.addAttribute("Mn_list", Mn_list);
		
		//list.stream().map(r->r.getRTitle()).forEach(System.out::println);		
	}
	
}

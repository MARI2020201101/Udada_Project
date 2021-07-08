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
	public String getMjList(Model model) throws Exception{
		log.info("Food_MjListController.......................");
		
		//List<FoodDTO> list = foodService.getList();
		//model.addAttribute("list", list);
		//List<FoodDTO> list = foodService.MjPagination(pageRequestDTO);
		//list.stream().map(r->r.getRTitle()).forEach(System.out::println);	
		
		/*List<FoodDTO> list = foodService.MjPagination(pageRequestDTO);
		model.addAttribute("list", list);
		
		PageRequestDTO pageRequestDTO
		
		int total = foodService.countAllWithSearch(pageRequestDTO);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));*/
		
		//model.addAttribute("list", foodService.getList(cri));
		
		/*
		 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
		 * pageMaker.setTotalCount(foodService.countAll());
		 */
		
		
		
		//model.addAttribute("pageMaker", pageMaker);
		
		return "food/list";
		
	}
	
	/*
	@GetMapping("/list")
	public void getMjList(PagingDTO pagingDTO, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		int total = foodService.countAll();
		
		if(nowPage == null && cntPerPage == null) {
			
			nowPage = "1";
			cntPerPage = "5";
			
		}
		else if(nowPage == null) {
			nowPage = "1";
		}
		else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		
		pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<FoodDTO> list = foodService.MjPagination(pagingDTO);
		
		model.addAttribute("Paging", pagingDTO);
		model.addAttribute("list", list);
		
		//return "redirect:/food/list";
		
	}*/
	
	@GetMapping("/MinClassPage")
	public void getMinList(Model model, String fMjclass) throws Exception{
		
		log.info("Food_MinListController.......................");
		
		//List<FoodDTO> Minlist = foodService.getMinList(fMjclass);
		
		//model.addAttribute("Minlist", Minlist);
		
	}
	
	/**/
	@GetMapping("/FoodInfo")
	public void getNameList(Model model, String fNo) throws Exception{
		
		log.info("Food_NameListController.......................");
		
		//FoodDTO dto = foodService.getFoodList(fNo);
		//log.info("Foodlist : "+dto);
		//model.addAttribute("dto", dto);
		
	}
	
	
	/*
	 * @GetMapping("/read") public void get(String fNo, Model model) throws
	 * Exception{
	 * 
	 * log.info("read_FoodDetail.......................");
	 * 
	 * model.addAttribute("dto", foodService.read(fNo));
	 * 
	 * }
	 */
	
	/*
	 * @GetMapping("/foodname") public void getFoodnameList(Model model, String
	 * fMinclass) throws Exception{
	 * 
	 * List<FoodDTO> Foodlist = foodService.getFoodList(fMinclass);
	 * 
	 * }
	 */
	
}

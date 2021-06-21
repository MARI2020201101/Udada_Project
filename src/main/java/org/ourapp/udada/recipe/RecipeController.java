package org.ourapp.udada.recipe;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/recipe")
public class RecipeController {
	
	private final RecipeService recipeService;
	
	@GetMapping("/list")
	public void getList(Model model , PageRequestDTO pageRequestDTO) throws Exception{
		log.info("recipeController.......................");
		
		//List<RecipeDTO> list = recipeService.getList();	
		
		List<RecipeDTO> list = recipeService.getListWithPaging(pageRequestDTO);
		model.addAttribute("list", list);
		int total = recipeService.countAll();
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
		
		//list.stream().map(r->r.getRTitle()).forEach(System.out::println);		
	}
	
	@GetMapping("/read")
	public void get(Long rNo, Model model, PageRequestDTO pageRequestDTO) throws Exception{
		log.info("read.......................");
		//model.addAttribute("dto", recipeService.get(rNo));
		//model.addAttribute("dto", recipeService.getWithIngredient(rNo));
		model.addAttribute("dto", recipeService.getWithIngredientAndFood(rNo));
	}
	
	@GetMapping("/register")
	public void registerForm(){
	}
	
	@PostMapping("/register")
	public String register(RecipeDTO recipeDTO , RedirectAttributes rttr) throws Exception{
		
		log.info("register..........................");
		log.info(recipeDTO);
		//recipeService.register(recipeDTO);
		recipeService.registerWithIngredient(recipeDTO);
		rttr.addFlashAttribute("msg", "레시피가 등록되었습니다.");
		
		return "redirect:/recipe/list";
	}
	
	@GetMapping("/modify")
	public void modifyForm(Long rNo, Model model , PageRequestDTO pageRequestDTO) throws Exception{
		model.addAttribute("dto", recipeService.getWithIngredientAndFood(rNo));
	}
	@PostMapping("/modify")
	public String modify(RecipeDTO recipeDTO, Model model, RedirectAttributes rttr ,PageRequestDTO pageRequestDTO) throws Exception{
		log.info(recipeDTO);
		//recipeService.modify(recipeDTO);
		recipeService.modifyWithIngredient(recipeDTO);
		rttr.addFlashAttribute("msg","레시피가 수정되었습니다. ");

		return "redirect:/recipe/read?rNo="+recipeDTO.getRNo()+"&pageNum="+pageRequestDTO.getPageNum();
	}
	
	@PostMapping("/remove")
	public String remove(Long rNo, RedirectAttributes rttr) throws Exception{

		log.info("\nremove rNo: "+rNo);
		//recipeService.remove(rNo);
		recipeService.removeWithIngredient(rNo);
		rttr.addFlashAttribute("msg","레시피가 삭제되었습니다. ");
		
		return "redirect:/recipe/list";
	}
}

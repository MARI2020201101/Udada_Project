package org.ourapp.udada.exercise;

import java.util.List;

import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.PageResultDTO;
import org.ourapp.udada.recipe.RecipeDTO;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/exercise")
public class ExerciseController {

	private final ExerciseService exerciseService;
	
	@GetMapping("/list")
	public void getList(Model model, PageRequestDTO pageRequestDTO, Authentication auth) throws Exception  {
		log.info("exerciseController-----");
		
		List<ExerciseDTO> list = exerciseService.getListWithImageAndPagingAndSearch(pageRequestDTO);
		model.addAttribute("list", list);
		// int total = recipeService.countAll();
		int total = exerciseService.countAllWithSearch(pageRequestDTO);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
	}//getList end
	
	@GetMapping("/read")
	public void get(Long eNo, Model model){
		log.info("read.......................");
		model.addAttribute("dto", exerciseService.get(eNo));
	}//read end
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mylist")
	public void mylist(Authentication auth, Model model) {
		log.info("myexerciseController----");
		
		String mEmail = auth.getName();//로그인한 이메일 가져옴.
		System.out.println("email : " + mEmail);
		
		List<Exercise_myDTO> mylist = exerciseService.myList(mEmail);
		System.out.println(mylist);
		model.addAttribute("mylist", mylist);
	}//mylist end
	
	@GetMapping("/myread")
	public String myget(Long eNo, Long emNo, Model model){
		log.info("eNo:"+eNo);
		log.info("emNo:"+emNo);
		log.info("myread.......................");
		
		model.addAttribute("emNo", emNo);
		model.addAttribute("dto", exerciseService.get(eNo));
	
		return "exercise/myread";
		
	}//read end
	
	@PostMapping("/remove")
	public String remove(Long emNo, RedirectAttributes rttr) throws Exception{

		log.info("\nremove emNo: "+emNo);
		exerciseService.remove(emNo);
		rttr.addFlashAttribute("msg","운동목록이 삭제되었습니다. ");
		
		return "redirect:/exercise/mylist";
	}
	
	@PostMapping("/insert")
	public String insert(Authentication auth, Exercise_myDTO exercise_myDTO) {
		String mEmail= auth.getName();
		
		System.out.println("insert..................");
		System.out.println("eNo:"+exercise_myDTO.getENo());
		System.out.println("em_time:"+exercise_myDTO.getEmTime());
		exercise_myDTO.setMEmail(mEmail);
		
		exerciseService.insert(exercise_myDTO);
		
		return "redirect:/exercise/list";
		
	}
	
}//class end

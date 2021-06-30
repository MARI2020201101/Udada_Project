package org.ourapp.udada.exercise;

import java.util.List;

import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.RecipeDTO;
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
@RequestMapping("/exercise")
public class ExerciseController {

	private final ExerciseService exerciseService;
	
	@GetMapping("/list")
	public void getList(Model model) {
		log.info("exerciseController-----");
		
		List<ExerciseDTO> list = exerciseService.getList();
		model.addAttribute("list", list);
	}//getList end
	
	@GetMapping("/read")
	public void get(Long eNo, Model model){
		log.info("read.......................");
		model.addAttribute("dto", exerciseService.get(eNo));
	}//read end
	
	@GetMapping("/mylist")
	public void mylist(Model model) {
		log.info("myexerciseController----");
		
		List<Exercise_myDTO> mylist = exerciseService.myList();
		model.addAttribute("mylist", mylist);
	}//mylist end
	
	@GetMapping("/myread")
	public String myget(Long eNo, Model model){
		log.info(eNo);
		log.info("myread.......................");
		model.addAttribute("dto", exerciseService.get(eNo));
	
		return "exercise/myread";
		
	}//read end
	
	@PostMapping("/remove")
	public String remove(Long eNo, RedirectAttributes rttr) throws Exception{

		log.info("\nremove eNo: "+eNo);
		exerciseService.remove(eNo);
		rttr.addFlashAttribute("msg","운동목록이 삭제되었습니다. ");
		
		return "redirect:/exercise/mylist";
	}
	
	@PostMapping("/insert")
	public String insert(Exercise_myDTO exercise_myDTO) {
		String mEmail="test01@naver.com";
		
		System.out.println("insert..................");
		System.out.println("eNo:"+exercise_myDTO.getENo());
		System.out.println("em_time:"+exercise_myDTO.getEmTime());
		exercise_myDTO.setMEmail(mEmail);
		
		//exerciseService.insert(Exercise_myDTO );
		
		return "redirect:/exercise/list";
		
	}
	
}//class end

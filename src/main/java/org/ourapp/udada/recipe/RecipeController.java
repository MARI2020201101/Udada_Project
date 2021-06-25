package org.ourapp.udada.recipe;

import java.util.List;

import org.ourapp.udada.image.ImageController;
import org.ourapp.udada.image.ImageDTO;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
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
	public void getList(Model model , PageRequestDTO pageRequestDTO , Authentication auth) throws Exception{
		log.info("recipeController.......................");
		log.info("Spring security auth : "+ auth);
		//List<RecipeDTO> list = recipeService.getList();			
		//List<RecipeDTO> list = recipeService.getListWithPaging(pageRequestDTO);
		//List<RecipeDTO> list = recipeService.getListWithImageAndPaging(pageRequestDTO);
		List<RecipeDTO> list = recipeService.getListWithImageAndPagingAndSearch(pageRequestDTO);
		model.addAttribute("list", list);
		//int total = recipeService.countAll();
		int total = recipeService.countAllWithSearch(pageRequestDTO);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
	
	}
	
	@GetMapping("/read")
	public void get(Long rNo, Model model, PageRequestDTO pageRequestDTO) throws Exception{
		log.info("read.......................");
		//model.addAttribute("dto", recipeService.get(rNo));
		//model.addAttribute("dto", recipeService.getWithIngredient(rNo));
		//model.addAttribute("dto", recipeService.getWithIngredientAndFood(rNo));
		model.addAttribute("dto", recipeService.getWithIngreAndFoodAndImage(rNo));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerForm(){
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(RecipeDTO recipeDTO , RedirectAttributes rttr , MultipartFile image) throws Exception{

		log.info("register..........................");
		log.info(recipeDTO);
		
		if(image!=null && image.getOriginalFilename()!="") {
			 ImageDTO imageDTO = ImageController.uploadImage(image);
			 imageDTO.setIDiv("RCP");
			 recipeDTO.setImageDTO(imageDTO);
			 log.info(imageDTO);
		}
		
		//recipeService.register(recipeDTO);
		//recipeService.registerWithIngredient(recipeDTO);
		recipeService.registerWithIngreAndImage(recipeDTO);
		rttr.addFlashAttribute("msg", "레시피가 등록되었습니다.");
		
		return "redirect:/recipe/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void modifyForm(Long rNo, Model model , PageRequestDTO pageRequestDTO) throws Exception{
		model.addAttribute("dto", recipeService.getWithIngreAndFoodAndImage(rNo));
	}
	
	@PreAuthorize("authentication.principal.username == #recipeDTO.mEmail or hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modify(RecipeDTO recipeDTO, MultipartFile image, Model model, RedirectAttributes rttr ,PageRequestDTO pageRequestDTO) throws Exception{
		
		log.info("modify.......................");
		log.info("modify.......+" + recipeDTO);
		
		//이미지 교체 or 새로등록
		if(image!=null && image.getOriginalFilename()!="") {
			
			if(recipeDTO.getImageDTO()!=null && recipeDTO.getImageDTO().getIName()!="") {
				 ImageController.removeImage(recipeDTO.getImageDTO().getImagePath());
			}
			 ImageDTO imageDTO = ImageController.uploadImage(image);
			 imageDTO.setIDiv("RCP");
			 recipeDTO.setImageDTO(imageDTO);
			 log.info("modify.......+" + imageDTO);
		}
		
		
		//recipeService.modify(recipeDTO);
		recipeService.modifyWithIngreAndImage(recipeDTO);
		rttr.addFlashAttribute("msg","레시피가 수정되었습니다. ");
		rttr.addAttribute("keyword" ,pageRequestDTO.getKeyword());
		rttr.addAttribute("pageNum" ,pageRequestDTO.getPageNum());
		rttr.addAttribute("rNo" ,recipeDTO.getRNo());
		 
		return "redirect:/recipe/read";
	}
	
	@PreAuthorize("authentication.principal.username == #recipeDTO.mEmail or hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")
	public String remove(RecipeDTO recipeDTO, RedirectAttributes rttr) throws Exception{

		if(recipeDTO.getImageDTO()!=null && recipeDTO.getImageDTO().getIName()!="") {
				 ImageController.removeImage(recipeDTO.getImageDTO().getImagePath());
			}		 		
		//recipeService.remove(rNo);
		//recipeService.removeWithIngredient(rNo);
		recipeService.removeWithIngreAndImage(recipeDTO.getRNo());
		rttr.addFlashAttribute("msg","레시피가 삭제되었습니다. ");
		
		return "redirect:/recipe/list";
	}
}

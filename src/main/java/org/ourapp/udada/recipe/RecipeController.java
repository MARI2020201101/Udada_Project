package org.ourapp.udada.recipe;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.ourapp.udada.foodmy.FoodMyDTO;
import org.ourapp.udada.image.ImageController;
import org.ourapp.udada.image.ImageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private ServletContext servletContext;
	private final RecipeService recipeService;

	@GetMapping("/list")
	public void getList(Model model, PageRequestDTO pageRequestDTO, Authentication auth) throws Exception {
		log.info("recipeController.......................");
		log.info("Spring security auth : " + auth);
		// List<RecipeDTO> list = recipeService.getList();
		// List<RecipeDTO> list = recipeService.getListWithPaging(pageRequestDTO);
		// List<RecipeDTO> list =
		// recipeService.getListWithImageAndPaging(pageRequestDTO);
		List<RecipeDTO> list = recipeService.getListWithImageAndPagingAndSearch(pageRequestDTO);
		model.addAttribute("list", list);
		// int total = recipeService.countAll();
		int total = recipeService.countAllWithSearch(pageRequestDTO);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));

	}

	@GetMapping("/read")
	public void get(Long rNo, Model model, PageRequestDTO pageRequestDTO) throws Exception {
		log.info("read.......................");
		// model.addAttribute("dto", recipeService.get(rNo));
		// model.addAttribute("dto", recipeService.getWithIngredient(rNo));
		// model.addAttribute("dto", recipeService.getWithIngredientAndFood(rNo));
		//model.addAttribute("dto", recipeService.getWithIngreAndFoodAndImage(rNo));
		model.addAttribute("dto", recipeService.getWithIngreAndFoodAndImageAndReply(rNo));
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerForm() {
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(RecipeDTO recipeDTO, RedirectAttributes rttr, MultipartFile image) throws Exception {

		log.info("register..........................");
		log.info(recipeDTO);

		if (image != null &&  image.getOriginalFilename() != null && !(image.getOriginalFilename().equals(""))) {
			ImageDTO imageDTO = ImageController.uploadImage(image);
			imageDTO.setIDiv("RCP");
			recipeDTO.setImageDTO(imageDTO);
			log.info(imageDTO);
		}

		// recipeService.register(recipeDTO);
		// recipeService.registerWithIngredient(recipeDTO);
		recipeService.registerWithIngreAndImage(recipeDTO);
		rttr.addFlashAttribute("msg", "레시피가 등록되었습니다.");

		return "redirect:/recipe/list";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void modifyForm(Long rNo, Model model, PageRequestDTO pageRequestDTO) throws Exception {
		model.addAttribute("dto", recipeService.getWithIngreAndFoodAndImage(rNo));
	}

	@PreAuthorize("authentication.principal.username == #recipeDTO.mEmail or hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modify(RecipeDTO recipeDTO, MultipartFile image, Model model, RedirectAttributes rttr,
			PageRequestDTO pageRequestDTO) throws Exception {

		log.info("modify.......................");
		log.info("modify.......+" + recipeDTO);
		log.info("modify image .......+" + image);
		log.info("image != null" + (image != null));
		log.info("image.getOriginalFilename() != null" + (image.getOriginalFilename() != null));
		log.info("!(image.getOriginalFilename().equals(''))" + (!(image.getOriginalFilename().equals(""))));
		log.info("servletContext.getRealPath : "+ servletContext.getRealPath("./"));
	
		// 이미지 교체 or 새로등록
		if (image != null &&  image.getOriginalFilename() != null && !(image.getOriginalFilename().equals(""))) {

			if (recipeDTO.getImageDTO() != null && !(recipeDTO.getImageDTO().getIName().equals(""))) {
				ImageController.removeImage(recipeDTO.getImageDTO().getImagePath());
			}
			ImageDTO imageDTO = ImageController.uploadImage(image);
			imageDTO.setIDiv("RCP");
			recipeDTO.setImageDTO(imageDTO);
			log.info("modify.......+" + imageDTO);
		}

		// recipeService.modify(recipeDTO);
		recipeService.modifyWithIngreAndImage(recipeDTO);
		rttr.addFlashAttribute("msg", "레시피가 수정되었습니다. ");
		rttr.addAttribute("keyword", pageRequestDTO.getKeyword());
		rttr.addAttribute("pageNum", pageRequestDTO.getPageNum());
		rttr.addAttribute("rNo", recipeDTO.getRNo());

		return "redirect:/recipe/read";
	}

	@PreAuthorize("authentication.principal.username == #recipeDTO.mEmail or hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")
	public String remove(RecipeDTO recipeDTO, RedirectAttributes rttr) throws Exception {

		if (recipeDTO.getImageDTO() != null && !(recipeDTO.getImageDTO().getIName().equals(""))) {
			ImageController.removeImage(recipeDTO.getImageDTO().getImagePath());
		}
		// recipeService.remove(rNo);
		// recipeService.removeWithIngredient(rNo);
		recipeService.removeWithIngreAndImage(recipeDTO.getRNo());
		rttr.addFlashAttribute("msg", "레시피가 삭제되었습니다. ");

		return "redirect:/recipe/list";
	}

	
	  @GetMapping(value = "/spec/{rNo}",produces= {MediaType.APPLICATION_JSON_VALUE}) 
	  @ResponseBody 
	  public ResponseEntity<RecipeSpecDTO> getRecipeSpec(@PathVariable("rNo")Long rNo) throws Exception{
		  log.info("Long rNo : "+rNo);
	  	  RecipeSpecDTO result = recipeService.getRecipeSpec(rNo);
	  	  log.info("result : "+ result);
	  	  
	  	  return new ResponseEntity<>(result, HttpStatus.OK);	  
	  }
	 
	  @PreAuthorize("isAuthenticated()")
	  @PostMapping(value = "/registerFoodMy", consumes="application/json" , produces= {MediaType.TEXT_PLAIN_VALUE})
	  @ResponseBody
	  public ResponseEntity<String> registerFoodMy(@RequestBody Map<String, String> params)throws Exception {
			log.info("foodMyDTO params: " + params);
			Long rNo = Long.parseLong(params.get("rNo"));
			String mEmail = params.get("mEmail");
			int fmAmount = Integer.parseInt(params.get("fmAmount"));
			String fmDate = params.get("fmDate");
			if (fmDate=="" || fmDate==null) {
				
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				  Date date = new Date(); 
				  String today = sdf.format(date);
				  fmDate = today;
				 
			}


			FoodMyDTO foodMyDTO = FoodMyDTO.builder().fmAmount(fmAmount).mEmail(mEmail).rNo(rNo).fmDate(fmDate).build();
			log.info("foodMyDTO : " + foodMyDTO);
			recipeService.registerFoodMy(foodMyDTO);
		  
		  return new ResponseEntity<>("success", HttpStatus.OK);
		}
	  
		@PreAuthorize("isAuthenticated()")
		@GetMapping("/myRecipe")
		public void myRecipe(PageRequestDTO pageRequestDTO, Authentication auth, Model model) throws Exception {
			String mEmail = auth.getName();
			pageRequestDTO.setKeyword(mEmail);
			
			List<RecipeDTO> list = recipeService.getByKewordMEmail(pageRequestDTO);
			int total = recipeService.countAllWithMEmail(pageRequestDTO);
			model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
			model.addAttribute("list", list);
		}

}

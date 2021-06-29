package org.ourapp.udada.journal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ourapp.udada.image.ImageController;
import org.ourapp.udada.image.ImageDTO;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.PageResultDTO;
import org.ourapp.udada.reply.ReplyDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.tools.javac.util.Log;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller	//현재 클래스를 Bean으로 등록
@RequiredArgsConstructor
@Log4j

@RequestMapping("/journal")
public class JouranlController {
	

	private final JournalService journalService;

	
	@GetMapping("/list")
	public void getList(Model model, PageRequestDTO pageRequestDTO) throws Exception{
		List<JournalDTO> list=journalService.getListWithImageAndPagingAndSearch(pageRequestDTO);
		model.addAttribute("list", list);
		
		int total = journalService.countAllWithSearch(pageRequestDTO);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
		
	}//list() end
	
	@GetMapping("/mylist")
	public void myList(Model model, PageRequestDTO pageRequestDTO) throws Exception{
		List<JournalDTO> mylist=journalService.mygetListWithImageAndPagingAndSearch(pageRequestDTO);
		model.addAttribute("mylist", mylist);
		
		int total = journalService.countAllWithSearch(pageRequestDTO);
		log.info("페이지" + total);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
		
	}
	@ResponseBody
	@PostMapping("/replyinsert") //댓글 등록
	public int insertReply(ReplyDTO replyDTO) {
		int result = 0;
		try {
			result = journalService.insertReply(replyDTO);
		}catch(Exception e) {
			System.out.println("댓글 실패 :" +e);
			result = -1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/replylist", produces = "application/json; charset=utf-8")
	public String replyList(Long jNo) throws Exception{
		List<ReplyDTO> rList = journalService.replyList(jNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
		return gson.toJson(rList);
	}
	
	@GetMapping("/register")
	public void registerForm() {
		
	}
	
	@PostMapping("/register")
	public String register(JournalDTO journalDTO, RedirectAttributes rttr, MultipartFile image) throws Exception{
		
		log.info("register----------------------");

		
		if(image!=null && image.getOriginalFilename()!="") {
			 ImageDTO imageDTO = ImageController.uploadImage(image);
			 imageDTO.setIDiv("JRN");
			 journalDTO.setImageDTO(imageDTO);
			 log.info(imageDTO);
		}
		
		journalService.registerWithImage(journalDTO);
		log.info(journalDTO);
		rttr.addFlashAttribute("msg", "저널이 등록되었습니다");
		
		return "redirect:/journal/mylist";
		
	}//register() end
	
	
	@GetMapping("/read")
	public void read(Long jNo, Model model, PageRequestDTO pageRequestDTO) throws Exception{
		model.addAttribute("dto", journalService.getWithIngreAndFoodAndImage(jNo));
	}//read() end
	
	@GetMapping("/modify")
	public void modifyForm(Long jNo, Model model) {
		model.addAttribute("dto", journalService.read(jNo));
	}
	
	@PostMapping("/modify")
	public String modify(JournalDTO journalDTO, MultipartFile image, Model model, RedirectAttributes rttr, PageRequestDTO pageRequestDTO) throws Exception{
		log.info(journalDTO);
		//이미지 교체 or 새로등록
			if(image!=null && image.getOriginalFilename()!="") {
					
			if(journalDTO.getImageDTO()!=null && journalDTO.getImageDTO().getIName()!="") {
				ImageController.removeImage(journalDTO.getImageDTO().getImagePath());
			}
			ImageDTO imageDTO = ImageController.uploadImage(image);
			imageDTO.setIDiv("JRN");
			journalDTO.setImageDTO(imageDTO);
			log.info("modify.......+" + imageDTO);
		}
		journalService.modifyWithIngreAndImage(journalDTO);
		rttr.addFlashAttribute("msg", "저널이 수정되었습니다");
		return "redirect:/journal/read?jNo="+journalDTO.getJNo();	
		
	}
	
	@PostMapping("/remove")
	public String remove(JournalDTO journalDTO, RedirectAttributes rttr) throws Exception{
		if(journalDTO.getImageDTO()!=null && journalDTO.getImageDTO().getIName()!="") {
			ImageController.removeImage(journalDTO.getImageDTO().getImagePath());
		}
		
		journalService.removeWithIngreAndImage(journalDTO.getJNo());
		rttr.addFlashAttribute("msg", "저널이 삭제되었습니다");
		
		return "redirect:/journal/mylist";
	}
	
	@PostMapping("/insertlike")
	public void likeinsert(LikeyouDTO likeyouDTO, RedirectAttributes rttr) throws Exception{
		journalService.insertLike(likeyouDTO);
	}
	
	
	/*
	@RequestMapping(value = "/readlike", method = RequestMethod.GET)
    public void read(LikeyouDTO likeyouDTO, Model model) throws Exception {


        int likecnt = journalService.getLike(likeyouDTO);
        model.addAttribute("heart", likecnt);
    }
*/
  @ResponseBody
    @RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
    public int heart(LikeyouDTO likeyouDTO, Model model) throws Exception {

        int heart = journalService.getLike(likeyouDTO);



        System.out.println("여기에요"+heart);

        if(heart >= 1) {
            journalService.deleteLike(likeyouDTO);
            heart=0;
        } else {
            journalService.insertLike(likeyouDTO);
            heart=1;
        }

        return heart;

    }
	
	
}//class end

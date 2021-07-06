package org.ourapp.udada.journal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ourapp.udada.image.ImageController;
import org.ourapp.udada.image.ImageDTO;
import org.ourapp.udada.member.MemberDTO;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.PageResultDTO;
import org.ourapp.udada.reply.ReplyDTO;
import org.ourapp.udada.reply.ReplyService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
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

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public void getList(Model model, PageRequestDTO pageRequestDTO, Authentication auth) throws Exception{
		
		
		List<JournalDTO> list=journalService.getListWithImageAndPagingAndSearch(pageRequestDTO);
		
		
		int total = journalService.countAllWithSearch(pageRequestDTO);
		
		 String reDiv="JRN";
		 
		 String loginEmail = auth.getName();
		 
		 for(int i=0; i<list.size(); i++) { 
			 Long oriNo = list.get(i).getJNo();
			 Long jNo = list.get(i).getJNo();
			 String mEmail = list.get(i).getMEmail();
			 List<ReplyDTO> replyList = journalService.replyList(oriNo,reDiv);
			 list.get(i).setReplyList(replyList);
			 
			 int likeCount = journalService.getLike(jNo, loginEmail);
			 list.get(i).setLikeCount(likeCount);
			 
			 int lCnt = list.get(i).getLCnt();
			 list.get(i).setLCnt(lCnt);
			 //log.info("댓글 :" +replyList);
			 
			 }

		 log.info("하트값" + list);
		 
		 
		//System.out.println("total:"+total);
		model.addAttribute("list", list);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
		
		

	}//list() end
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mylist")
	public void myList(Model model, PageRequestDTO pageRequestDTO, Authentication auth) throws Exception{
		
		log.info("security"+auth);
		
		String loginUser = auth.getName();
		log.info("로그인 아이디"+loginUser);
		
		List<JournalDTO> mylist=journalService.mygetListWithImageAndPagingAndSearch(pageRequestDTO, loginUser);
		model.addAttribute("mylist", mylist);
		
		int total = journalService.mycountAllWithSearch(pageRequestDTO);
		log.info("페이지" + total);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
		
	}

	
	@GetMapping("/register")
	public void registerForm() {
		
	}
	
	@PreAuthorize("authentication.principal.username == #journalDTO.mEmail or hasRole('ROLE_ADMIN')")
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
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/read")
	public void read(Long jNo, Model model, PageRequestDTO pageRequestDTO) throws Exception{
		model.addAttribute("dto", journalService.getWithIngreAndFoodAndImage(jNo));
	}//read() end
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void modifyForm(Long jNo, Model model) {
		model.addAttribute("dto", journalService.read(jNo));
	}
	
	@PreAuthorize("authentication.principal.username == #journalDTO.mEmail or hasRole('ROLE_ADMIN')")
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
	
	@PreAuthorize("authentication.principal.username == #journalDTO.mEmail or hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")
	public String remove(JournalDTO journalDTO, RedirectAttributes rttr) throws Exception{
		if(journalDTO.getImageDTO()!=null && journalDTO.getImageDTO().getIName()!="") {
			ImageController.removeImage(journalDTO.getImageDTO().getImagePath());
		}
		
		journalService.removeWithIngreAndImage(journalDTO.getJNo());
		rttr.addFlashAttribute("msg", "저널이 삭제되었습니다");
		
		return "redirect:/journal/mylist";
	}

	
}//class end

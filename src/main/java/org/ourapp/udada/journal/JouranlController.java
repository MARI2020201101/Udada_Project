package org.ourapp.udada.journal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void getList(Model model) {
		List<JournalDTO> list=journalService.getList();
		model.addAttribute("list", list);
	}//list() end
	
	@GetMapping("/register")
	public void registerForm() {
		
	}
	
	@PostMapping("/register")
	public String register(JournalDTO jounalDTO, RedirectAttributes rttr) {
		
		log.info("register----------------------");
		log.info(jounalDTO);
		
		journalService.register(jounalDTO);
		rttr.addFlashAttribute("msg", "저널이 등록되었습니다");
		
		return "redirect:/journal/list";
		
	}//register() end
	
	
	@GetMapping("/read")
	public void read(Long jNo, Model model) {
		model.addAttribute("dto", journalService.read(jNo));
	}//read() end
	
	@GetMapping("/modify")
	public void modifyForm(Long jNo, Model model) {
		model.addAttribute("dto", journalService.read(jNo));
	}
	
	@PostMapping("/modify")
	public String modify(JournalDTO journalDTO, Model model, RedirectAttributes rttr) {
		log.info(journalDTO);
		journalService.modify(journalDTO);
		rttr.addFlashAttribute("msg", "저널이 수정되었습니다");
		return "redirect:/journal/read?jNo="+journalDTO.getJNo();	
		
	}
	
	@PostMapping("/remove")
	public String remove(Long jNo, RedirectAttributes rttr) {
		journalService.remove(jNo);
		rttr.addFlashAttribute("msg", "저널이 삭제되었습니다");
		
		return "redirect:/journal/list";
	}
	
	
	
}//class end

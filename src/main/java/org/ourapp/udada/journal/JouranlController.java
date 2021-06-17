package org.ourapp.udada.journal;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller	//현재 클래스를 Bean으로 등록
@RequiredArgsConstructor
@RequestMapping("/journal")
public class JouranlController {
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		List<JournalDTO> list=JournalService.listAll();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("journal/list");
		mav.addObject("list", list);
		return mav;
	}//list() end
	
}//class end

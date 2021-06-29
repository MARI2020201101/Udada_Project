package org.ourapp.udada.challenge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j

@RequestMapping(value = "/challenge")

public class ChallengeController {

	private final ChallengeService challengeService;

	@GetMapping("/register")
	public void registerChallenge() {
	}

	@PostMapping("/register")
	public String register(ChallengeDTO challengeDTO, ChallengeGoalDTO challengeGoalDTO, String cPeriod,
			Long[] eNoArray, Long[] cgTimeArray) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (cPeriod.length() < 13) {
			try {
				challengeDTO.setCFinish(sdf.parse(cPeriod));
				challengeDTO.setCStart(sdf.parse(cPeriod));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			try {
				challengeDTO.setCStart(sdf.parse(cPeriod.substring(0, 10)));
				challengeDTO.setCFinish(sdf.parse(cPeriod.substring(13)));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		challengeService.register(challengeDTO);
		challengeService.registerApply(challengeDTO);
		Long cNo = challengeDTO.getCNo();
		challengeGoalDTO.setCNo(cNo);
		for (int i = 0; i < eNoArray.length; i++) {
			if (eNoArray[i] != null) {
				challengeGoalDTO.setENo(eNoArray[i]);
				challengeGoalDTO.setCgTime(cgTimeArray[i]);
				challengeService.registerGoal(challengeGoalDTO);
			} else
				continue;
		}
		return "redirect:/challenge/read/" + cNo + "";
	}

	@RequestMapping("/list")
	public void loadList(Model model, ChallengeGetListDTO challengeGetListDTO) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (challengeGetListDTO.getPageNo()==null) {
			challengeGetListDTO.setPageNo((double)1);
		}
		if(challengeGetListDTO.getExercise()!=null && challengeGetListDTO.getExercise()!="") {
			int[] excsList = challengeService.eNameSearch(challengeGetListDTO.getExercise());
			if(excsList.length<1) {
				excsList = new int[]{0}; 
			}
			challengeGetListDTO.setExcsResult(excsList);
		}
		challengeGetListDTO.setStartNo((long) (12 * (challengeGetListDTO.getPageNo() - 1) + 1));
		challengeGetListDTO.setEndNo((long) (12 * challengeGetListDTO.getPageNo()));
		String pDate = challengeGetListDTO.getPeriod();
		if(pDate!=null && pDate!="") {
		if (pDate.length() < 13) {
			try {
				challengeGetListDTO.setStart(sdf.parse(pDate));
				challengeGetListDTO.setFinish(sdf.parse(pDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			try {
				challengeGetListDTO.setStart(sdf.parse(pDate.substring(0, 10)));
				challengeGetListDTO.setFinish(sdf.parse(pDate.substring(13)));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		}
		List<ChallengeListDTO> list = challengeService.loadList(challengeGetListDTO);
		Double challengAmount = (double) list.size();
		challengeGetListDTO.setEndPage(Math.ceil(challengAmount/12));
		challengeGetListDTO.setStartPage((Math.ceil(challengeGetListDTO.getPageNo()/5)-1)*5+1);
		Boolean checkEnd;
		if ((Math.ceil(challengeGetListDTO.getPageNo() / 5) < Math.ceil(challengeGetListDTO.getEndPage() / 5))) {
			checkEnd = true;
		} else {
			checkEnd = false;
		}
		Date nowDate = new Date();
		for (int i = 0; i < list.size(); i++) {
			Long cNo;
			cNo = list.get(i).getCNo();
			List<ChallengeGlistDTO> gList = challengeService.loadGlist(cNo);
			list.get(i).setGList(gList);
		}
		for (int i = 0; i < list.size(); i++) {
			Date chgDate = list.get(i).getCStart();
			Long cTotal = list.get(i).getCTotal();
			Long caCnt = list.get(i).getCaCnt();
			if (nowDate.before(chgDate) && caCnt < cTotal) {
				list.get(i).setCIng("primary");
			} else {
				list.get(i).setCIng("warning");
			}
		}
		model.addAttribute("page", challengeGetListDTO);
		model.addAttribute("list", list);
		model.addAttribute("checkEnd", checkEnd);
	}

	@RequestMapping("/read/{cNo}")
	public String read(Model model, @PathVariable Long cNo) {
		String sEmail = "user02@gmail.com";
		model.addAttribute("dto", challengeService.read(cNo));
		model.addAttribute("goal", challengeService.readGoal(cNo));
		model.addAttribute("applyCheck", challengeService.applyCheck(sEmail, cNo));
		return "challenge/read";
	}

	@ResponseBody
	@PostMapping("/apply")
	public Boolean apply(Long cNo, String sEmail) {
		Boolean apply = challengeService.challengeApply(cNo, sEmail);
		return apply;
	}

	@ResponseBody
	@PostMapping("/cancel")
	public Boolean cancel(Long cNo, String sEmail) {
		Boolean cancel = challengeService.challengeCancel(cNo, sEmail);
		return cancel;
	}

	@PostMapping("/edit")
	public String edit(Model model, Long cNo) {
		model.addAttribute("dto", challengeService.read(cNo));
		model.addAttribute("goal", challengeService.readGoal(cNo));
		return "challenge/modify";
	}

	@PostMapping("/modify")
	public String modify(ChallengeDTO challengeDTO, ChallengeGoalDTO challengeGoalDTO, String cPeriod, Long[] eNoArray,
			
			Long[] cgTimeArray, Long cNo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (cPeriod.length() < 13) {
			try {
				challengeDTO.setCFinish(sdf.parse(cPeriod));
				challengeDTO.setCStart(sdf.parse(cPeriod));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			try {
				challengeDTO.setCStart(sdf.parse(cPeriod.substring(0, 10)));
				challengeDTO.setCFinish(sdf.parse(cPeriod.substring(13)));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		challengeService.modify(challengeDTO);
		challengeService.delGoal(challengeDTO);
		for (int i = 0; i < eNoArray.length; i++) {
			if (eNoArray[i] != null) {
				challengeGoalDTO.setENo(eNoArray[i]);
				challengeGoalDTO.setCgTime(cgTimeArray[i]);
				challengeService.modifyGoal(challengeGoalDTO);
			} else
				continue;
		}
		return "redirect:/challenge/read/" + cNo + "";
	}

	@PostMapping("/delete")
	public void delete(Long cNo) {
		challengeService.delete(cNo);
	}

	@ResponseBody
	@PostMapping("/searchExcs")
	public List<ChallengeReadGoalDTO> searchExcs(String eName) {
		List<ChallengeReadGoalDTO> list = challengeService.searchExcs(eName);
		return list;
	}

}

package org.ourapp.udada.member;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/member")
public class MemberController {
	
	private final MemberService memberService;
	
	@GetMapping("/deleteWeight")
	public String deleteWeight(int msNo, RedirectAttributes rttr) {
		memberService.deleteWeight(msNo);
		rttr.addFlashAttribute("msg", "삭제되었습니다.");
		return "redirect:/member/myWeight";
	}
	
	@PostMapping("/insertWeight")
	public String insertWeight(MemberSpecDTO memberSpecDTO, Model model, RedirectAttributes rttr) {
		memberService.insertWeight(memberSpecDTO);
		rttr.addFlashAttribute("msg", "체중이 등록되었습니다.");
		return "redirect:/member/myWeight";
	}
	
	@GetMapping("/myWeight")
	public void myWeight(MemberSpecDTO memberSpecDTO, String mEmail, Model model) {//체중재기 클릭했을 때
		mEmail = "user01@gmail.com";
		
		memberSpecDTO = memberService.currentMyWeight(mEmail);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("dto", memberSpecDTO);

		List<MemberSpecDTO> list = memberService.selectMyWeight(mEmail);
		//System.out.println(list);
		model.addAttribute("list", list);
	}
	
	@PostMapping("/leave")
	public String leave(MemberDTO memberDTO, RedirectAttributes rttr) {
		memberDTO.setMGrade("CLOSE");
		memberService.leave(memberDTO);
		rttr.addFlashAttribute("msg", "탈퇴되었습니다.");
		return "redirect:/member/login";
	}

	@PostMapping("/updateMyProfile")
	public String updateMyProfile(MemberDTO memberDTO, Model model, String mBirthStr, RedirectAttributes rttr) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			memberDTO.setMBirth(sdf.parse(mBirthStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		log.info(memberDTO);
		
		memberService.updateMyProfile(memberDTO);
		rttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:/member/myProfile";
	}
	
	@GetMapping("/myProfile")
	public void myProfile(String mEmail, Model model) {
		mEmail = "user01@gmail.com";
		MemberDTO memberDTO = memberService.myProfile(mEmail);
		model.addAttribute("dto", memberDTO);
	}
	
	@PostMapping("/pwdCheck")
	public String pwdCheck(MemberDTO memberDTO, RedirectAttributes rttr) {
		int result = memberService.pwdCheck(memberDTO);
		if(result == 1) {
			return "redirect:/member/myProfile";
		}else {
			rttr.addFlashAttribute("msg", "비밀번호를 다시 입력해주세요.");
			return "redirect:/member/pwdCheck";
		}
		
	}
	
	@GetMapping("/pwdCheck")
	public void pwdCheck(String mEmail) {//프로필 클릭했을 때
		
	}	
	 
	
	@PostMapping("/joinForm_step2")
	public String joinForm_step2(MemberSpecDTO memberSpecDTO, RedirectAttributes rttr) {
		memberService.joinStep2(memberSpecDTO);
		rttr.addFlashAttribute("msg", "가입되었습니다.");
		return "redirect:/member/login";
	}
	
	@GetMapping("/joinForm_step2")
	public void joinForm_step2(MemberDTO memberDTO, Model model) {
		model.addAttribute("mEmail", memberDTO.getMEmail());
	}
	
	@ResponseBody
	@PostMapping("/emailChk")
	public ResponseEntity<String> emilChk(String mEmail) throws Exception{
		int result = memberService.duplecateEmail(mEmail);
		String msg = "";
		if(result == 0) msg="success";
		else msg="fail";
		return new ResponseEntity<>(msg,HttpStatus.OK);
	}
	
	@PostMapping("/emailCheckProc")
	public String emailCheckProc(MemberDTO memberDTO, Model model, String mBirthStr) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			memberDTO.setMBirth(sdf.parse(mBirthStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		memberService.join(memberDTO);
		model.addAttribute("mEmail", memberDTO.getMEmail());
		return "redirect:/member/joinForm_step2";
	}
	
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		
		if(error!=null) {
			model.addAttribute("error","아이디와 패스워드를 확인해주십시오.");
		}
		if(logout!=null) {
			model.addAttribute("logout","로그아웃 되었습니다.");
		}
		
	}
	
	@GetMapping("/joinForm")
	public void joinForm() {
		
	}
	
}

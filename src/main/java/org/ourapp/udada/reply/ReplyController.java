package org.ourapp.udada.reply;

import java.util.List;

import org.ourapp.udada.journal.JournalDTO;
import org.ourapp.udada.journal.JournalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j

@RequestMapping("/reply")
public class ReplyController {
	
	private final ReplyService replyService;
	
	@ResponseBody
	@PostMapping("/replyinsert") //댓글 등록
	public int insertReply(String mEmail, String reContent, Long jNo) {
	
		
		int result = 0;
		try {
			result = replyService.insertReply(mEmail, reContent, jNo);
		}catch(Exception e) {
			System.out.println("댓글 실패 :" +e);
			result = 2;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/replylist", produces = "application/json; charset=utf-8")
	public String replyList(Long jNo) throws Exception{
		List<ReplyDTO> rList = replyService.replyList(jNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
		return gson.toJson(rList);
	}
	
}

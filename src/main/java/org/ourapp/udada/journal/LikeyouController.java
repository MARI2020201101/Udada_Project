package org.ourapp.udada.journal;

import org.ourapp.udada.reply.ReplyController;
import org.ourapp.udada.reply.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j

@RequestMapping("/likeyou")
public class LikeyouController {

	private final LikeyouService likeyouService;
	
	@ResponseBody
	@PostMapping("/insertLike")
	public int insertLike(Long jNo, String mEmail) throws Exception{
		
		log.info(jNo);
		log.info(mEmail);
		
		int heart = likeyouService.getLike(jNo, mEmail);
        



        System.out.println("likeyouheart :"+heart);

        if(heart >= 1) {
        	likeyouService.deleteLike(jNo, mEmail);
            heart=0;
            System.out.println("좋아요 취소");
        } else {
        	likeyouService.insertLike(jNo, mEmail);
            heart=1;
            System.out.println("좋아요");
        }

		return heart;
	}
	
	
	
}//class end

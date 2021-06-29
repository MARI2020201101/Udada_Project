package org.ourapp.udada.reply;

import java.util.List;

public interface ReplyService {

	int insertReply(String mEmail, String reContent, Long jNo) throws Exception;
	List<ReplyDTO>replyList(Long jNo) throws Exception;
	
}//interface end

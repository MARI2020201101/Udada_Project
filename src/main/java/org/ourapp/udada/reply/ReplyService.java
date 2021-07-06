package org.ourapp.udada.reply;

import java.util.List;

public interface ReplyService {

	int insertReply(String reContent, Long oriNo, String mEmail, String reDiv) throws Exception;
	int deleteReply(String mEmail, Long reNo) throws Exception;
	
}//interface end

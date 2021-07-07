package org.ourapp.udada.reply;

import java.util.List;

import org.ourapp.udada.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	private final ReplyMapper replyMapper;

	@Override
		public int insertReply(String reContent, Long oriNo, String mEmail, String reDiv) throws Exception {

			return replyMapper.insert(reContent, oriNo, mEmail, reDiv);
		}
	
	
	@Override
		public int deleteReply(String mEmail, Long reNo) throws Exception{
			
			return replyMapper.delete(mEmail, reNo);
		}
	
}//class end

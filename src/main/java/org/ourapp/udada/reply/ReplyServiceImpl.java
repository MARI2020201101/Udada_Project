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
		public int insertReply(String mEmail, String reContent, Long jNo) throws Exception {

			return replyMapper.insert(mEmail, reContent, jNo);
		}
	
	@Override
	public List<ReplyDTO> replyList(Long jNo) throws Exception {

		return replyMapper.replyList(jNo);
	}
	
}//class end

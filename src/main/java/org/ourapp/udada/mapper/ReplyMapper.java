package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.reply.ReplyDTO;

public interface ReplyMapper {

	int insert(String mEmail, String reContent, Long jNo);
	int delete(@Param("reNo") Long reNo, @Param("mEmail")String mEmail);
	List<ReplyDTO> replyList(Long jNo) throws Exception;
	
}

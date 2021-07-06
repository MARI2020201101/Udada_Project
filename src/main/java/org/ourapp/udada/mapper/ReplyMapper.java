package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.reply.ReplyDTO;

public interface ReplyMapper {

	int insert(@Param("reContent")String reContent, @Param("oriNo")Long oriNo, @Param("mEmail")String mEmail, @Param("reDiv")String reDiv);
	int delete(@Param("mEmail")String mEmail, @Param("reNo") Long reNo);
	
	
}

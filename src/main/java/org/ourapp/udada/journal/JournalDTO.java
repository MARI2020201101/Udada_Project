package org.ourapp.udada.journal;

import java.util.Date;
import java.util.List;

import org.ourapp.udada.image.ImageDTO;
import org.ourapp.udada.reply.ReplyDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JournalDTO {
	/*
	J_NO NUMBER NOT NULL 
	, M_EMAIL VARCHAR2(100 BYTE) NOT NULL 
	, J_CONTENT VARCHAR2(2000 BYTE) NOT NULL 
	, J_DATE
	*/
	
	private long jNo;
	private String mEmail;
	private String jContent;
	private Date jDate;
	private int lCnt;
	private ReplyDTO replyDTO;
	private int heart;
	private String loginUser;
	private String mName;
	
	private ImageDTO imageDTO;
	private List<LikeyouDTO> likeyouList;
	private int likeCount;
	private int replyCount;
	
	private List<ReplyDTO> replyList;
	
	
	
	
}//class end

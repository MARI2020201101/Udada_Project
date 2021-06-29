package org.ourapp.udada.challenge;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChallengeReadDTO {
	
	private Long cNo;
	private String mEmail;
	private String cTitle;
	private String cContent;
	private Date cStart;
	private Date cFinish;
	private Long cTotal;
	private Date cDate;		
	private Long caCnt;
	/*
  C_NO NUMBER NOT NULL 
, M_EMAIL VARCHAR2(100 BYTE)  
, C_TITLE VARCHAR2(1000 BYTE) 
, C_CONTENT VARCHAR2(2000 BYTE) 
, C_START DATE 
, C_FINISH DATE  
, C_TOTAL NUMBER 
, C_DATE DATE DEFAULT SYSDATE 
	 * 
	 * */
}

package org.ourapp.udada.challenge;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChallengeListDTO {
	
	private Long cNo;
	private String cTitle;
	private Date cStart;
	private Date cFinish;
	private Long cTotal;
	private Date cDate;
	private Long caCnt;
	private List<ChallengeGlistDTO> gList;
	private String cIng;


	
	
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

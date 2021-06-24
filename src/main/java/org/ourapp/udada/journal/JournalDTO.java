package org.ourapp.udada.journal;

import java.util.Date;

import lombok.Data;

@Data
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
	
	
	
}//class end

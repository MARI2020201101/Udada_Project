package org.ourapp.udada.foodmy;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyDTO {
	
	/*
	 * FM_NO	NUMBER
		M_EMAIL	VARCHAR2(100 BYTE)
		F_NO	VARCHAR2(20 BYTE)
		FM_DATE	DATE
		FM_AMOUNT	NUMBER
		R_NO	NUMBER
	 * 
	 * */
	
	
	private Long fmNo;
	private String mEmail;
	private String fNo;
	private String fmDate; 
	private int fmAmount;
	private Long rNo;


}

package org.ourapp.udada.recipe;

import java.util.Date;
import java.util.List;

import org.ourapp.udada.image.ImageDTO;

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
	private Date fmDate; //String으로 바꿀까? 고민.... 아니면 그냥 보여주기용 멤버변수 추가하지뭐...
	private int fmAmount;
	private Long rNo;

}

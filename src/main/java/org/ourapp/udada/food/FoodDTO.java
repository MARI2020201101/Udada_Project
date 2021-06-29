package org.ourapp.udada.food;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodDTO {
	
	
	/*
		F_NO	VARCHAR2(20 BYTE)
		F_NAME	VARCHAR2(1000 BYTE)
		F_MJCLASS	VARCHAR2(500 BYTE)
		F_MNCLASS	VARCHAR2(500 BYTE)
		F_ONCEOFFER	NUMBER
		F_KCAL	NUMBER
		F_PROTEIN	NUMBER
		F_FAT	NUMBER
		F_CARBO	NUMBER
	 * 
	 * */

	private String fNo;
	private String fName;
	private String fMjclass;
	private String fMinclass;
	private int fOnceoffer;
	private int fKcal;
	private int fProtein;
	private int fFat;
	private int fCarbo;
	
}

package org.ourapp.udada.foodmy;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyResultDTO {
/*
 * V.R_NO, 
 * V.R_TITLE, 
	 RSKCAL, 
	RSCARBO,
	RSPROTEIN,
	RSFAT,
	FM.FM_NO,
	FM.M_EMAIL, 
	TO_CHAR(FM.FM_DATE , 'YYYY-MM-DD') AS DAY,
	FM.FM_AMOUNT,
	F.F_NO,
	F.F_NAME,
	FSKCAL, 
	FSCARBO,
	FSPROTEIN,
	FSFAT
 * 
 * 
 * 
 * */
	private Long rNo;
	private String rTitle;
	private int rsKcal;
	private int rsCarbo;
	private int rsProtein;
	private int rsFat;
	private Long fmNo;
	private String mEmail;
	private String day;
	private int fmAmount;
	private String fNo;
	private String fName;
	private int fsKcal;
	private int fsCarbo;
	private int fsProtein;
	private int fsFat;
	
	
}

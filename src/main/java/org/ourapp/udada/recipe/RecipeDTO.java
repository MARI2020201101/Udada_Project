package org.ourapp.udada.recipe;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RecipeDTO {

	/*
	 * R_NO	NUMBER
		M_EMAIL	VARCHAR2(100 BYTE)
		R_TITLE	VARCHAR2(1000 BYTE)
		R_CONTENT	VARCHAR2(2000 BYTE)
		R_DATE	DATE
	 * 
	 * */
	
	private Long rNo;
	private String mEmail;
	private String rTitle;
	private String rContent;
	private Date rDate;
	
	
	
}

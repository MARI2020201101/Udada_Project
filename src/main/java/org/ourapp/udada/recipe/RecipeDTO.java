package org.ourapp.udada.recipe;

import java.util.ArrayList;
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
	
	private List<RecipeIngredientDTO> ingredientList = new ArrayList<>();
	
}

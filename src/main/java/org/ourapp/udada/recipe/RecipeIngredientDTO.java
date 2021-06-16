package org.ourapp.udada.recipe;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeIngredientDTO {
/*
 *		RI_NO	NUMBER
		R_NO	NUMBER
		F_NO	VARCHAR2(20 BYTE)
		RI_AMOUNT	NUMBER
 * 
 * */
	
	private Long riNo;
	private Long rNo;
	private String fNo;
	private int riAmount;
}

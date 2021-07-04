package org.ourapp.udada.foodmy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyDayTotalDTO {
	/*
	 * 
	 * DAYTOTALKCAL,
		DAYTOTALCARBO,
		DAYTOTALPROTEIN,
		DAYTOTALFAT
	 * 
	 * */
	
	private int dayTotalKcal;
	private int dayTotalCarbo;
	private int dayTotalProtein;
	private int dayTotalFat;


}

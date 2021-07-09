package org.ourapp.udada.mapper;

import java.util.List;

import org.ourapp.udada.food.FoodDetailDTO;

public interface FoodDetailMapper {
	
	List<FoodDetailDTO> selectFname(FoodDetailDTO foodDetailDTO);

}

package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ourapp.udada.food.FoodDTO;
import org.ourapp.udada.foodmy.FoodMyDTO;

@Mapper
public interface FoodMapper {

	int countAll();
	
	List<FoodDTO> getList();
	List<FoodDTO> getMinList(String fMjclass);
	FoodDTO getFoodList(String fNo);
	
	void insertFoodMy(FoodMyDTO foodMyDTO);
	
	List<FoodDTO> selectByFName(String keyword);
	
}

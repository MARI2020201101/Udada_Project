package org.ourapp.udada.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ourapp.udada.food.FoodDTO;
import org.ourapp.udada.recipe.RecipeDTO;


@Mapper
public interface FoodMapper {

	int countAll();
	
	//void mjSearch(FoodDTO foodDTO);
	
	//List<FoodDTO> getFood_Soups();
	
	List<FoodDTO> getList();
	
	List<FoodDTO> getMn_List(String fMjclass);
	
	
	List<FoodDTO> selectByFName(String keyword);
	
}

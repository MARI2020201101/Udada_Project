package org.ourapp.udada.recipe;

import java.util.List;

public interface RecipeService {
	
	List<RecipeDTO> getList() throws Exception;
	RecipeDTO get(Long rNo) throws Exception;
	boolean modify(RecipeDTO recipeDTO) throws Exception;
	boolean remove(Long rNo) throws Exception;
	void register(RecipeDTO recipeDTO) throws Exception;

	void registerWithIngredient(RecipeDTO recipeDTO)throws Exception;
}

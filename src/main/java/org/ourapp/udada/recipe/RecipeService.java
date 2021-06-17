package org.ourapp.udada.recipe;

import java.util.List;

public interface RecipeService {
	
	List<RecipeDTO> getList();
	RecipeDTO get(Long rNo);
	boolean modify(RecipeDTO recipeDTO);
	boolean remove(Long rNo);
	void register(RecipeDTO recipeDTO);

}

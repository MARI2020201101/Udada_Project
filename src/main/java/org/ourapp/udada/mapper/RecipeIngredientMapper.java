package org.ourapp.udada.mapper;

import org.ourapp.udada.recipe.RecipeIngredientDTO;

public interface RecipeIngredientMapper {
	
	void insert(RecipeIngredientDTO recipeIngredientDTO);
	int deleteByRNo(Long rNo);

}

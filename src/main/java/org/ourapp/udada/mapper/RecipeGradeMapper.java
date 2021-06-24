package org.ourapp.udada.mapper;

import org.ourapp.udada.recipe.RecipeGradeDTO;

public interface RecipeGradeMapper {
	
	void insert(RecipeGradeDTO recipeGradeDTO);
	void delete(RecipeGradeDTO recipeGradeDTO);
	Double selectAvgByRNo(Long rNo);

}

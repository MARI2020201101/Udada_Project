package org.ourapp.udada.mapper;

import java.util.List;

import org.ourapp.udada.recipe.RecipeDTO;

public interface RecipeMapper {

	List<RecipeDTO> getList();
	RecipeDTO read(Long rNo);
	void register(RecipeDTO recipeDTO);
	void insertSelectKey(RecipeDTO recipeDTO);
	int update(RecipeDTO recipeDTO);
	int delete(Long rNo);
	
}

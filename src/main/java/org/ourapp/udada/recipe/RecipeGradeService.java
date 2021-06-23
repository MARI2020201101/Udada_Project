package org.ourapp.udada.recipe;

public interface RecipeGradeService {

	void register(RecipeGradeDTO recipeGradeDTO) throws Exception;
	double loadAvgByRNo(Long rNo)  throws Exception;
}

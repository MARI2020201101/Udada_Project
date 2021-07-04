package org.ourapp.udada.recipe;

import java.util.List;

import org.ourapp.udada.foodmy.FoodMyDTO;

public interface RecipeService {
	
	List<RecipeDTO> getList() throws Exception;
	RecipeDTO get(Long rNo) throws Exception;
	boolean modify(RecipeDTO recipeDTO) throws Exception;
	boolean remove(Long rNo) throws Exception;
	void register(RecipeDTO recipeDTO) throws Exception;

	void registerWithIngredient(RecipeDTO recipeDTO)throws Exception;
	RecipeDTO  getWithIngredient(Long rNo)throws Exception;
	RecipeDTO  getWithIngredientAndFood(Long rNo)throws Exception;
	boolean removeWithIngredient(Long rNo)throws Exception;
	boolean modifyWithIngredient(RecipeDTO recipeDTO)throws Exception;
	List<RecipeDTO> getListWithPaging(PageRequestDTO pageRequestDTO) throws Exception;
	int countAll();
	
	void registerWithIngreAndImage(RecipeDTO recipeDTO)throws Exception;
	List<RecipeDTO> getListWithImageAndPaging(PageRequestDTO pageRequestDTO) throws Exception;
	RecipeDTO  getWithIngreAndFoodAndImage(Long rNo)throws Exception;
	boolean modifyWithIngreAndImage(RecipeDTO recipeDTO)throws Exception;
	boolean removeWithIngreAndImage(Long rNo)throws Exception;
	
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	List<RecipeDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception;
	RecipeSpecDTO getRecipeSpec(Long rNo); 
	void registerFoodMy(FoodMyDTO foodMyDTO);
}

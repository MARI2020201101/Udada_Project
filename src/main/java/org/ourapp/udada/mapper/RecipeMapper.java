package org.ourapp.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ourapp.udada.foodmy.FoodMyDTO;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.RecipeDTO;
import org.ourapp.udada.recipe.RecipeSpecDTO;

public interface RecipeMapper {

	List<RecipeDTO> getList();
	RecipeDTO read(Long rNo);
	void register(RecipeDTO recipeDTO);
	void insertSelectKey(RecipeDTO recipeDTO);
	int update(RecipeDTO recipeDTO);
	int delete(Long rNo);
	
	RecipeDTO selectWithIngredient(Long rNo);
	RecipeDTO selectWithIngredientAndFood(Long rNo);
	List<RecipeDTO> selectWithPaging(PageRequestDTO pageRequestDTO);
	int countAll();
	
	List<RecipeDTO> selectWithImageAndPaging(PageRequestDTO pageRequestDTO);
	RecipeDTO selectWithIngreAndFoodAndImage(Long rNo);
	List<RecipeDTO> selectWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO);
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	
	RecipeSpecDTO selectRecipeSpecByRNo(Long rNo);
	void insertFoodMy(FoodMyDTO foodMyDTO);
	List<RecipeDTO> selectByMEmail(PageRequestDTO pageRequestDTO);
	int countAllWithMEmail(PageRequestDTO pageRequestDTO);
	
	RecipeDTO selectWithIngreAndFoodAndImageAndReply(Long rNo);
	List<RecipeDTO> selectWithImageAndPagingAndSearchAndReply(PageRequestDTO pageRequestDTO);
	RecipeDTO selectWithIngreAndFoodAndImageAndReplyRcp(Long rNo);
	List<RecipeDTO> selectByMEmailAndReplyCnt(PageRequestDTO pageRequestDTO);
}

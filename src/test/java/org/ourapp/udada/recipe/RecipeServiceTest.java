package org.ourapp.udada.recipe;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RecipeServiceTest {
	
	@Autowired
	private RecipeService recipeService;
	
	@Test
	public void getListTest() throws Exception{
		recipeService.getList();
	}
	
	@Test
	public void insertWithIngredientTest() throws Exception{
		
		RecipeDTO recipeDTO = RecipeDTO.builder()
				.mEmail("user02@gmail.com").rContent("쿠키").rTitle("쿠키").build();
		List<RecipeIngredientDTO> ingredientList = new ArrayList<>();
		
		RecipeIngredientDTO dto1 = RecipeIngredientDTO.builder()
				.fNo("R002762").riAmount(0.5).build();
		RecipeIngredientDTO dto2 = RecipeIngredientDTO.builder()
				.fNo("R002873").riAmount(1).build();
		RecipeIngredientDTO dto3 = RecipeIngredientDTO.builder()
				.fNo("R002407").riAmount(2).build();
		
		ingredientList.add(dto1);
		ingredientList.add(dto2);
		ingredientList.add(dto3);
		recipeDTO.setIngredientList(ingredientList);
		
		recipeService.registerWithIngredient(recipeDTO);
	}

	
	@Test
	public void removeWithIngreTest() throws Exception {
		recipeService.removeWithIngredient(17L);
	}
	
	@Test
	public void modifyWithIngredientTest() throws Exception{
		
		RecipeDTO recipeDTO = RecipeDTO.builder()
				.mEmail("user01@gmail.com").rContent("쿠키를 만들어요").rTitle("쿠키만들기").rNo(40L).build();
		List<RecipeIngredientDTO> ingredientList = new ArrayList<>();
		
		RecipeIngredientDTO dto1 = RecipeIngredientDTO.builder()
				.fNo("R002762").riAmount(0.5).build();
		RecipeIngredientDTO dto2 = RecipeIngredientDTO.builder()
				.fNo("R002873").riAmount(1).build();
		
		ingredientList.add(dto1);
		ingredientList.add(dto2);
		recipeDTO.setIngredientList(ingredientList);
		recipeService.modifyWithIngredient(recipeDTO);
	}
}

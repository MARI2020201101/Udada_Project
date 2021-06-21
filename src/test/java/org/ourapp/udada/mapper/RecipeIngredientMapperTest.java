package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.recipe.RecipeIngredientDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RecipeIngredientMapperTest {
	
	@Autowired
	private RecipeIngredientMapper recipeIngredientMapper;
	
	@Test
	public void insertTest() {
		
		RecipeIngredientDTO recipeIngredientDTO = RecipeIngredientDTO.builder()
				.fNo("R002762").riAmount(3).rNo(11L).build();
		recipeIngredientMapper.insert(recipeIngredientDTO);
	}
	
	@Test
	public void deleteTest() {
		
		recipeIngredientMapper.deleteByRNo(11L);
	}


}

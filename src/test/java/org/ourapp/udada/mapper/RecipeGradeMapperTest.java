package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.recipe.RecipeGradeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RecipeGradeMapperTest {
	
	@Autowired
	private RecipeGradeMapper recipeGradeMapper;
	
	@Test
	public void insertTest() {
		
		RecipeGradeDTO recipeGradeDTO = RecipeGradeDTO.builder()
				.rNo(56L).mEmail("user02@gmail.com").rgGrade(5).build();
		
		recipeGradeMapper.insert(recipeGradeDTO);
	}
	
	@Test
	public void deleteTest() {
		
		RecipeGradeDTO recipeGradeDTO = RecipeGradeDTO.builder()
				.rNo(56L).mEmail("user02@gmail.com").rgGrade(5).build();
		
		recipeGradeMapper.delete(recipeGradeDTO);
	}
	
	@Test
	public void selectAvgTest() {
		recipeGradeMapper.selectAvgByRNo(56L);
	}

}

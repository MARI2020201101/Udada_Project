package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.recipe.RecipeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RecipeMapperTest {

	@Autowired
	private RecipeMapper recipeMapper;
	
	@Test
	public void getListTest() {
		recipeMapper.getList().forEach(System.out::println);
		
	}
	
	@Test
	public void readTest() {
		log.info(recipeMapper.read(1L).toString());
		
	}
	
	@Test 
	public void insertTest() { 
		RecipeDTO recipeDTO = RecipeDTO.builder().mEmail("user01@gmail.com").rContent("삶아요").rTitle("라면 끓이기").build(); 
		
		recipeMapper.register(recipeDTO); 
		}

	
}

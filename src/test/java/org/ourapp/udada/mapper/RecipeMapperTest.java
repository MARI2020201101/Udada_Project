package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.recipe.PageRequestDTO;
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
		log.info(recipeMapper.read(2L).toString());
		
	}
	
	@Test 
	public void insertTest() { 
		RecipeDTO recipeDTO = RecipeDTO.builder().mEmail("user01@gmail.com").rContent("삶아요").rTitle("라면 끓이기").build(); 
		
		recipeMapper.register(recipeDTO); 
		}
	@Test 
	public void updateTest() { 
		RecipeDTO recipeDTO = RecipeDTO.builder().mEmail("user02@gmail.com").rContent("업뎃").rTitle("업뎃라면").rNo(2L).build(); 
		
		 int result=recipeMapper.update(recipeDTO); 
		 log.info("\nresult : "+result);
		}

	@Test 
	public void deleteTest() { 
		
		 int result=recipeMapper.delete(3L);
		 log.info("\nresult : "+result);
		}
	
	@Test 
	public void insertSelectKeyTest() { 
		RecipeDTO recipeDTO = RecipeDTO.builder().mEmail("user01@gmail.com").rContent("삶아요").rTitle("라면 끓이기").build(); 
		
		recipeMapper.insertSelectKey(recipeDTO); 
		log.info("\n selectKey: "+ recipeDTO.getRNo());
		}
	
	@Test 
	public void selectWithIngreTest() { 
			
		RecipeDTO recipeDTO=recipeMapper.selectWithIngredient(31L);
		log.info(recipeDTO.toString());
		}
	
	@Test 
	public void selectWithIngreAndFoodTest() { 
			
		RecipeDTO recipeDTO=recipeMapper.selectWithIngredientAndFood(40L);
		log.info(recipeDTO.toString());
		}
	
	
	@Test 
	public void selectWithPagingTest() { 
			recipeMapper.selectWithPaging(PageRequestDTO.builder().pageNum(2).pageSize(10).build());
		}
	@Test 
	public void countAllTest() { 
		log.info("recipe count : "+ recipeMapper.countAll());
		}
	
	@Test 
	public void selectWithImageAndPagingTest() { 
			recipeMapper.selectWithImageAndPaging(PageRequestDTO.builder().pageNum(1).pageSize(10).build());
		}
	
}

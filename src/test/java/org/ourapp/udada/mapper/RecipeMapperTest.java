package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.foodmy.FoodMyDTO;
import org.ourapp.udada.recipe.PageRequestDTO;
import org.ourapp.udada.recipe.RecipeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"		
		,"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
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
	
	@Test
	public void selectWithIngreAndFoodAndImageTest() {
		log.info(recipeMapper.selectWithIngreAndFoodAndImage(10L).toString());
	}
	
	@Test
	public void selectWithImageAndPagingAndSearchTest() {
		recipeMapper.selectWithImageAndPagingAndSearch(PageRequestDTO.builder().pageNum(2).pageSize(5).keyword("테").build());
	}
	
	@Test
	public void countAllWithSearchTest() {
		recipeMapper.countAllWithSearch(PageRequestDTO.builder().pageNum(1).pageSize(10).keyword("테").build());
	}
	
	@Test
	public void selectRecipeSpecTest() {
		recipeMapper.selectRecipeSpecByRNo(18L);
	}
	
	@Test
	public void insertFoodMyTest() {
		FoodMyDTO foodMyDTO = FoodMyDTO.builder().fmAmount(2).mEmail("user10@gmail.com").rNo(63L).build();
		recipeMapper.insertFoodMy(foodMyDTO);
	}
	
	@Test
	public void selectByMEmailTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder().pageNum(1).pageSize(5).keyword("user16@gmail.com").build();
		recipeMapper.selectByMEmail(pageRequestDTO);
	}
	
	@Test
	public void countAllByMEmailTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder().pageNum(2).pageSize(5).keyword("user01@gmail.com").build();
		int result = recipeMapper.countAllWithMEmail(pageRequestDTO);
		log.info("result count :"+result);
	}
	
	@Test
	public void selectWithImageAndPagingAndSearchAndReplyTest() {
		recipeMapper.selectWithImageAndPagingAndSearchAndReply(PageRequestDTO.builder().pageNum(1).pageSize(5).build());
	}

	@Test
	public void selectWithIngreAndFoodAndImageAndReplyRcpTest() {
		RecipeDTO dto = recipeMapper.selectWithIngreAndFoodAndImageAndReplyRcp(119L);
		log.info("selectWithIngreAndFoodAndImageAndReplyRcp dto : "+dto);
	}
	
	@Test
	public void selectByMEmailAndReplyCntTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder().pageNum(1).pageSize(5).keyword("user16@gmail.com").build();
		recipeMapper.selectByMEmailAndReplyCnt(pageRequestDTO);
	}

}

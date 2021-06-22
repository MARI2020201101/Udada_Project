package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.ourapp.udada.image.ImageDTO;
import org.ourapp.udada.recipe.RecipeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ImageMapperTest {
	
	@Autowired
	private ImageMapper imageMapper;
	
	@Test 
	public void insertTest() { 
		ImageDTO imageDTO = ImageDTO.builder()
				.iUuid("0acf82af-e12c-42sdsd98-8cb2-b370fff12d82SSSS")
				.iDir("2021/06/22")
				.iDiv("RCP")
				.iName("테스트2.JPG")
				.oriNo(11L)
				.build();
		
		imageMapper.insert(imageDTO);
				
		}
	
	@Test
	public void deleteTest() {
		imageMapper.delete(11L, "RCP");
	}

}

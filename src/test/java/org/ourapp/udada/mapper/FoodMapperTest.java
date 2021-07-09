package org.ourapp.udada.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
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
public class FoodMapperTest {

	@Autowired
	private FoodMapper foodMapper;
	
	@Test
	public void countAllTest() {
		
		log.info(foodMapper.countAll()+"");
		
	}
	
	/*
	 * @Test public void mapperTest() {
	 * 
	 * PageRequestDTO pageRequestDTO = PageRequestDTO.builder(
	 * ).pageNum(1).pageSize(5).keyword("포류").build();
	 * 
	 * foodMapper.getMjPagination(pageRequestDTO);
	 * 
	 * }
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Test
	public void selectByFNameTest() {
		
		foodMapper.selectByFName("초밥");
		
	}
	

}
